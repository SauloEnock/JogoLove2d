
-- Dou require em todas as pastas necessárias para o funcionamento do jogo.
require "Libs/map"
require "Libs/menu"
require "Libs/help"
require "Libs/char_update"
require "Libs/player1"
require "Libs/player2"

-- Ativa as funções de todas as pastas, fazendo com que possam ser usadas a qualquer momento. 
function love.load()
	map_load()
	menu_load()
	help_load()
	player1_load()
	player2_load()
end

-- ativa as funções update de cada pasta, dependendo do gamestate.
function love.update(dt)
	if gamestate == "menu" then
		menu_update(dt)
	elseif gamestate == "game" then 
		map_update(dt)
		player1_update(dt)
		player2_update(dt)
		battle_update(dt)
	elseif gamestate == "help" then
		help_update(dt)
	elseif gamestate == "quit" then 
		love.event.quit()
	end
end

-- ativa as funções draw de cada pasta, dependendo do gamestate.
function love.draw()
	if gamestate == "menu" then
		menu_draw()
	elseif gamestate == "game" then
		map_draw()
		player1_draw()
		player2_draw()
	elseif gamestate == "help" then 
		help_draw()
	elseif gamestate == "quit" then 
		love.event.quit()
	end
end

-- permite que a função "keyreleased" possa funcionar independentemente em ambas as pastas, player1 e player2.
function love.keyreleased(key)
	player1_released(key)
	player2_released(key)
end

-- permite que a função "mousepressed" possa funcionar independentemente em ambas as pastas, menu e help.
function love.mousepressed(x, y, button, istouch)
	if gamestate == "menu" then
		menu_mousepressed(x, y, button, istouch)
	else 
		help_mousepressed(x, y, button, istouch)
	end
end