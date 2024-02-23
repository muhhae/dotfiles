vim.api.nvim_create_user_command('Ascii', function()
    require 'ascii'.preview()
end, {})
