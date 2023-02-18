local dashboard = {}

function dashboard.register(packer_use)
  packer_use {
    'glepnir/dashboard-nvim',
    config = function()
      vim.g.dashboard_default_executive = 'telescope'
    end
  }
end

return dashboard

