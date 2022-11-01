-- {{@@ header() @@}}

local highlight = require('utils').highlight

vim.o.termguicolors = true

highlight('VertSplit', { bg = 'None' })

return {
  colors = {
    columbia_blue = '#9CDCFE',
    eclipse = '#3C3C3C',
    glabe_green = '#608B4E',
    grey = '#808080',
    light_grey = '#D4D4D4',
    lilac = '#C586C0',
    nero = '#262626',
    picton_blue = '#569CD6',
    straw = '#D7BA7D',

    -- Diagnostics
    equator = '#E0AF68',
    mountain_meadow = '#10B981',
    sunset_orange = '#F44747',

    -- GitSigns
    bordeaux = '#4b1818',
    clover = '#4b5632',
    raw_umber = '#6F490B',
  },
}
