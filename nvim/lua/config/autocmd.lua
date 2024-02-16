local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

local custom_format = function()
    if vim.bo.filetype == 'go' then return end
    vim.cmd('undojoin')
    if vim.bo.filetype == "templ" then
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

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    desc = "Auto-format Files after saving",
    callback = custom_format,
    group = autocmd_group,
})
