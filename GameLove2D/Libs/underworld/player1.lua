
require "map" -- require em "map" para utilizar os sons contidos nela.
require "char_update" -- A função "battle" nele contida interfere nos status de vida do jogador 2.
anim8 = require "anim8" -- Biblioteca de animações.
bump = require "bump" -- Biblioteca de física.

player1 = {} -- Vetor que conterá todos os elementos do jogador 1

-- Adiciono todos os elementos do jogador 1. Sua posição X e Y, sua largura e altura, veolcidade base, estado de ataque, 
-- ultimo movimento e todas as animações do jogador 1.
function player1_load()

	player1.life, player1.shield, player1.damage = 1000, 0, 60
    player1.x, player1.y, player1.speed, player1.width, player1.height = 630, 275, 150, 35, 51
	fisica.world:add(player1, player1.x, player1.y, player1.width, player1.height)
	player1.top, player1.down, player1.right, player1.left = false, true, false, false
	player1.attack = false
	
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

    player1.currentAnimation = player1.stoppedDown -- Declado a animação atual como a parado para baixo.

end

-- Carrega a animação atual dependendo do estado do jogador 1, caso esteja parado, andando ou atacando. No último caso,
-- também reproduz o som do hit do jogador 1.
-- Incrementa ou decrementa as posições X e Y (um relação a sua velocidade base e o dt[DeltaTimes] do jogador 1 caso os 
-- comandos de movimentação estiverem sendo pressionados.
-- Define como true ou false o estado de ataque, dependendo se o botão de ataque esteja sendo pressionado ou não.
function player1_update(dt)
	player1.currentAnimation:update(dt)

	player1.xlr8 = dt * player1.speed

	player1.attack = false
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
	elseif (love.keyboard.isDown("rctrl")) then
		player1.attack = true
		if player1.top then	
			player1.currentAnimation = player1.hitTop
			love.audio.play(sounds.hit)
			-- battle_update(dt)
		elseif player1.down then 
			player1.currentAnimation = player1.hitDown
			love.audio.play(sounds.hit)
			-- battle_update(dt)
		elseif player1.right then 
			player1.currentAnimation = player1.hitRight
			love.audio.play(sounds.hit)
			-- battle_update(dt)
		elseif player1.left then
			player1.currentAnimation = player1.hitLeft
			love.audio.play(sounds.hit)
			-- battle_update(dt)
		end
	else
		player1.attack = false
		-- Caso o jogador 1 não esteja se movimentando, utilizando a função "key_released", declaro a atual animação dele, 
		-- como sendo ele parado para o lado em que ele se moveu pela ultima vez.
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
	player1.attack = false
end

-- "Desenha" a animação do personagem dependendo de seu estados, e caso seja a animação de ataque, corrige a posição.
function player1_draw()
	if player1.currentAnimation == player1.hitTop or player1.currentAnimation == player1.hitDown or player1.currentAnimation == player1.hitRight or player1.currentAnimation == player1.hitLeft then
		player1.currentAnimation:draw(player1.spritesheet, player1.x-65, player1.y-64)
	else
		player1.currentAnimation:draw(player1.spritesheet, player1.x, player1.y)
	end
	--love.graphics.rectangle("fill", player1.x+16, player1.y+13, 35, 51) [Teste para saber a largura e altura exatas do
	-- personagem]
end

-- 	Altera os valores boolean com base no ultimo movimento do jogador, para então ser possível identificar o lado que o 
--	jogador 2 deve permanecer virado.
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
end

