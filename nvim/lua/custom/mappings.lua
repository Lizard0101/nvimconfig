local M ={}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"]= {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python  = {
  plugin = true,
  n = {
    ["<leader>dp"] = {
      function ()
        require('dap_python').test_method()
      end
    }
  }
}
return M
