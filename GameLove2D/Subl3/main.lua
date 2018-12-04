
require "map"
require "player"

function love.load()
	map_load()
	player1_load()
	player2_load()
end

function love.update(dt)
	player1_update(dt)
	player2_update(dt)
end

function love.draw()
	map_draw()
	player1_draw()
	player2_draw()
end

