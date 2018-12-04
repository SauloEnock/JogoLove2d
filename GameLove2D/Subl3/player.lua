
require "map"
anim8 = require "anim8"

sounds = {}
player = {}


window_width = love.graphics.getWidth()
window_height = love.graphics.getHeight()

function player_load()
    player.x, player.y, player.speed = 100, 100, 100

    player.spritesheet = love.graphics.newImage("player.png")
	player.width = player.spritesheet:getWidth()
	player.height = player.spritesheet:getHeight()
    player.grid = anim8.newGrid(64, 64, player.spritesheet:getWidth(), player.spritesheet:getHeight())
	player.grid2 = anim8.newGrid(192, 192, player.spritesheet:getWidth(), player.spritesheet:getHeight())
    player.walkingRight = anim8.newAnimation(player.grid('1-9', 12), 0.1)
    player.walkingLeft = anim8.newAnimation(player.grid('1-9', 10), 0.1)
    player.walkingTop = anim8.newAnimation(player.grid('1-9', 9), 0.1)
    player.walkingDown = anim8.newAnimation(player.grid('1-9', 11), 0.1)
    player.stopped = anim8.newAnimation(player.grid('1-1', 11), 0.1)
	player.hit = anim8.newAnimation(player.grid2('1-6', 10), 0.1)
	player.hit2 = anim8.newAnimation(player.grid2('1-6', 8), 0.1)

    player.currentAnimation = player.stopped

	sounds.hit = love.audio.newSource('sounds/sword_slash_sound.wav', 'static')

end

function player_update(dt)
	player.currentAnimation:update(dt)
    if (love.keyboard.isDown("up")) then
    	player.currentAnimation = player.walkingTop
        fisica.player:applyForce(0, -400)
    elseif (love.keyboard.isDown("down")) then
    	player.currentAnimation = player.walkingDown
    	fisica.player:applyForce(0, 400)
    elseif (love.keyboard.isDown("left")) then
    	player.currentAnimation = player.walkingLeft
    	fisica.player:applyForce(-400, 0)
    elseif (love.keyboard.isDown("right")) then
    	player.currentAnimation = player.walkingRight
    	fisica.player:applyForce(400, 0)
	elseif (love.keyboard.isDown("q")) then
		player.currentAnimation = player.hit
		love.audio.play(sounds.hit)
	elseif (love.keyboard.isDown("e")) then
		player.currentAnimation = player.hit2
		love.audio.play(sounds.hit)
	else
    	player.currentAnimation = player.stopped
    end

    fisica.world:update(dt)
    player.x = fisica.player:getX() - 25
    player.y = fisica.player:getY() - 25


end

function player_draw()
	if player.currentAnimation == player.hit or player.currentAnimation == player.hit2 then
		player.currentAnimation:draw(player.spritesheet, player.x-65, player.y-64)
	else
		player.currentAnimation:draw(player.spritesheet, player.x, player.y)
	end
    --love.graphics.rectangle("fill", player.x, player.y, 50, 50)
    -- love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 90, love.graphics.getWidth(), 100)
end

