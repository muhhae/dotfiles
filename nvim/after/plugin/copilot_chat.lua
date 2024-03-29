require('CopilotChat').setup {
    prompts = {
        Explain = "Explain how it works in details",
        Review = "Review the following code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor the code to improve clarity and readability.",
    },
}

local function dontCall()
    vim.g.CopilotChatBuffer = nil
    print(vim.g.CopilotChatBuffer)
end

function CChat()
    local chat_input = vim.fn.input("Copilot  ", "")
    local chat_buffer = vim.g.CopilotChatBuffer
    if chat_buffer == nil then
        vim.cmd('tabnew Copilot Chat')
        vim.cmd('CopilotChat ' .. chat_input)
        vim.g.CopilotChatBuffer = vim.fn.bufnr()
    else
        vim.cmd('tab sb ' .. chat_buffer)
        vim.cmd('CopilotChat ' .. chat_input)
    end
end

vim.keymap.set("n", "<leader>ca", ":CopilotChat ", { desc = "Copilot Chat" })
vim.keymap.set("n", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "Copilot Chat Explain" })
vim.keymap.set("n", "<leader>ct", "<cmd>CopilotChatTest<CR>", { desc = "Copilot Chat Test" })
vim.keymap.set("n", "<leader>cr", "<cmd>CopilotChatRefactor<CR>", { desc = "Copilot Chat Refactor" })

vim.keymap.set("v", "<leader>ca", "y:CopilotChat ", { desc = "Copilot Chat" })
vim.keymap.set("v", "<leader>ce", "y<cmd>CopilotChatExplain<CR>", { desc = "Copilot Chat Explain" })
vim.keymap.set("v", "<leader>ct", "y<cmd>CopilotChatTest<CR>", { desc = "Copilot Chat Test" })
vim.keymap.set("v", "<leader>cr", "y<cmd>CopilotChatRefactor<CR>", { desc = "Copilot Chat Refactor" })

vim.keymap.set({ "n", "v" }, "<leader>ccq",
    function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
        end
    end, {
        desc = "CopilotChat - Quick chat"
    }
)
vim.keymap.set({ "n", "v" }, "<leader>ccv", "<cmd>CopilotChatVsplitToggle<cr>", { desc = "CopilotChat - Toggle Vsplit" })
