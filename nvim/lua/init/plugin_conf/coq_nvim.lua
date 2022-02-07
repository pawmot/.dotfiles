local coq_nvim = {}

function coq_nvim.register(packer_use)
  packer_use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    run = ':COQdeps',
    --config = function() require 'plugins.coq' end
  }
  packer_use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

  vim.g.coq_settings = {
    ['auto_start'] = 'shut-up'
  }

end

return coq_nvim

