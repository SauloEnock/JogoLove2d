return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "2018.11.29",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 13,
  height = 10,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 7,
  nextobjectid = 9,
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
      columns = 12,
      image = "arena(2).png",
      imagewidth = 804,
      imageheight = 609,
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
      tilecount = 204,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 6,
      name = "Camada - Objetos",
      x = 0,
      y = 0,
      width = 13,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          name = "wallLeft",
          type = "",
          shape = "rectangle",
          x = -12.3333,
          y = -2.66667,
          width = 4,
          height = 591,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "chao",
          type = "",
          shape = "rectangle",
          x = -16.9068,
          y = 580.813,
          width = 809.948,
          height = 4.61538,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "wallRight",
          type = "",
          shape = "rectangle",
          x = 787.654,
          y = -0.910253,
          width = 4.34615,
          height = 587.782,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "teto",
          type = "",
          shape = "rectangle",
          x = -10.3398,
          y = -3.43987,
          width = 803.194,
          height = 3.61538,
          rotation = 0.152184,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
