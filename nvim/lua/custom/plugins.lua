local plugins ={
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"]= function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"]= function ()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "vim-crystal/vim-crystal",
    ft = "crystal",
    config = function(_)
      vim.g.crystal_auto_format=1
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "lervag/vimtex",
    lazy=false,
    init=function ()
    vim.g.vimtex_syntax_enabled = 1
  end
  },
  {
    "williamboman/mason.nvim",
    opts ={
      ensure_installed ={
        "debugpy",
        "black",
        "mypy",
        "ruff",
        "pyright",
        "texlab",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft={"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
}
return plugins
