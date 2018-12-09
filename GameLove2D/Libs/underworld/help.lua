
require "map" -- require na pasta "map" pois nela estão todos os arquivos de audio utilizados no jogo

help = {} -- vetor que receberá todas as imagens da janela "help"

-- adiciono todas as imagens da janela "help" no vetor citado anteriormente
function help_load()
    help.image = love.graphics.newImage("Sprites/Maps/help_image.png")
    help.goback_button = love.graphics.newImage("Sprites/Buttons/goback_button.png")
end

-- pausa a musica demenu, diminiu o volume e então reproduz a musica da janela "help"
function help_update(dt)
    love.audio.pause(sounds.menu)
    love.audio.setVolume(0.5)
    love.audio.play(sounds.help)
end

-- função "mousepressed" da janela "help", permite que você veja seu conteúdo e retorne ao menu
function help_mousepressed(x, y, button, istouch)
    if gamestate == "help" then
        if button == 1 and (x >= 739 and x <= 791) and (y >= 539 and y <= 589) then
            love.audio.pause(sounds.help)
            love.audio.setVolume(1)
            gamestate = "menu"
        end
    end
end

-- "desenha" todos os elementos da janela "help"
function help_draw()
    love.graphics.draw(help.image, -5, 2)
    love.graphics.setFont(font1)
    love.graphics.print("O player 1", 17, 430)
    love.graphics.print("se move com", 200, 430)
    love.graphics.print("e ataca em \"rctrl\". ", 445, 430)
    love.graphics.print("O player 2", 17, 500)
    love.graphics.print("se move com", 200, 500)
    love.graphics.print("e ataca em \"X\". ", 445, 500)
    -- love.graphics.rectangle('fill', 739, 539, 52, 50)
    love.graphics.draw(help.goback_button, 740, 540)
    
end