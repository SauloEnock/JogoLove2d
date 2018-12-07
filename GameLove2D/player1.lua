
require "map"
anim8 = require "anim8"
bump = require "bump"
-- player2 = require "player2"

player1 = {}

function player1_load()
	
	player1.attack = false
	player1.attackX = 21
	player1.attackY = 6
	player1.life, player1.shield  = 1000, 0
    player1.x, player1.y, player1.speed, player1.width, player1.height = 100, 100, 150, 35, 51
	fisica.world:add(player1, player1.x, player1.y, player1.width, player1.height)
	player1.top, player1.down, player1.right, player1.left = false, true, false, false
	
    player1.spritesheet = love.graphics.newImage("Sprites/Characters/player(1).png")
	player1.width = player1.spritesheet:getWidth()
	player1.height = player1.spritesheet:getHeight()
    player1.grid = anim8.newGrid(64, 64, player1.spritesheet:getWidth(), player1.spritesheet:getHeight())
	player1.grid2 = anim8.newGrid(192, 192, player1.spritesheet:getWidth(), player1.spritesheet:getHeight())
    player1.walkingRight = anim8.newAnimation(player1.grid('1-9', 12), 0.1)
    player1.walkingLeft = anim8.newAnimation(player1.grid('1-9', 10), 0.1)
    player1.walkingTop = anim8.newAnimation(player1.grid('1-9', 9), 0.1)
    player1.walkingDown = anim8.newAnimation(player1.grid('1-9', 11), 0.1)
	player1.stoppedTop = anim8.newAnimation(player1.grid('1-1', 9), 0.1)
	player1.stoppedDown = anim8.newAnimation(player1.grid('1-1', 11), 0.1)
	player1.stoppedRight = anim8.newAnimation(player1.grid('1-1', 12), 0.1)
	player1.stoppedLeft = anim8.newAnimation(player1.grid('1-1', 10), 0.1)
	player1.hitTop = anim8.newAnimation(player1.grid2('1-6', 8), 0.1)
	player1.hitDown = anim8.newAnimation(player1.grid2('1-6', 10), 0.1)
	player1.hitRight = anim8.newAnimation(player1.grid2('1-6', 11), 0.1)
	player1.hitLeft = anim8.newAnimation(player1.grid2('1-6', 9), 0.1)
	player1.death = anim8.newAnimation(player1.grid('1-6', 21), 0.1)

    player1.currentAnimation = player1.stoppedDown

end

function player1_update(dt)
	player1.currentAnimation:update(dt)

	player1.xlr8 = dt * player1.speed

	if (love.keyboard.isDown("up")) then
		player1.currentAnimation = player1.walkingTop
        player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y - player1.xlr8)
	elseif (love.keyboard.isDown("down")) then
		player1.currentAnimation = player1.walkingDown
        player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y + player1.xlr8)
	elseif (love.keyboard.isDown("left")) then
		player1.currentAnimation = player1.walkingLeft
        player1.x, player1.y = fisica.world:move(player1, player1.x - player1.xlr8, player1.y)
	elseif (love.keyboard.isDown("right")) then
		player1.currentAnimation = player1.walkingRight
		player1.x, player1.y = fisica.world:move(player1, player1.x + player1.xlr8, player1.y)
	elseif (love.keyboard.isDown("return")) or (love.keyboard.isDown("rctrl")) then
		player1.attack = true
		if player1.top then	
			player1.currentAnimation = player1.hitTop
			love.audio.play(sounds.hit)
		elseif player1.down then 
			player1.currentAnimation = player1.hitDown
			love.audio.play(sounds.hit)
		elseif player1.right then 
			player1.currentAnimation = player1.hitRight
			love.audio.play(sounds.hit)
		elseif player1.left then
			player1.currentAnimation = player1.hitLeft
			love.audio.play(sounds.hit)
		end

		if player2.attack and player2.top and player2.y-player2.attackY <= player1.y then
			player1.life = player1.life - 1000
			print(player1.life)
			player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y-25)
		elseif player2.attack and player2.down and player2.height+player2.attackY >= player1.y then
			player1.life = player1.life - 1000
			print(player1.life)
			player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y+25)
		elseif player2.attack and player2.right and player2.width+player2.attackX >= player1.x then
			player1.life = player1.life - 1000
			print(player1.life)
			player1.x, player1.y = fisica.world:move(player1, player1.x+25, player1.y)
		elseif player2.attack and player2.left and player2.x-player2.attackX <= player1.x then
			player1.life = player1.life - 1000
			print(player1.life)
			player1.x, player1.y = fisica.world:move(player1, player1.x-25, player1.y)
		end
	else
		player1.attack = false
		if player1.top then
			player1.currentAnimation = player1.stoppedTop
		elseif player1.down then 
			player1.currentAnimation = player1.stoppedDown
		elseif player1.right then 
			player1.currentAnimation = player1.stoppedRight
		elseif player1.left then 
			player1.currentAnimation = player1.stoppedLeft
		end
	end

	if player1.life == 0 then
		player1.currentAnimation = player1.death
	end
end

function player1_draw()
	if player1.currentAnimation == player1.hitTop or player1.currentAnimation == player1.hitDown or player1.currentAnimation == player1.hitRight or player1.currentAnimation == player1.hitLeft then
		player1.currentAnimation:draw(player1.spritesheet, player1.x-65, player1.y-64)
	else
		player1.currentAnimation:draw(player1.spritesheet, player1.x, player1.y)
	end
	--love.graphics.rectangle("fill", player1.x+16, player1.y+13, 35, 51)
	--love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 90, love.graphics.getWidth(), 100)
end

function player1_released(key) 
	if key == "up" then
		player1.top, player1.down, player1.right, player1.left = true, false, false, false
	elseif key == "down" then 
		player1.top, player1.down, player1.right, player1.left = false, true, false, false
	elseif key == "right" then 
		player1.top, player1.down, player1.right, player1.left = false, false, true, false
	elseif key == "left" then 
		player1.top, player1.down, player1.right, player1.left = false, false, false, true
	end
	--return key
end

-- return player1

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
