return {
  "azorng/goose.nvim",
  config = function()
    require("goose").setup({
      keymap = {
        global = {
          toggle = "<leader>it", -- Open goose. Close if opened
          open_input = "<leader>ii", -- Opens and focuses on input window on insert mode
          open_input_new_session = "<leader>iI", -- Opens and focuses on input window on insert mode. Creates a new session
          open_output = "<leader>io", -- Opens and focuses on output window
          toggle_focus = "<leader>if", -- Toggle focus between goose and last window
          close = "<leader>iq", -- Close UI windows
          toggle_fullscreen = "<leader>iF", -- Toggle between normal and fullscreen mode
          select_session = "<leader>iss", -- Select and load a goose Session
          goose_mode_chat = "<leader>imc", -- Set goose mode to `chat`. (Tool calling disabled. No editor context besides selections)
          goose_mode_auto = "<leader>ima", -- Set goose mode to `auto`. (Default mode with full agent capabilities)
          configure_provider = "<leader>isp", -- Select Provider and model switch from predefined list
          diff_open = "<leader>id", -- Opens a diff tab of a modified file since the last goose prompt
          diff_next = "<leader>in", -- Navigate to next file diff
          diff_prev = "<leader>ip", -- Navigate to previous file diff
          diff_close = "<leader>ic", -- Close diff view tab and return to normal editing
          diff_revert_all = "<leader>ira", -- Revert all file changes since the last goose prompt
          diff_revert_this = "<leader>irt", -- Revert current file changes since the last goose prompt
        },
      },
      providers = {
        openai = {
          "gpt-4o",
        },
        ollama = {
          "qwen3:8b",
        },
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
      },
    },
  },
}
