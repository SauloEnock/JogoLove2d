
require "map"

help = {}

function help_load()
    help.image = love.graphics.newImage("Sprites/Maps/help_image.png")
    help.goback_button = love.graphics.newImage("Sprites/Buttons/goback_button.png")
end

function help_update(dt)
    love.audio.pause(sounds.menu)
    love.audio.setVolume(0.5)
    love.audio.play(sounds.help)
end

function help_mousepressed(x, y, button, istouch)
    if gamestate == "help" then
        if button == 1 and (x >= 739 and x <= 791) and (y >= 539 and y <= 589) then
            love.audio.pause(sounds.help)
            love.audio.setVolume(1)
            gamestate = "menu"
        end
    end
end

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