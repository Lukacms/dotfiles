-- {{@@ header() @@}}

return {
  name = 'clangd',
  cmd = { 'clangd', '--background-index', '-clang-tidy' },
  filetype = { 'c', 'cpp', 'objc', 'objcpp' },
}
