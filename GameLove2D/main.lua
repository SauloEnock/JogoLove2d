

require "map"
require "menu"
require "help"
-- require "char_update"
require "player1"
require "player2"

function love.load()
	map_load()
	menu_load()
	help_load()
	player1_load()
	player2_load()
end

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

function love.keyreleased(key)
	player1_released(key)
	player2_released(key)
end

function love.mousepressed(x, y, button, istouch)
	if gamestate == "menu" then
		menu_mousepressed(x, y, button, istouch)
	else 
		help_mousepressed(x, y, button, istouch)
	end
end

--[[

require "map"
require "player"

function love.load()
	player1_load()
	player2_load()
	map_load()
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

--

function drawQuad(mode, x, y, length)
	love.graphics.rectangle(mode, x, y, length, length)
end


function love.draw()
	love.graphics.rectangle("fill", 120, 150, 160, 120)

	love.graphics.rectangle("line", 739, 0, 60, 220)

	love.graphics.setColor(255, 0, 0)

	love.graphics.rectangle("fill", 110, 57, 160, 20)

	love.graphics.rectangle("line", 729, 479, 70, 120)

	love.graphics.setColor(255, 255, 255)

	love.graphics.rectangle("fill", 0, 0, 20, 20)

	love.graphics.rectangle("fill", 20, 312, 60, 120, 10, 10)

	love.graphics.rectangle("line", 150, 312, 60, 120, 10, 10)

	drawQuad("fill", 340, 50, 60)

	drawQuad("line", 335, 45, 70)

	love.graphics.setColor(0, 0, 255)

	drawQuad("fill", 640, 50, 60)

	love.graphics.circle("fill", 330, 300, 50)

	love.graphics.setColor(255, 255, 255)

end

---

local sea
local portavioes
local frames = {}
local activeFrame
local currentFrame = 1


function love.load()
	sea = love.graphics.newImage("sprite_mar.png")
	ship = love.graphics.newImage("aircraft_carrier_fO_cL_32px(2).png")
	GetoTheChoppa = love.graphics.newImage("sprite_helicopterinhu.png")
	frames[1] = love.graphics.newQuad(0, 0, 128, 64, GetoTheChoppa:getDimensions())
	frames[2] = love.graphics.newQuad(128, 0, 128, 64, GetoTheChoppa:getDimensions())
	frames[3] = love.graphics.newQuad(0, 64, 128, 64, GetoTheChoppa:getDimensions())
	frames[4] = love.graphics.newQuad(128, 64, 128, 64, GetoTheChoppa:getDimensions())

	activeFrame = frames[currentFrame]

end

function love.draw()
	love.graphics.draw(sea)
	love.graphics.draw(ship, 100 , 100)
	love.graphics.draw(GetoTheChoppa, activeFrame,
		love.graphics.getWidth()/2 -
			({activeFrame:getViewport()})[3]/2,
		love.graphics.getHeight()/2 -
			select(4,activeFrame:getViewport())/2)
end

local elapsedTime = 0

function love.update(dt)
	elapsedTime = elapsedTime + dt
	if elapsedTime > 1 then
		if currentFrame < 4 then
			currentFrame = currentFrame + 1
		else
			currentFrame = 1
		end
		activeFrame = frames[currentFrame]
		elapsedTime = 0
	end
end

---

local sea
local portavioes
local p1lose = false
local p2lose = false
local activeStartMenu = true

local largura = love.graphics.getWidth()
local altura = love.graphics.getHeight()

function love.load()
	x = love.mouse.getX()
	y = love.mouse.getY()
	state = "menu"
	medium = love.graphics.newFont(45)
	sea = love.graphics.newImage("sprite_mar.png")
	ship = love.graphics.newImage("Batalha_Naval_Menu.png")
end

function love.draw()

	if state == "menu" then

		love.graphics.draw(ship, 150 , 100)

		love.graphics.setFont(medium)
		love.graphics.print("Start", 10, 300)
		love.graphics.setFont(medium)
		love.graphics.print("Quit", 10, 500)
	end

end

function love.mousepressed(x,y, button)
	if button == "1" and x > 0 and x < 150 and y > 150 and y < 350 then
		state = "playing"
	end
end

--]]

