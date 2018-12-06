
require "map"
anim8 = require "anim8"
bump = require "bump"

player2 = {}

function player2_load()

    player2.x, player2.y, player2.speed, player2.width, player2.height = 400, 100, 150, 40, 50
	fisica.world:add(player2, player2.x, player2.y, player2.width, player2.height)
	player2.top, player2.down, player2.right, player2.left = false, true, false, false
	
    player2.spritesheet = love.graphics.newImage("Sprites/Characters/player(2).png")
	player2.width = player2.spritesheet:getWidth()
	player2.height = player2.spritesheet:getHeight()
    player2.grid = anim8.newGrid(64, 64, player2.spritesheet:getWidth(), player2.spritesheet:getHeight())
	player2.grid2 = anim8.newGrid(192, 192, player2.spritesheet:getWidth(), player2.spritesheet:getHeight())
    player2.walkingRight = anim8.newAnimation(player2.grid('1-9', 12), 0.1)
    player2.walkingLeft = anim8.newAnimation(player2.grid('1-9', 10), 0.1)
    player2.walkingTop = anim8.newAnimation(player2.grid('1-9', 9), 0.1)
    player2.walkingDown = anim8.newAnimation(player2.grid('1-9', 11), 0.1)
	player2.stoppedTop = anim8.newAnimation(player2.grid('1-1', 9), 0.1)
	player2.stoppedDown = anim8.newAnimation(player2.grid('1-1', 11), 0.1)
	player2.stoppedRight = anim8.newAnimation(player2.grid('1-1', 12), 0.1)
	player2.stoppedLeft = anim8.newAnimation(player2.grid('1-1', 10), 0.1)
	player2.hitTop = anim8.newAnimation(player2.grid2('1-6', 8), 0.1)
	player2.hitDown = anim8.newAnimation(player2.grid2('1-6', 10), 0.1)
	player2.hitRight = anim8.newAnimation(player2.grid2('1-6', 11), 0.1)
	player2.hitLeft = anim8.newAnimation(player2.grid2('1-6', 9), 0.1)

    player2.currentAnimation = player2.stoppedDown

end

function player2_update(dt)
	player2.currentAnimation:update(dt)

	player2.xlr8 = dt * player2.speed

	if (love.keyboard.isDown("w")) then
		player2.currentAnimation = player2.walkingTop
        player2.x, player2.y = fisica.world:move(player2, player2.x, player2.y - player2.xlr8)
	elseif (love.keyboard.isDown("s")) then
		player2.currentAnimation = player2.walkingDown
        player2.x, player2.y = fisica.world:move(player2, player2.x, player2.y + player2.xlr8)
	elseif (love.keyboard.isDown("a")) then
		player2.currentAnimation = player2.walkingLeft
        player2.x, player2.y = fisica.world:move(player2, player2.x - player2.xlr8, player2.y)
	elseif (love.keyboard.isDown("d")) then
		player2.currentAnimation = player2.walkingRight
		player2.x, player2.y = fisica.world:move(player2, player2.x + player2.xlr8, player2.y)
	elseif (love.keyboard.isDown("q")) or (love.keyboard.isDown("e")) then
		if player2.top then	
			player2.currentAnimation = player2.hitTop
			love.audio.play(sounds.hit2)
		elseif player2.down then 
			player2.currentAnimation = player2.hitDown
			love.audio.play(sounds.hit2)
		elseif player2.right then 
			player2.currentAnimation = player2.hitRight
			love.audio.play(sounds.hit2)
		elseif player2.left then
			player2.currentAnimation = player2.hitLeft
			love.audio.play(sounds.hit2)
		end
	else
		if player2.top then
			player2.currentAnimation = player2.stoppedTop
		elseif player2.down then 
			player2.currentAnimation = player2.stoppedDown
		elseif player2.right then 
			player2.currentAnimation = player2.stoppedRight
		elseif player2.left then 
			player2.currentAnimation = player2.stoppedLeft
		end
	end
end

function player2_draw()
	if player2.currentAnimation == player2.hitTop or player2.currentAnimation == player2.hitDown or player2.currentAnimation == player2.hitRight or player2.currentAnimation == player2.hitLeft then
		player2.currentAnimation:draw(player2.spritesheet, player2.x-65, player2.y-64)
	else
		player2.currentAnimation:draw(player2.spritesheet, player2.x, player2.y)
	end
end

function player2_released(key) 
	if key == "w" then
		player2.top, player2.down, player2.right, player2.left = true, false, false, false
	elseif key == "s" then 
		player2.top, player2.down, player2.right, player2.left = false, true, false, false
	elseif key == "d" then 
		player2.top, player2.down, player2.right, player2.left = false, false, true, false
	elseif key == "a" then 
		player2.top, player2.down, player2.right, player2.left = false, false, false, true
	end
	--return key
end