local coq_nvim = {}

function coq_nvim.register(packer_use)
  packer_use {
    'ms-jpq/coq_nvim',
    requires = { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
    branch = 'coq',
    run = ':COQdeps',
    config = function()
      vim.g.coq_settings = {
        ['auto_start'] = 'shut-up'
      }
    end
  }
end

return coq_nvim

