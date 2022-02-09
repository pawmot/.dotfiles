local dashboard = {}

function dashboard.register(packer_use)
  packer_use 'glepnir/dashboard-nvim'

  vim.g.dashboard_default_executive = 'telescope'
end

return dashboard

