return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "2018.11.29",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 7,
  height = 5,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 4,
  nextobjectid = 10,
  properties = {},
  tilesets = {
    {
      name = "arena",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "Sprites/Maps/Arena/arena.png",
      imagewidth = 512,
      imageheight = 368,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 176,
      tiles = {}
    },
    {
      name = "arena",
      firstgid = 177,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "Sprites/Maps/Arena/arena.png",
      imagewidth = 512,
      imageheight = 368,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 176,
      tiles = {}
    },
    {
      name = "arena",
      firstgid = 353,
      filename = "arena.tsx",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 7,
      image = "arena(2).png",
      imagewidth = 480,
      imageheight = 334,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      terrains = {},
      tilecount = 35,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 2,
      name = "Camada - Objetos",
      x = 0,
      y = 0,
      width = 7,
      height = 5,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        353, 354, 355, 356, 357, 358, 359,
        360, 361, 362, 363, 364, 365, 366,
        367, 368, 369, 370, 371, 372, 373,
        374, 375, 376, 377, 378, 379, 380,
        381, 382, 383, 384, 385, 386, 387
      }
    },
    {
      type = "objectgroup",
      id = 3,
      name = "Camada de Objetos",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = -4,
          y = -2.66667,
          width = 6.66667,
          height = 325.333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = -3.84615,
          y = 317.692,
          width = 454.615,
          height = 4.61538,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 446.154,
          y = -3.07692,
          width = 3.84615,
          height = 324.615,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = -3.84615,
          y = -2.30769,
          width = 453.846,
          height = 4.61538,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
