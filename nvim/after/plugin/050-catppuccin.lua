local ok, catppuccin = pcall(require, 'catppuccin')

if not ok then
  print('could not load catppuccin')
else
  --vim.cmd.colorscheme 'catppuccin-mocha'
end
