-- {{@@ header() @@}}
return {
  name = 'texlab',
  settings = {
    texlab = {
      build = {
        executable = 'tectonic',
        args = {
          '%f',
          '--synctex',
          '--keep-logs',
          '--keep-intermediates',
        },
      },
      formatterLineLength = 80,
      latexFormatter = 'latexindent',
      latexindent = {
        modifyLineBreaks = true,
      },
    },
  },
}
