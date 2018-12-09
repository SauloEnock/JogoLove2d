
require "map"

menu = {} -- vetor que conterá todas as imagens do menu.

gamestate = "menu" -- declaro o gamestate inicial como menu, fazendo com que o jogo se inicia na tela de menu.

-- Adiciono todas as imagens do menu ao vetor citado anteriormente.
function menu_load()
    menu.image = love.graphics.newImage("Sprites/Maps/menu_image(1).png")
    menu.play_button = love.graphics.newImage("Sprites/Buttons/play_button.png")
    menu.help_button = love.graphics.newImage("Sprites/Buttons/help_button.png")
    menu.quit_button = love.graphics.newImage("Sprites/Buttons/quit_button.png")
end

-- reproduz a musica de fundo do menu.
function menu_update(dt)
    love.audio.play(sounds.menu)    
end

-- função "mousepressed" d pasta menu, identifica as mudanças do gamestate a partir do menu.
function menu_mousepressed(x, y, button, istouch)
    if gamestate == "menu" then
        if button == 1 and (x >= 30 and x <= 135) and (y >= 440 and y <= 483) then
            gamestate = "game"
        elseif button == 1 and (x >= 30 and x <= 135) and (y >= 490 and y <= 533) then
            gamestate = "help"
        elseif button == 1 and (x >= 30 and x <= 135) and (y >= 540 and y <= 583) then
            gamestate = "quit"
        end
    end
end

-- "desenha" todos os compenentes do menu, sendo eles o background e os três botões.
function menu_draw()
    love.graphics.draw(menu.image, -2, 0, 0, 1.1, 1.1)
    love.graphics.draw(menu.play_button, 30, 440)
    love.graphics.draw(menu.help_button, 30, 490)
    love.graphics.draw(menu.quit_button, 30, 540)
end

