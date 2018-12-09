
mapa = require "Libs/maptiled(1)" -- chamo o arquivo fornecido pelo Tiled[mapatiled(1)] contendo os objetos do mapa. 
bump = require "Libs/bump" -- Biblioteca de física. 

sounds = {} -- vetor que conterá todas as musicas.
fisica = {} -- vetor que conterá o mundo.
fisica.world = bump.newWorld(64) -- declaro o mundo na bump.lua.


function map_load()
    
    --adição da font utilizada no jogo.
    font1 = love.graphics.newFont("Sprites/FontBases/plain_black_wide.ttf",24)
    
    -- adição de arquivos de audios utilizados no jogo.
    sounds.menu = love.audio.newSource('sounds/main_menu_theme.mp3', 'static')
    sounds.help = love.audio.newSource('sounds/help_theme.mp3', 'static')
    sounds.game = love.audio.newSource('sounds/battle.mp3', 'static')
    sounds.hit = love.audio.newSource('sounds/sword_slash_sound.wav', 'static')
    sounds.hit2 = love.audio.newSource('sounds/mace_hit_sound.wav', 'static')
    
    -- atribui a imagem de fudo do jogo a uma variável.
    arena = love.graphics.newImage("Sprites/Maps/arena(2).png" )

    -- incrementa o mapa e os objetos criados no Tiled e exportados como arquivo lua diretamente no jogo por meio da bump.lua
    for i = 1, #mapa.layers do
        if mapa.layers[i].type == "objectgroup" then
            v = mapa.layers[i]
            for j = 1, #v.objects do
                objeto = v.objects[j]
                fisica.world:add(objeto, objeto.x, objeto.y, objeto.width, objeto.height)
            end
        end
    end
end

-- reproduz a musica tema do jogo e pausa a do menu.
function map_update(dt)
    love.audio.pause(sounds.menu)
    love.audio.setVolume(0.15)
    love.audio.play(sounds.game)
end

-- "desenha" a imagem de fundo do jogo contida na variável "arena".
function map_draw()
    love.graphics.draw(arena, 0, -4)
end