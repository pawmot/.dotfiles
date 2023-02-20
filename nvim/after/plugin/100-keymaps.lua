local ok, wk = pcall(require, 'which-key')

if not ok then
  print('could not load which-key')
else
  wk.setup {}
end
