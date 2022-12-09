local M = {}

function M.register(packer_use)
  packer_use {
    'mfussenegger/nvim-dap',
    requires = {
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui'
    },
    config = function()
      local dap, dapui, dapvt = require('dap'), require('dapui'), require('nvim-dap-virtual-text')
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      dapvt.setup()

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<space>db', dap.toggle_breakpoint, opts)
      vim.keymap.set('n', '<space>dc', dap.continue, opts)
      vim.keymap.set('n', '<space>di', dap.step_into, opts)
      vim.keymap.set('n', '<space>ds', dap.step_over, opts)
      vim.keymap.set('n', '<space>do', dap.step_out, opts)
      vim.keymap.set('n', '<space>dt', dap.terminate, opts)
    end
  }
end

return M
