
require "player"

function love.load()
	player_load()
end

function love.update(dt)
	player_update(dt)
end

function love.draw()
	player_draw()
end