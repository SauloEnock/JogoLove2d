
require "map"
anim8 = require "anim8"

sounds = {}
player1 = {}

sounds.hit = love.audio.newSource('sounds/sword_slash_sound.wav', 'static')
sounds.hit2 = love.audio.newSource('sounds/mace_hit_sound.wav', 'static')

function player1_load()
    player1.x, player1.y, player1.speed = 100, 100, 100

    player1.spritesheet = love.graphics.newImage("player(1).png")
	player1.width = player1.spritesheet:getWidth()
	player1.height = player1.spritesheet:getHeight()
    player1.grid = anim8.newGrid(64, 64, player1.spritesheet:getWidth(), player1.spritesheet:getHeight())
	player1.grid2 = anim8.newGrid(192, 192, player1.spritesheet:getWidth(), player1.spritesheet:getHeight())
    player1.walkingRight = anim8.newAnimation(player1.grid('1-9', 12), 0.1)
    player1.walkingLeft = anim8.newAnimation(player1.grid('1-9', 10), 0.1)
    player1.walkingTop = anim8.newAnimation(player1.grid('1-9', 9), 0.1)
    player1.walkingDown = anim8.newAnimation(player1.grid('1-9', 11), 0.1)
    player1.stopped = anim8.newAnimation(player1.grid('1-1', 11), 0.1)
	player1.hit = anim8.newAnimation(player1.grid2('1-6', 10), 0.1)
	player1.hit2 = anim8.newAnimation(player1.grid2('1-6', 8), 0.1)

    player1.currentAnimation = player1.stopped

end



function player1_update(dt)
	player1.currentAnimation:update(dt)
    if (love.keyboard.isDown("up")) then
    	player1.currentAnimation = player1.walkingTop
        fisica.player1:applyForce(0, -400)
    elseif (love.keyboard.isDown("down")) then
    	player1.currentAnimation = player1.walkingDown
    	fisica.player1:applyForce(0, 400)
    elseif (love.keyboard.isDown("left")) then
    	player1.currentAnimation = player1.walkingLeft
    	fisica.player1:applyForce(-400, 0)
    elseif (love.keyboard.isDown("right")) then
    	player1.currentAnimation = player1.walkingRight
    	fisica.player1:applyForce(400, 0)
	elseif (love.keyboard.isDown("return")) then
		player1.currentAnimation = player1.hit
		love.audio.play(sounds.hit)
	elseif (love.keyboard.isDown("rctrl")) then
		player1.currentAnimation = player1.hit2
		love.audio.play(sounds.hit)
	else
    	player1.currentAnimation = player1.stopped
    end

    fisica.world:update(dt)
    player1.x = fisica.player1:getX() - 25
	player1.y = fisica.player1:getY() - 25

end



function player1_draw()
	if player1.currentAnimation == player1.hit or player1.currentAnimation == player1.hit2 then
		player1.currentAnimation:draw(player1.spritesheet, player1.x-65, player1.y-64)
	else
		player1.currentAnimation:draw(player1.spritesheet, player1.x, player1.y)
	end
    --love.graphics.rectangle("fill", player.x, player.y, 50, 50)
    -- love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 90, love.graphics.getWidth(), 100)
end