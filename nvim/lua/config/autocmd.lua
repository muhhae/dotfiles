local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

local custom_format = function()
    vim.cmd('undojoin')
    if vim.bo.filetype == 'go' then
        return
    elseif vim.bo.filetype == 'python' then
        print("Using black")
        local bufnr = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local cmd = "black " .. vim.fn.shellescape(filename)
        vim.fn.jobstart(cmd, {
            on_exit = function()
                -- reload the buffer only if it's still the current buffer
                if vim.api.nvim_get_current_buf() == bufnr then
                    vim.cmd('e!')
                end
            end,
        })
    elseif vim.bo.filetype == "templ" then
        local bufnr = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local cmd = "templ fmt " .. vim.fn.shellescape(filename)
        vim.fn.jobstart(cmd, {
            on_exit = function()
                -- reload the buffer only if it's still the current buffer
                if vim.api.nvim_get_current_buf() == bufnr then
                    vim.cmd('e!')
                end
            end,
        })
    else
        vim.lsp.buf.format()
    end
end

vim.keymap.set("n", "<leader>f", custom_format)
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    desc = "Auto-format Files after saving",
    callback = custom_format,
    group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    desc = "hide tilde ~",
    callback = function()
        -- print("Hiding tilde ~, go to autocmd.lua to disable")
        vim.wo.fillchars = 'eob: '
        vim.cmd('highlight SignColumn guibg=transparent')
    end,
    group = autocmd_group,
})

vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
    callback = function()
        require("persistence").load()
    end,
    nested = true,
})
