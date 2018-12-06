
require "map"
anim8 = require "anim8"
bump = require "bump"

player1 = {}

function player1_load()

	player1.x, player1.y, player1.speed, player1.width, player1.height = 100, 100, 150, 40, 50
	fisica.world:add(player1, player1.x, player1.y, player1.width, player1.height)

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

    --fisica.world:update(dt)
    --player1.x = fisica.player1:getX() - 25
	--player1.y = fisica.player1:getY() - 25

	xlr8 = dt * player1.speed
	if (love.keyboard.isDown("up")) then
		player1.currentAnimation = player1.walkingTop
        player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y - xlr8)
	elseif (love.keyboard.isDown("down")) then
		player1.currentAnimation = player1.walkingDown
        player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y + xlr8)
	elseif (love.keyboard.isDown("left")) then
		player1.currentAnimation = player1.walkingLeft
        player1.x, player1.y = fisica.world:move(player1, player1.x - xlr8, player1.y)
	elseif (love.keyboard.isDown("right")) then
		player1.currentAnimation = player1.walkingRight
		player1.x, player1.y = fisica.world:move(player1, player1.x + xlr8, player1.y)
	elseif (love.keyboard.isDown("return")) then
		player1.currentAnimation = player1.hit
		love.audio.play(sounds.hit)
	elseif (love.keyboard.isDown("rctrl")) then
		player1.currentAnimation = player1.hit2
		love.audio.play(sounds.hit)
	else
		player1.currentAnimation = player1.stopped
    end
end



function player1_draw()
	if player1.currentAnimation == player1.hit or player1.currentAnimation == player1.hit2 then
		player1.currentAnimation:draw(player1.spritesheet, player1.x-65, player1.y-64)
	else
		player1.currentAnimation:draw(player1.spritesheet, player1.x, player1.y)
	end
    love.graphics.rectangle("fill", player1.x+10, player1.y+10, 40, 55)
    -- love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 90, love.graphics.getWidth(), 100)
end



--[[


anim8 = require "anim8"

sounds = {}
player = {}
fisica = {}
teto = {}
chao = {}
wallLeft = {}
wallRight = {}

window_width = love.graphics.getWidth()
window_height = love.graphics.getHeight()

function player_load()
    player.x, player.y, player.speed = 100, 100, 100
    love.physics.setMeter(64)
    fisica.world = love.physics.newWorld(0, 0, true) -- 9.81 * 64
    fisica.player = love.physics.newBody(fisica.world, player.x - 25, player.y - 25, "dynamic")
    fisica.fixture = love.physics.newFixture(fisica.player, love.physics.newRectangleShape(50, 50))

    teto.body = love.physics.newBody(fisica.world, 0 + love.graphics.getWidth() / 2, 10, "static")
    chao.fixture = love.physics.newFixture(teto.body, love.physics.newRectangleShape(love.graphics.getWidth(), -30))

	chao.body = love.physics.newBody(fisica.world, 0 + love.graphics.getWidth() / 2, love.graphics.getHeight() - 10, "static")
    chao.fixture = love.physics.newFixture(chao.body, love.physics.newRectangleShape(love.graphics.getWidth(), 30))

    chao.body = love.physics.newBody(fisica.world, 0 + love.graphics.getWidth() / 2, love.graphics.getHeight() - 10, "static")
    chao.fixture = love.physics.newFixture(chao.body, love.physics.newRectangleShape(love.graphics.getWidth(), 7))

	wallRight.body = love.physics.newBody(fisica.world, love.graphics.getWidth() - 10, 0 + love.graphics.getHeight() / 2, "static")
	wallRight.fixture = love.physics.newFixture(wallRight.body, love.physics.newRectangleShape(-15, love.graphics.getHeight()))

	wallLeft.body = love.physics.newBody(fisica.world, 10, 0 + love.graphics.getHeight() / 2, "static")
	wallLeft.fixture = love.physics.newFixture(wallLeft.body, love.physics.newRectangleShape(-30, love.graphics.getHeight()))

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

    player.currentAnimation = player.walkingLeft

	sounds.hit = love.audio.newSource('sword_slash_sound.wav', 'static')

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

]]--
