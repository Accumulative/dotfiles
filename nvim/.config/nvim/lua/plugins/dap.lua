return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mortepau/codicons.nvim",
  },
  config = function()
    require("nvim-dap-virtual-text").setup({
      commented = true,
    })

    if vim.fn.filereadable(".vscode/launch.json") then
      require("dap.ext.vscode").load_launchjs()
    end

    local dap, dapui = require("dap"), require("dapui")
    dapui.setup({}) -- use default
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end

    require("plugins.dap.python").setup()
    require("plugins.dap.lua").setup()

    local wk = require("which-key")
    wk.register({
      d = { "Debug" },
    }, { prefix = "<leader>", mode = "n", { silent = true } })
  end,
}
