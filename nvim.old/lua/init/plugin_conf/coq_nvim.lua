local coq_nvim = {}

function coq_nvim.register(packer_use)
  packer_use {
    'ms-jpq/coq_nvim',
    requires = {
      { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
      { 'ms-jpq/coq.thirdparty', branch = '3p' }
    },
    branch = 'coq',
    run = ':COQdeps',
    config = function()
      vim.g.coq_settings = {
        ['auto_start'] = 'shut-up',
        ['display.ghost_text.context'] = {' ( ', ' ) '}
      }

      require('coq_3p') {
        { src = 'copilot', short_name = 'COP', accept_key = '<c-f>' }
      }
    end
  }
end

return coq_nvim

