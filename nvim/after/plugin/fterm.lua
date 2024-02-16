require('FTerm').setup {
    ---Filetype of the terminal buffer
    ---@type string
    ft = 'FTerm',

    ---Command to run inside the terminal
    ---NOTE: if given string[], it will skip the shell and directly executes the command
    ---@type fun():(string|string[])|string|string[]
    cmd = os.getenv('SHELL'),

    ---Neovim's native window border. See `:h nvim_open_win` for more configuration options.
    border = 'rounded',

    ---Close the terminal as soon as shell/command exits.
    ---Disabling this will mimic the native terminal behaviour.
    ---@type boolean
    auto_close = false,

    ---Highlight group for the terminal. See `:h winhl`
    ---@type string
    hl = 'Normal',

    ---Transparency of the floating window. See `:h winblend`
    ---@type integer
    blend = 0,

    ---Object containing the terminal window dimensions.
    ---The value for each field should be between `0` and `1`
    ---@type table<string,number>
    dimensions = {
        height = 0.8, -- Height of the terminal window
        width = 0.8,  -- Width of the terminal window
        x = 0.5,      -- X axis of the terminal window
        y = 0.5,      -- Y axis of the terminal window
    },

    ---Replace instead of extend the current environment with `env`.
    ---See `:h jobstart-options`
    ---@type boolean
    clear_env = false,

    ---Map of environment variables extending the current environment.
    ---See `:h jobstart-options`
    ---@type table<string,string>|nil
    env = nil,

    ---Callback invoked when the terminal exits.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_exit = nil,

    ---Callback invoked when the terminal emits stdout data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stdout = nil,

    ---Callback invoked when the terminal emits stderr data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stderr = nil,
}

vim.keymap.set('n', '<f2>', require("FTerm").toggle)
vim.keymap.set('t', '<f2>', require("FTerm").toggle)

local function run(cmd)
    print("Running", cmd)
    require('FTerm').scratch {
        cmd = cmd,
        border = 'rounded'
    }
end

local function rust_runner()
    local function get_cargo_bins()
        local cmd =
        "cargo metadata --format-version=1 --no-deps | jq -r '.packages[0].targets[] | select(.kind[0]==\"bin\") | .name'"
        local result = vim.fn.systemlist(cmd)
        if vim.v.shell_error == 0 then
            return result
        else
            return nil, table.concat(result, "\n")
        end
    end

    local function get_default_run()
        local cmd = "cargo metadata --format-version=1 --no-deps | jq -r '.packages[0].default_run'"
        local result = vim.fn.systemlist(cmd)[1]
        if vim.v.shell_error == 0 then
            return result
        else
            return nil, table.concat(result, "\n")
        end
    end

    local bins, err = get_cargo_bins()
    local default_run = get_default_run()
    if bins then
        vim.ui.select(
            bins, {
                prompt = 'Choose binary to run',
                format_item = function(item)
                    if item == default_run then
                        return " " .. item .. " (default)"
                    end
                    return " " .. item
                end,
            }, function(choice)
                if choice == nil then return end
                run("cargo run --bin " .. choice)
            end)
    else
        print("Error getting binaries:", err)
    end
end

local function go_runner()
    local cmd = "grep -w 'func main()' -r -l"
    local result = vim.fn.systemlist(cmd)

    if vim.v.shell_error ~= 0 then
        print("Error : cannot find func main() in " .. vim.fn.getcwd())
        return
    end

    if result[2] == nil then
        run('go run ' .. result[1])
        return
    end

    vim.ui.select(
        result, {
            prompt = 'Choose func main() to run',
            format_item = function(item)
                return " " .. item
            end,
        }, function(choice)
            if choice == nil then return end
            run('go run ' .. choice)
        end
    )
end

local runners = {
    lua = function(buf)
        return 'lua ' .. buf
    end,
    javascript = function(buf)
        return 'bun ' .. buf
    end,
    typescript = function(buf)
        return 'bun ' .. buf
    end,
    python = function(buf)
        return 'python3.12 ' .. buf
    end,
    go = go_runner,
    templ = go_runner,
    rust = rust_runner,
    cpp = function(buf)
        return 'g++ -o tmp ' .. buf .. ' && ./tmp && rm ./tmp'
    end,
    c = function(buf)
        return 'gcc -o tmp ' .. buf .. ' && ./tmp && rm ./tmp'
    end,
}

vim.keymap.set('n', '<leader><Enter>', function()
    local cmd = vim.fn.systemlist('cat .vimrunner')
    if vim.v.shell_error == 0 and cmd[1] ~= "" then
        run(cmd[1])
        return
    end

    local buf = vim.api.nvim_buf_get_name(0)
    local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
    local runner = runners[filetype]
    if runner == nil then
        return
    end
    local command = runner(buf)
    if command ~= nil then
        run(command)
    end
end)
