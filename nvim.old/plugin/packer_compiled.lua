-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/pawmot/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/pawmot/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/pawmot/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/pawmot/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/pawmot/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n∑\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\20show_close_icon\1\28show_buffer_close_icons\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\18termguicolors\bopt\bvim\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    after = { "mason.nvim" },
    config = { "\27LJ\2\nÕ\1\0\0\4\0\t\0\0146\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\1=\1\2\0006\0\6\0'\2\a\0B\0\2\0024\2\3\0005\3\b\0>\3\1\2B\0\2\1K\0\1\0\1\0\3\bsrc\fcopilot\15short_name\bCOP\15accept_key\n<c-f>\vcoq_3p\frequire\31display.ghost_text.context\1\3\0\0\b ( \b ) \1\0\1\15auto_start\fshut-up\17coq_settings\6g\bvim\0" },
    loaded = true,
    only_config = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["crates.nvim"] = {
    after_files = { "/home/pawmot/.local/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { "\27LJ\2\nn\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\bsrc\1\0\0\bcoq\1\0\0\1\0\2\fenabled\2\tname\vcrates\nsetup\vcrates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nc\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\17AFTER_CURSOR\15hint_char1d\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\18BEFORE_CURSOR\15hint_char1c\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\17AFTER_CURSOR\15hint_char2d\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\18BEFORE_CURSOR\15hint_char2f\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\17AFTER_CURSOR\18hint_patternsg\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\18BEFORE_CURSOR\18hint_patternsc\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\17AFTER_CURSOR\15hint_wordsd\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\18BEFORE_CURSOR\15hint_wordsê\5\1\0\b\0\"\0L6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\0\0'\3\4\0B\1\2\0029\1\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0003\6\v\0005\a\f\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\r\0003\6\14\0005\a\15\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\16\0003\6\17\0005\a\18\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0003\6\20\0005\a\21\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\22\0003\6\23\0005\a\24\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\25\0003\6\26\0005\a\27\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\28\0003\6\29\0005\a\30\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\31\0003\6 \0005\a!\0B\2\5\0012\0\0ÄK\0\1\0\1\0\1\nremap\2\0\22<leader><leader>W\1\0\1\nremap\2\0\22<leader><leader>w\1\0\1\nremap\2\0\22<leader><leader>?\1\0\1\nremap\2\0\22<leader><leader>/\1\0\1\nremap\2\0\22<leader><leader>D\1\0\1\nremap\2\0\22<leader><leader>d\1\0\1\nremap\2\0\22<leader><leader>F\1\0\1\nremap\2\0\22<leader><leader>f\5\bset\vkeymap\bvim\18HintDirection\rhop.hint\1\0\2\27jump_on_sole_occurence\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nû\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\21filetype_exclude\1\2\0\0\14dashboard\1\0\2\25show_current_context\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  jester = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/jester",
    url = "https://github.com/David-Kunz/jester"
  },
  ["lsp_lines.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÄ\3\0\0\6\0\22\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\t\0005\4\b\0005\5\6\0>\5\1\0045\5\a\0>\5\2\4=\4\n\0035\4\v\0=\4\f\0034\4\0\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3=\3\18\0024\3\0\0=\3\19\0025\3\20\0=\3\21\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\ftabline\rsections\14lualine_z\1\3\0\0\rprogress\rlocation\14lualine_y\1\2\0\0\rencoding\14lualine_x\14lualine_c\1\2\0\0\17lsp_progress\14lualine_b\1\0\0\1\4\0\0\0\0\16diagnostics\1\2\1\0\rfiletype\14icon_only\2\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\1\0\1\ntheme\15tokyonight\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n.\0\1\2\0\2\0\0035\1\0\0=\0\1\1L\1\2\0\vbuffer\1\0\2\fnoremap\2\vsilent\2d\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprint@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimù\a\1\2\t\1$\0î\0016\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\1-\2\0\0\18\4\1\0B\2\2\0026\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\b\0006\a\0\0009\a\t\a9\a\n\a9\a\v\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\f\0006\a\0\0009\a\t\a9\a\n\a9\a\r\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\14\0006\a\0\0009\a\t\a9\a\n\a9\a\15\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\16\0006\a\0\0009\a\t\a9\a\n\a9\a\17\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\18\0006\a\0\0009\a\t\a9\a\n\a9\a\19\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\20\0006\a\0\0009\a\t\a9\a\n\a9\a\21\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\22\0006\a\0\0009\a\t\a9\a\n\a9\a\23\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\24\0003\a\25\0\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\26\0006\a\0\0009\a\t\a9\a\n\a9\a\27\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\28\0006\a\0\0009\a\t\a9\a\n\a9\a\29\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\30\0006\a\0\0009\a\t\a9\a\n\a9\a\31\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6 \0006\a\0\0009\a\t\a9\a\n\a9\a!\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\"\0003\a#\0\18\b\2\0B\3\5\1K\0\1\0\1¿\0\15<space>fmt\15references\agr\16code_action\14<space>ca\vrename\14<space>rn\20type_definition\r<space>D\0\14<space>wl\28remove_workspace_folder\14<space>wr\25add_workspace_folder\14<space>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimå\1\0\1\a\3\a\0\0156\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\1-\3\0\0009\3\3\0035\5\4\0-\6\1\0=\6\5\5-\6\2\0=\6\6\5B\3\2\0A\1\0\1K\0\1\0\4¿\2¿\3¿\nflags\14on_attach\1\0\0\28lsp_ensure_capabilities\nsetup\14lspconfig\frequireÅ\2\0\2\t\3\n\0&-\2\0\0\18\4\0\0\18\5\1\0B\2\3\1-\2\1\0\18\4\1\0B\2\2\0026\3\0\0009\3\1\0039\3\2\3'\5\3\0'\6\4\0-\a\2\0009\a\5\a9\a\5\a\18\b\2\0B\3\5\0016\3\0\0009\3\1\0039\3\2\3'\5\3\0'\6\6\0-\a\2\0009\a\a\a9\a\a\a\18\b\2\0B\3\5\0016\3\0\0009\3\1\0039\3\2\3'\5\3\0'\6\b\0-\a\2\0009\a\t\a9\a\t\a\18\b\2\0B\3\5\1K\0\1\0\1\0\2\0\0¿\14runnables\15<Leader>rr\22code_action_group\15<Leader>rc\18hover_actions\15<Leader>rh\6n\bset\vkeymap\bvim±\4\1\0\15\4\31\00046\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1'\4\4\0B\2\2\2\18\5\2\0009\3\5\2B\3\2\2\18\4\3\0'\5\6\0&\4\5\4\18\5\3\0'\6\a\0&\5\6\0059\6\b\0005\b\20\0-\t\0\0009\t\t\t5\v\v\0003\f\n\0=\f\f\v-\f\3\0=\f\r\v5\f\17\0005\r\15\0005\14\14\0=\14\16\r=\r\18\f=\f\19\vB\t\2\2=\t\21\b5\t\23\0005\n\22\0=\n\24\t=\t\25\b5\t\28\0006\n\0\0'\f\26\0B\n\2\0029\n\27\n\18\f\4\0\18\r\5\0B\n\3\2=\n\29\t=\t\30\bB\6\2\0012\0\0ÄK\0\1\0\4¿\2¿\1¿\3¿\bdap\fadapter\1\0\0\25get_codelldb_adapter\19rust-tools.dap\ntools\18hover_actions\1\0\0\1\0\1\15auto_focus\2\vserver\1\0\0\rsettings\18rust-analyzer\1\0\0\15inlayHints\1\0\0\1\0\1\18locationLinks\1\nflags\14on_attach\1\0\0\0\28lsp_ensure_capabilities\nsetup#/extension/lldb/lib/liblldb.so /extension/adapter/codelldb\21get_install_path\rcodelldb\16get_package\19mason-registry\15rust-tools\frequireÂ\1\0\0\t\3\16\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0-\2\0\0009\2\4\0025\4\5\0-\5\1\0=\5\6\4-\5\2\0=\5\a\0045\5\r\0005\6\v\0005\a\t\0005\b\b\0=\b\n\a=\a\f\6=\6\14\5=\5\15\4B\2\2\0A\0\0\1K\0\1\0\4¿\2¿\3¿\rsettings\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\nflags\14on_attach\1\0\0\28lsp_ensure_capabilities\nsetup\vlua_ls\14lspconfig\frequire©\1\0\0\6\3\t\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0009\0\2\0-\2\0\0009\2\5\0025\4\6\0-\5\1\0=\5\a\4-\5\2\0=\5\b\4B\2\2\0A\0\0\1K\0\1\0\4¿\2¿\3¿\nflags\14on_attach\1\0\0\28lsp_ensure_capabilities\ngopls\14lspconfig\nsetup\ago\frequireà\b\1\0\v\0-\0x6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0015\0\a\0006\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0006\5\b\0009\5\r\0059\5\14\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\15\0006\5\b\0009\5\r\0059\5\16\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\17\0006\5\b\0009\5\r\0059\5\18\5\18\6\0\0B\1\5\0013\1\19\0003\2\20\0005\3\21\0006\4\0\0'\6\22\0B\4\2\0026\5\0\0'\a\3\0B\5\2\0029\5\23\0055\a\26\0003\b\24\0>\b\1\a3\b\25\0=\b\27\a3\b\28\0=\b\29\a3\b\30\0=\b\31\aB\5\2\0016\5\0\0'\a \0B\5\2\0029\5\2\0054\a\0\0B\5\2\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b!\0'\t\"\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b#\0'\t$\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b%\0'\t&\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b'\0'\t(\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b)\0'\t*\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b+\0'\t,\0\18\n\0\0B\5\5\0012\0\0ÄK\0\1\0*<cmd>TroubleToggle lsp_references<cr>\15<leader>gR$<cmd>TroubleToggle quickfix<cr>\15<leader>qq#<cmd>TroubleToggle loclist<cr>\15<leader>ql0<cmd>TroubleToggle document_diagnostics<cr>\15<leader>qd1<cmd>TroubleToggle workspace_diagnostics<cr>\15<leader>qw\27<cmd>TroubleToggle<cr>\15<leader>qx\ftrouble\ngopls\0\vlua_ls\0\18rust_analyzer\1\0\0\0\0\19setup_handlers\bcoq\1\0\1\26debounce_text_changes\3ñ\1\0\0\15setloclist\r<space>Q\14goto_next\a]d\14goto_prev\15diagnostic\a[d\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\21ensure_installed\1\0\0\1\3\0\0\vlua_ls\18rust_analyzer\20mason-lspconfig\nsetup\nmason\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclosed\0\0\4\1\5\0\b6\0\0\0009\0\1\0009\0\2\0005\2\3\0-\3\0\0009\3\4\3B\0\3\1K\0\1\0\0¿\19set_breakpoint\1\0\1\vprompt\25Breakpoint condition\ninput\aui\bvim0\0\1\6\1\1\0\6-\1\0\0009\1\0\1,\3\4\0\18\5\0\0B\1\4\1K\0\1\0\0\0\19set_breakpointQ\1\0\4\1\5\0\a6\0\0\0009\0\1\0009\0\2\0005\2\3\0003\3\4\0B\0\3\1K\0\1\0\0¿\0\1\0\1\vprompt\24Log point message: \ninput\aui\bvimπ\5\1\0\n\0$\0]6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0009\3\5\0039\3\6\0033\4\b\0=\4\a\0039\3\4\0009\3\t\0039\3\n\0033\4\v\0=\4\a\0039\3\4\0009\3\t\0039\3\f\0033\4\r\0=\4\a\0039\3\14\2B\3\1\0015\3\15\0006\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\20\0009\b\21\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\22\0003\b\23\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\24\0003\b\25\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\26\0009\b\27\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\28\0009\b\29\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\30\0009\b\31\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a \0009\b!\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\"\0009\b#\0\18\t\3\0B\4\5\0012\0\0ÄK\0\1\0\14terminate\14<space>dt\rstep_out\14<space>do\14step_over\14<space>ds\14step_into\14<space>di\rcontinue\14<space>dc\0\14<space>dl\0\14<space>dv\22toggle_breakpoint\14<space>db\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\nsetup\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\26nvim-dap-virtual-text\ndapui\bdap\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treehopper"] = {
    config = { "\27LJ\2\nﬂ\1\0\0\a\0\f\0\0206\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0'\5\a\0005\6\b\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\t\0'\4\6\0'\5\n\0005\6\v\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2%:lua require(\"tsht\").nodes()<CR>\6x\1\0\1\vsilent\2*:<C-U>lua require(\"tsht\").nodes()<CR>\6m\6o\bset\vkeymap\bvim\ttsht\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-treehopper",
    url = "https://github.com/mfussenegger/nvim-treehopper"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÿ\2\0\1\6\0\15\0\0216\1\0\0'\3\1\0B\1\2\0029\1\2\0015\3\3\0\15\0\0\0X\4\2Ä'\4\4\0X\5\1Ä'\4\5\0=\4\6\0035\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\14\3B\1\2\1K\0\1\0\rpatterns\15typescript\1\2\0\0\21export_statement\trust\1\3\0\0\14impl_item\nmatch\fdefault\1\0\0\1\14\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\telse\16else_clause\vswitch\tcase\14interface\vstruct\tenum\tmode\vcursor\ftopline\1\0\3\14max_lines\3\0\venable\2\rthrottle\2\nsetup\23treesitter-context\frequire'\0\0\3\2\0\0\a-\0\0\0\19\0\0\0.\0\0\0-\0\1\0-\2\0\0B\0\2\1K\0\1\0\3Ä\1¿ú\6\1\0\n\0#\00046\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0005\5\19\0=\5\20\4=\4\21\0035\4\22\0004\5\0\0=\5\23\4=\4\24\3B\1\2\0013\1\25\0005\2\26\0+\3\1\0\18\4\1\0\18\6\3\0B\4\2\0016\4\27\0009\4\28\0049\4\29\4'\6\30\0'\a\31\0003\b \0\18\t\2\0B\4\5\0016\4\27\0009\4\28\0049\4\29\4'\6\30\0'\a!\0'\b\"\0\18\t\2\0B\4\5\0012\0\0ÄK\0\1\0000:TSDisable rainbow<cr>:TSEnable rainbow<cr>\14<space>cr\0\14<space>cf\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\0\15playground\fdisable\1\0\3\15updatetime\3\25\20persist_queries\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\14<Leader>s\21node_incremental\6n\22scope_incremental\6s\21node_decremental\6N\1\0\1\venable\2\fautotag\1\0\1\venable\2\frainbow\1\0\2\18extended_mode\2\venable\2\26context_commentstring\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\2\17auto_install\2\17sync_install\2\1\4\0\0\trust\15typescript\blua\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nû\1\0\0\b\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0015\1\3\0006\2\4\0009\2\5\0029\2\6\2'\4\a\0'\5\b\0009\6\t\0\18\a\1\0B\2\5\1K\0\1\0\19toggle_outline\r<space>S\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nò\4\0\0\b\0\29\00056\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\v\0005\4\t\0005\5\b\0=\5\n\4=\4\f\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0006\1\0\0'\3\17\0B\1\2\2\18\2\0\0'\4\18\0'\5\19\0009\6\f\0014\a\0\0B\2\5\1\18\2\0\0'\4\18\0'\5\20\0009\6\21\0014\a\0\0B\2\5\1\18\2\0\0'\4\18\0'\5\22\0009\6\23\0014\a\0\0B\2\5\1\18\2\0\0'\4\18\0'\5\24\0009\6\25\0014\a\0\0B\2\5\1\18\2\0\0'\4\18\0'\5\26\0'\6\27\0005\a\28\0B\2\5\1K\0\1\0\1\0\1\fnoremap\2\15:Marks<cr>\14<leader>m\14help_tags\15<leader>fh\14live_grep\15<leader>fg\fbuffers\15<leader>fb\15<leader>ff\6n\22telescope.builtin\bset\vkeymap\bvim\fpickers\15find_files\1\0\0\17find_command\1\0\2\20layout_strategy\rvertical\vhidden\2\1\5\0\0\afd\23--strip-cwd-prefix\v--type\6f\rdefaults\1\0\0\25file_ignore_patterns\1\0\0\1\2\0\0\v^.git/\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15ToggleTerm\bcmd\bvim√\1\1\0\a\0\r\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0015\0\6\0006\1\a\0009\1\b\0019\1\t\1'\3\n\0'\4\v\0003\5\f\0\18\6\0\0B\1\5\1K\0\1\0\0\n<C-\\>\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\15float_opts\1\0\1\vborder\vsingle\1\0\1\14direction\nfloat\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\nâ\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0*        colorscheme tokyonight\n      \bcmd\bvim\1\0\1\nstyle\nnight\nsetup\15tokyonight\frequire\0" },
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/pawmot/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n∑\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\20show_close_icon\1\28show_buffer_close_icons\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\18termguicolors\bopt\bvim\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\nâ\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0*        colorscheme tokyonight\n      \bcmd\bvim\1\0\1\nstyle\nnight\nsetup\15tokyonight\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
try_loadstring("\27LJ\2\nÕ\1\0\0\4\0\t\0\0146\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\1=\1\2\0006\0\6\0'\2\a\0B\0\2\0024\2\3\0005\3\b\0>\3\1\2B\0\2\1K\0\1\0\1\0\3\bsrc\fcopilot\15short_name\bCOP\15accept_key\n<c-f>\vcoq_3p\frequire\31display.ghost_text.context\1\3\0\0\b ( \b ) \1\0\1\15auto_start\fshut-up\17coq_settings\6g\bvim\0", "config", "coq_nvim")
time([[Config for coq_nvim]], false)
-- Config for: nvim-treehopper
time([[Config for nvim-treehopper]], true)
try_loadstring("\27LJ\2\nﬂ\1\0\0\a\0\f\0\0206\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0'\5\a\0005\6\b\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\t\0'\4\6\0'\5\n\0005\6\v\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2%:lua require(\"tsht\").nodes()<CR>\6x\1\0\1\vsilent\2*:<C-U>lua require(\"tsht\").nodes()<CR>\6m\6o\bset\vkeymap\bvim\ttsht\frequire\0", "config", "nvim-treehopper")
time([[Config for nvim-treehopper]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\17AFTER_CURSOR\15hint_char1d\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\18BEFORE_CURSOR\15hint_char1c\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\17AFTER_CURSOR\15hint_char2d\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\18BEFORE_CURSOR\15hint_char2f\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\17AFTER_CURSOR\18hint_patternsg\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\18BEFORE_CURSOR\18hint_patternsc\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\17AFTER_CURSOR\15hint_wordsd\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0¿\1¿\14direction\1\0\1\22current_line_only\1\18BEFORE_CURSOR\15hint_wordsê\5\1\0\b\0\"\0L6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\0\0'\3\4\0B\1\2\0029\1\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0003\6\v\0005\a\f\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\r\0003\6\14\0005\a\15\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\16\0003\6\17\0005\a\18\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0003\6\20\0005\a\21\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\22\0003\6\23\0005\a\24\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\25\0003\6\26\0005\a\27\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\28\0003\6\29\0005\a\30\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\31\0003\6 \0005\a!\0B\2\5\0012\0\0ÄK\0\1\0\1\0\1\nremap\2\0\22<leader><leader>W\1\0\1\nremap\2\0\22<leader><leader>w\1\0\1\nremap\2\0\22<leader><leader>?\1\0\1\nremap\2\0\22<leader><leader>/\1\0\1\nremap\2\0\22<leader><leader>D\1\0\1\nremap\2\0\22<leader><leader>d\1\0\1\nremap\2\0\22<leader><leader>F\1\0\1\nremap\2\0\22<leader><leader>f\5\bset\vkeymap\bvim\18HintDirection\rhop.hint\1\0\2\27jump_on_sole_occurence\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15ToggleTerm\bcmd\bvim√\1\1\0\a\0\r\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0015\0\6\0006\1\a\0009\1\b\0019\1\t\1'\3\n\0'\4\v\0003\5\f\0\18\6\0\0B\1\5\1K\0\1\0\0\n<C-\\>\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\15float_opts\1\0\1\vborder\vsingle\1\0\1\14direction\nfloat\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÿ\2\0\1\6\0\15\0\0216\1\0\0'\3\1\0B\1\2\0029\1\2\0015\3\3\0\15\0\0\0X\4\2Ä'\4\4\0X\5\1Ä'\4\5\0=\4\6\0035\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\14\3B\1\2\1K\0\1\0\rpatterns\15typescript\1\2\0\0\21export_statement\trust\1\3\0\0\14impl_item\nmatch\fdefault\1\0\0\1\14\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\telse\16else_clause\vswitch\tcase\14interface\vstruct\tenum\tmode\vcursor\ftopline\1\0\3\14max_lines\3\0\venable\2\rthrottle\2\nsetup\23treesitter-context\frequire'\0\0\3\2\0\0\a-\0\0\0\19\0\0\0.\0\0\0-\0\1\0-\2\0\0B\0\2\1K\0\1\0\3Ä\1¿ú\6\1\0\n\0#\00046\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0005\5\19\0=\5\20\4=\4\21\0035\4\22\0004\5\0\0=\5\23\4=\4\24\3B\1\2\0013\1\25\0005\2\26\0+\3\1\0\18\4\1\0\18\6\3\0B\4\2\0016\4\27\0009\4\28\0049\4\29\4'\6\30\0'\a\31\0003\b \0\18\t\2\0B\4\5\0016\4\27\0009\4\28\0049\4\29\4'\6\30\0'\a!\0'\b\"\0\18\t\2\0B\4\5\0012\0\0ÄK\0\1\0000:TSDisable rainbow<cr>:TSEnable rainbow<cr>\14<space>cr\0\14<space>cf\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\0\15playground\fdisable\1\0\3\15updatetime\3\25\20persist_queries\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\14<Leader>s\21node_incremental\6n\22scope_incremental\6s\21node_decremental\6N\1\0\1\venable\2\fautotag\1\0\1\venable\2\frainbow\1\0\2\18extended_mode\2\venable\2\26context_commentstring\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\2\17auto_install\2\17sync_install\2\1\4\0\0\trust\15typescript\blua\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÄ\3\0\0\6\0\22\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\t\0005\4\b\0005\5\6\0>\5\1\0045\5\a\0>\5\2\4=\4\n\0035\4\v\0=\4\f\0034\4\0\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3=\3\18\0024\3\0\0=\3\19\0025\3\20\0=\3\21\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\ftabline\rsections\14lualine_z\1\3\0\0\rprogress\rlocation\14lualine_y\1\2\0\0\rencoding\14lualine_x\14lualine_c\1\2\0\0\17lsp_progress\14lualine_b\1\0\0\1\4\0\0\0\0\16diagnostics\1\2\1\0\rfiletype\14icon_only\2\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\1\0\1\ntheme\15tokyonight\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nû\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\21filetype_exclude\1\2\0\0\14dashboard\1\0\2\25show_current_context\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nò\4\0\0\b\0\29\00056\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\v\0005\4\t\0005\5\b\0=\5\n\4=\4\f\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0006\1\0\0'\3\17\0B\1\2\2\18\2\0\0'\4\18\0'\5\19\0009\6\f\0014\a\0\0B\2\5\1\18\2\0\0'\4\18\0'\5\20\0009\6\21\0014\a\0\0B\2\5\1\18\2\0\0'\4\18\0'\5\22\0009\6\23\0014\a\0\0B\2\5\1\18\2\0\0'\4\18\0'\5\24\0009\6\25\0014\a\0\0B\2\5\1\18\2\0\0'\4\18\0'\5\26\0'\6\27\0005\a\28\0B\2\5\1K\0\1\0\1\0\1\fnoremap\2\15:Marks<cr>\14<leader>m\14help_tags\15<leader>fh\14live_grep\15<leader>fg\fbuffers\15<leader>fb\15<leader>ff\6n\22telescope.builtin\bset\vkeymap\bvim\fpickers\15find_files\1\0\0\17find_command\1\0\2\20layout_strategy\rvertical\vhidden\2\1\5\0\0\afd\23--strip-cwd-prefix\v--type\6f\rdefaults\1\0\0\25file_ignore_patterns\1\0\0\1\2\0\0\v^.git/\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nû\1\0\0\b\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0015\1\3\0006\2\4\0009\2\5\0029\2\6\2'\4\a\0'\5\b\0009\6\t\0\18\a\1\0B\2\5\1K\0\1\0\19toggle_outline\r<space>S\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: jester
time([[Config for jester]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "jester")
time([[Config for jester]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclosed\0\0\4\1\5\0\b6\0\0\0009\0\1\0009\0\2\0005\2\3\0-\3\0\0009\3\4\3B\0\3\1K\0\1\0\0¿\19set_breakpoint\1\0\1\vprompt\25Breakpoint condition\ninput\aui\bvim0\0\1\6\1\1\0\6-\1\0\0009\1\0\1,\3\4\0\18\5\0\0B\1\4\1K\0\1\0\0\0\19set_breakpointQ\1\0\4\1\5\0\a6\0\0\0009\0\1\0009\0\2\0005\2\3\0003\3\4\0B\0\3\1K\0\1\0\0¿\0\1\0\1\vprompt\24Log point message: \ninput\aui\bvimπ\5\1\0\n\0$\0]6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0009\3\5\0039\3\6\0033\4\b\0=\4\a\0039\3\4\0009\3\t\0039\3\n\0033\4\v\0=\4\a\0039\3\4\0009\3\t\0039\3\f\0033\4\r\0=\4\a\0039\3\14\2B\3\1\0015\3\15\0006\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\20\0009\b\21\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\22\0003\b\23\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\24\0003\b\25\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\26\0009\b\27\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\28\0009\b\29\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\30\0009\b\31\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a \0009\b!\0\18\t\3\0B\4\5\0016\4\16\0009\4\17\0049\4\18\4'\6\19\0'\a\"\0009\b#\0\18\t\3\0B\4\5\0012\0\0ÄK\0\1\0\14terminate\14<space>dt\rstep_out\14<space>do\14step_over\14<space>ds\14step_into\14<space>di\rcontinue\14<space>dc\0\14<space>dl\0\14<space>dv\22toggle_breakpoint\14<space>db\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\nsetup\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\26nvim-dap-virtual-text\ndapui\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd mason.nvim ]]

-- Config for: mason.nvim
try_loadstring("\27LJ\2\n.\0\1\2\0\2\0\0035\1\0\0=\0\1\1L\1\2\0\vbuffer\1\0\2\fnoremap\2\vsilent\2d\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprint@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimù\a\1\2\t\1$\0î\0016\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\1-\2\0\0\18\4\1\0B\2\2\0026\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\b\0006\a\0\0009\a\t\a9\a\n\a9\a\v\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\f\0006\a\0\0009\a\t\a9\a\n\a9\a\r\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\14\0006\a\0\0009\a\t\a9\a\n\a9\a\15\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\16\0006\a\0\0009\a\t\a9\a\n\a9\a\17\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\18\0006\a\0\0009\a\t\a9\a\n\a9\a\19\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\20\0006\a\0\0009\a\t\a9\a\n\a9\a\21\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\22\0006\a\0\0009\a\t\a9\a\n\a9\a\23\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\24\0003\a\25\0\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\26\0006\a\0\0009\a\t\a9\a\n\a9\a\27\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\28\0006\a\0\0009\a\t\a9\a\n\a9\a\29\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\30\0006\a\0\0009\a\t\a9\a\n\a9\a\31\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6 \0006\a\0\0009\a\t\a9\a\n\a9\a!\a\18\b\2\0B\3\5\0016\3\0\0009\3\5\0039\3\6\3'\5\a\0'\6\"\0003\a#\0\18\b\2\0B\3\5\1K\0\1\0\1¿\0\15<space>fmt\15references\agr\16code_action\14<space>ca\vrename\14<space>rn\20type_definition\r<space>D\0\14<space>wl\28remove_workspace_folder\14<space>wr\25add_workspace_folder\14<space>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimå\1\0\1\a\3\a\0\0156\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\1-\3\0\0009\3\3\0035\5\4\0-\6\1\0=\6\5\5-\6\2\0=\6\6\5B\3\2\0A\1\0\1K\0\1\0\4¿\2¿\3¿\nflags\14on_attach\1\0\0\28lsp_ensure_capabilities\nsetup\14lspconfig\frequireÅ\2\0\2\t\3\n\0&-\2\0\0\18\4\0\0\18\5\1\0B\2\3\1-\2\1\0\18\4\1\0B\2\2\0026\3\0\0009\3\1\0039\3\2\3'\5\3\0'\6\4\0-\a\2\0009\a\5\a9\a\5\a\18\b\2\0B\3\5\0016\3\0\0009\3\1\0039\3\2\3'\5\3\0'\6\6\0-\a\2\0009\a\a\a9\a\a\a\18\b\2\0B\3\5\0016\3\0\0009\3\1\0039\3\2\3'\5\3\0'\6\b\0-\a\2\0009\a\t\a9\a\t\a\18\b\2\0B\3\5\1K\0\1\0\1\0\2\0\0¿\14runnables\15<Leader>rr\22code_action_group\15<Leader>rc\18hover_actions\15<Leader>rh\6n\bset\vkeymap\bvim±\4\1\0\15\4\31\00046\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1'\4\4\0B\2\2\2\18\5\2\0009\3\5\2B\3\2\2\18\4\3\0'\5\6\0&\4\5\4\18\5\3\0'\6\a\0&\5\6\0059\6\b\0005\b\20\0-\t\0\0009\t\t\t5\v\v\0003\f\n\0=\f\f\v-\f\3\0=\f\r\v5\f\17\0005\r\15\0005\14\14\0=\14\16\r=\r\18\f=\f\19\vB\t\2\2=\t\21\b5\t\23\0005\n\22\0=\n\24\t=\t\25\b5\t\28\0006\n\0\0'\f\26\0B\n\2\0029\n\27\n\18\f\4\0\18\r\5\0B\n\3\2=\n\29\t=\t\30\bB\6\2\0012\0\0ÄK\0\1\0\4¿\2¿\1¿\3¿\bdap\fadapter\1\0\0\25get_codelldb_adapter\19rust-tools.dap\ntools\18hover_actions\1\0\0\1\0\1\15auto_focus\2\vserver\1\0\0\rsettings\18rust-analyzer\1\0\0\15inlayHints\1\0\0\1\0\1\18locationLinks\1\nflags\14on_attach\1\0\0\0\28lsp_ensure_capabilities\nsetup#/extension/lldb/lib/liblldb.so /extension/adapter/codelldb\21get_install_path\rcodelldb\16get_package\19mason-registry\15rust-tools\frequireÂ\1\0\0\t\3\16\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0-\2\0\0009\2\4\0025\4\5\0-\5\1\0=\5\6\4-\5\2\0=\5\a\0045\5\r\0005\6\v\0005\a\t\0005\b\b\0=\b\n\a=\a\f\6=\6\14\5=\5\15\4B\2\2\0A\0\0\1K\0\1\0\4¿\2¿\3¿\rsettings\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\nflags\14on_attach\1\0\0\28lsp_ensure_capabilities\nsetup\vlua_ls\14lspconfig\frequire©\1\0\0\6\3\t\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0009\0\2\0-\2\0\0009\2\5\0025\4\6\0-\5\1\0=\5\a\4-\5\2\0=\5\b\4B\2\2\0A\0\0\1K\0\1\0\4¿\2¿\3¿\nflags\14on_attach\1\0\0\28lsp_ensure_capabilities\ngopls\14lspconfig\nsetup\ago\frequireà\b\1\0\v\0-\0x6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0015\0\a\0006\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0006\5\b\0009\5\r\0059\5\14\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\15\0006\5\b\0009\5\r\0059\5\16\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\17\0006\5\b\0009\5\r\0059\5\18\5\18\6\0\0B\1\5\0013\1\19\0003\2\20\0005\3\21\0006\4\0\0'\6\22\0B\4\2\0026\5\0\0'\a\3\0B\5\2\0029\5\23\0055\a\26\0003\b\24\0>\b\1\a3\b\25\0=\b\27\a3\b\28\0=\b\29\a3\b\30\0=\b\31\aB\5\2\0016\5\0\0'\a \0B\5\2\0029\5\2\0054\a\0\0B\5\2\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b!\0'\t\"\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b#\0'\t$\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b%\0'\t&\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b'\0'\t(\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b)\0'\t*\0\18\n\0\0B\5\5\0016\5\b\0009\5\t\0059\5\n\5'\a\v\0'\b+\0'\t,\0\18\n\0\0B\5\5\0012\0\0ÄK\0\1\0*<cmd>TroubleToggle lsp_references<cr>\15<leader>gR$<cmd>TroubleToggle quickfix<cr>\15<leader>qq#<cmd>TroubleToggle loclist<cr>\15<leader>ql0<cmd>TroubleToggle document_diagnostics<cr>\15<leader>qd1<cmd>TroubleToggle workspace_diagnostics<cr>\15<leader>qw\27<cmd>TroubleToggle<cr>\15<leader>qx\ftrouble\ngopls\0\vlua_ls\0\18rust_analyzer\1\0\0\0\0\19setup_handlers\bcoq\1\0\1\26debounce_text_changes\3ñ\1\0\0\15setloclist\r<space>Q\14goto_next\a]d\14goto_prev\15diagnostic\a[d\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\21ensure_installed\1\0\0\1\3\0\0\vlua_ls\18rust_analyzer\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au Bufread Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "Bufread Cargo.toml" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
