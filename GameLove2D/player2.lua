
require "map"
anim8 = require "anim8"

player2 = {}

function player2_load()
    player2.x, player2.y, player2.speed = 100, 400, 100

    player2.spritesheet = love.graphics.newImage("player(2).png")
	player2.width = player2.spritesheet:getWidth()
	player2.height = player2.spritesheet:getHeight()
    player2.grid = anim8.newGrid(64, 64, player2.spritesheet:getWidth(), player2.spritesheet:getHeight())
	player2.grid2 = anim8.newGrid(192, 192, player2.spritesheet:getWidth(), player2.spritesheet:getHeight())
    player2.walkingRight = anim8.newAnimation(player2.grid('1-9', 12), 0.1)
    player2.walkingLeft = anim8.newAnimation(player2.grid('1-9', 10), 0.1)
    player2.walkingTop = anim8.newAnimation(player2.grid('1-9', 9), 0.1)
    player2.walkingDown = anim8.newAnimation(player2.grid('1-9', 11), 0.1)
    player2.stopped = anim8.newAnimation(player2.grid('1-1', 11), 0.1)
	player2.hit = anim8.newAnimation(player2.grid2('1-6', 10), 0.1)
	player2.hit2 = anim8.newAnimation(player2.grid2('1-6', 8), 0.1)

    player2.currentAnimation = player2.stopped

end

function player2_update(dt)
	player2.currentAnimation:update(dt)
    if (love.keyboard.isDown("w")) then
    	player2.currentAnimation = player2.walkingTop
        fisica.player2:applyForce(0, -400)
    elseif (love.keyboard.isDown("s")) then
    	player2.currentAnimation = player2.walkingDown
    	fisica.player2:applyForce(0, 400)
    elseif (love.keyboard.isDown("a")) then
    	player2.currentAnimation = player2.walkingLeft
    	fisica.player2:applyForce(-400, 0)
    elseif (love.keyboard.isDown("d")) then
    	player2.currentAnimation = player2.walkingRight
    	fisica.player2:applyForce(400, 0)
	elseif (love.keyboard.isDown("q")) then
		player2.currentAnimation = player2.hit
		love.audio.play(sounds.hit2)
	elseif (love.keyboard.isDown("e")) then
		player2.currentAnimation = player2.hit2
		love.audio.play(sounds.hit2)
	else
    	player2.currentAnimation = player2.stopped
    end

    fisica.world:update(dt)
    player2.x = fisica.player2:getX() - 25
	player2.y = fisica.player2:getY() - 25

end

function player2_draw()
	if player2.currentAnimation == player2.hit or player2.currentAnimation == player2.hit2 then
		player2.currentAnimation:draw(player2.spritesheet, player2.x-65, player2.y-64)
	else
		player2.currentAnimation:draw(player2.spritesheet, player2.x, player2.y)
	end
end
