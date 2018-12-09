

-- require "map"
-- anim8 = require "anim8"
-- bump = require "bump"

-- player1 = {}

-- function player1_load()

--     player1.x, player1.y, player1.speed, player1.width, player1.height = 400, 100, 150, 40, 50
-- 	fisica.world:add(player1, player1.x, player1.y, player1.width, player1.height)
-- 	player1.top, player1.down, player1.right, player1.left = false, true, false, false
	
--     player1.spritesheet = love.graphics.newImage("Sprites/Characters/player(2).png")
-- 	player1.width = player1.spritesheet:getWidth()
-- 	player1.height = player1.spritesheet:getHeight()
--     player1.grid = anim8.newGrid(64, 64, player1.spritesheet:getWidth(), player1.spritesheet:getHeight())
-- 	player1.grid2 = anim8.newGrid(192, 192, player1.spritesheet:getWidth(), player1.spritesheet:getHeight())
--     player1.walkingRight = anim8.newAnimation(player1.grid('1-9', 12), 0.1)
--     player1.walkingLeft = anim8.newAnimation(player1.grid('1-9', 10), 0.1)
--     player1.walkingTop = anim8.newAnimation(player1.grid('1-9', 9), 0.1)
--     player1.walkingDown = anim8.newAnimation(player1.grid('1-9', 11), 0.1)
-- 	player1.stoppedTop = anim8.newAnimation(player1.grid('1-1', 9), 0.1)
-- 	player1.stoppedDown = anim8.newAnimation(player1.grid('1-1', 11), 0.1)
-- 	player1.stoppedRight = anim8.newAnimation(player1.grid('1-1', 12), 0.1)
-- 	player1.stoppedLeft = anim8.newAnimation(player1.grid('1-1', 10), 0.1)
-- 	player1.hitTop = anim8.newAnimation(player1.grid2('1-6', 8), 0.1)
-- 	player1.hitDown = anim8.newAnimation(player1.grid2('1-6', 10), 0.1)
-- 	player1.hitRight = anim8.newAnimation(player1.grid2('1-6', 11), 0.1)
-- 	player1.hitLeft = anim8.newAnimation(player1.grid2('1-6', 9), 0.1)

--     player1.currentAnimation = player1.stoppedDown

-- end

-- function player1_update(dt)
-- 	player1.currentAnimation:update(dt)

-- 	player1.xlr8 = dt * player1.speed

-- 	if (love.keyboard.isDown("w")) then
-- 		player1.currentAnimation = player1.walkingTop
--         player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y - player1.xlr8)
-- 	elseif (love.keyboard.isDown("s")) then
-- 		player1.currentAnimation = player1.walkingDown
--         player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y + player1.xlr8)
-- 	elseif (love.keyboard.isDown("a")) then
-- 		player1.currentAnimation = player1.walkingLeft
--         player1.x, player1.y = fisica.world:move(player1, player1.x - player1.xlr8, player1.y)
-- 	elseif (love.keyboard.isDown("d")) then
-- 		player1.currentAnimation = player1.walkingRight
-- 		player1.x, player1.y = fisica.world:move(player1, player1.x + player1.xlr8, player1.y)
-- 	elseif (love.keyboard.isDown("x")) then
-- 		if player1.top then	
-- 			player1.currentAnimation = player1.hitTop
-- 			love.audio.play(sounds.hit2)
-- 		elseif player1.down then 
-- 			player1.currentAnimation = player1.hitDown
-- 			love.audio.play(sounds.hit2)
-- 		elseif player1.right then 
-- 			player1.currentAnimation = player1.hitRight
-- 			love.audio.play(sounds.hit2)
-- 		elseif player1.left then
-- 			player1.currentAnimation = player1.hitLeft
-- 			love.audio.play(sounds.hit2)
-- 		end
-- 	else
-- 		if player1.top then
-- 			player1.currentAnimation = player1.stoppedTop
-- 		elseif player1.down then 
-- 			player1.currentAnimation = player1.stoppedDown
-- 		elseif player1.right then 
-- 			player1.currentAnimation = player1.stoppedRight
-- 		elseif player1.left then 
-- 			player1.currentAnimation = player1.stoppedLeft
-- 		end
-- 	end
-- end

-- function player1_draw()
-- 	if player1.currentAnimation == player1.hitTop or player1.currentAnimation == player1.hitDown or player1.currentAnimation == player1.hitRight or player1.currentAnimation == player1.hitLeft then
-- 		player1.currentAnimation:draw(player1.spritesheet, player1.x-65, player1.y-64)
-- 	else
-- 		player1.currentAnimation:draw(player1.spritesheet, player1.x, player1.y)
-- 	end
-- end

-- function player1_released(key) 
-- 	if key == "w" then
-- 		player1.top, player1.down, player1.right, player1.left = true, false, false, false
-- 	elseif key == "s" then 
-- 		player1.top, player1.down, player1.right, player1.left = false, true, false, false
-- 	elseif key == "d" then 
-- 		player1.top, player1.down, player1.right, player1.left = false, false, true, false
-- 	elseif key == "a" then 
-- 		player1.top, player1.down, player1.right, player1.left = false, false, false, true
-- 	end
-- 	--return key
-- end

-- --love.graphics.rectangle("fill", player1.x+18, player1.y+15, 40, 50)
-- --love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 90, love.graphics.getWidth(), 100)