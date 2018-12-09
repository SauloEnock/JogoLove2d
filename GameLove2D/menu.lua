
require "map"

menu = {}

gamestate = "menu"

function menu_load()
    menu.image = love.graphics.newImage("Sprites/Maps/menu_image(1).png")
    menu.play_button = love.graphics.newImage("Sprites/Buttons/play_button.png")
    menu.play_button_width = menu.play_button:getWidth()
    menu.play_button_height = menu.play_button:getHeight()
    menu.help_button = love.graphics.newImage("Sprites/Buttons/help_button.png")
    menu.help_button_width = menu.help_button:getWidth()
    menu.help_button_height = menu.help_button:getHeight()
    menu.quit_button = love.graphics.newImage("Sprites/Buttons/quit_button.png")
    menu.quit_button_width = menu.quit_button:getWidth()
    menu.quit_button_height = menu.quit_button:getHeight()
    
end

function menu_update(dt)
    love.audio.play(sounds.menu)    
end

function love.mousepressed(x, y, button, istouch)
    if gamestate == "menu" then
        if button == 1 and (x >= 30 and x <= 135) and (y >= 440 and y <= 483) then
            love.audio.play(sounds.mouse_click)
            gamestate = "game"
        elseif button == 1 and (x >= 30 and x <= 135) and (y >= 490 and y <= 533) then
            gamestate = "help"
        elseif button == 1 and (x >= 30 and x <= 135) and (y >= 540 and y <= 583) then
            love.audio.play(sounds.mouse_click)
            gamestate = "quit"
        end
    end
end

function menu_draw()
    love.graphics.draw(menu.image, -2, 0, 0, 1.1, 1.1)
    love.graphics.draw(menu.play_button, 30, 440)
    love.graphics.draw(menu.help_button, 30, 490)
    love.graphics.draw(menu.quit_button, 30, 540)
    -- love.graphics.rectangle('fill', 30, 490, 105, 43)
end

