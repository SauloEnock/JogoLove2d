
require "Libs/map" -- require em "map" para utilizar os sons contidos nela.
require "Libs/char_update" -- A função "battle" nele contida interfere nos status de vida do jogador 2.
anim8 = require "Libs/anim8" -- Biblioteca de animações.
bump = require "Libs/bump" -- Biblioteca de física.

player2 = {} -- Vetor que conterá todos os elementos do jogador 2

-- Adiciono todos os elementos do jogador 2. Sua posição X e Y, sua largura e altura, veolcidade base, estado de ataque, 
-- ultimo movimento e todas as animações do jogador 2.
function player2_load()

	player2.life, player2.shield, player2.damage = 1000, 0, 100
	player2.x, player2.y, player2.speed, player2.width, player2.height = 100, 270, 150, 35, 51
	fisica.world:add(player2, player2.x, player2.y, player2.width, player2.height) -- Adiciono o player2 no mundo declarado na pasta "map".
	player2.top, player2.down, player2.right, player2.left = false, true, false, false
	player2.attack = false
	
    player2.spritesheet = love.graphics.newImage("Sprites/Characters/player(2).png")
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
	player2.hitTop = anim8.newAnimation(player2.grid2('1-6', 8), 0.12)
	player2.hitDown = anim8.newAnimation(player2.grid2('1-6', 10), 0.12)
	player2.hitRight = anim8.newAnimation(player2.grid2('1-6', 11), 0.12)
	player2.hitLeft = anim8.newAnimation(player2.grid2('1-6', 9), 0.12)
	player2.death = anim8.newAnimation(player2.grid('1-6', 21), 0.1)

    player2.currentAnimation = player2.stoppedDown -- Declado a animação atual como a parado para baixo.

end

-- Carrega a animação atual dependendo do estado do jogador 2, caso esteja parado, andando ou atacando. No último caso,
-- também reproduz o som do hit do jogador 2.
-- Incrementa ou decrementa as posições X e Y (um relação a sua velocidade base e o dt[DeltaTimes] do jogado 2 caso os 
-- comandos de movimentação estiverem sendo pressionados.
-- Define como true ou false o estado de ataque, dependendo se o botão de ataque esteja sendo pressionado ou não.
function player2_update(dt)
	player2.currentAnimation:update(dt)

	player2.xlr8 = dt * player2.speed

	player2.attack = false
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
	elseif (love.keyboard.isDown("x")) then
		player2.attack = true
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
		battle_update(dt)
	else
		player2.attack = false
		-- Caso o jogador 2 não esteja se movimentando, utilizando a função "key_released", declaro a atual animação dele, 
		-- como sendo ele parado para o lado em que ele se moveu pela ultima vez.
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
	player2.attack = false
end

-- "Desenha" a animação do personagem dependendo de seu estados, e caso seja a animação de ataque, corrige a posição.
function player2_draw()
	if player2.currentAnimation == player2.hitTop or player2.currentAnimation == player2.hitDown or player2.currentAnimation == player2.hitRight or player2.currentAnimation == player2.hitLeft then
		player2.currentAnimation:draw(player2.spritesheet, player2.x-65, player2.y-64)
	else
		player2.currentAnimation:draw(player2.spritesheet, player2.x, player2.y)
	end
	--love.graphics.rectangle("fill", player2.x+16, player2.y+13, 35, 51) [Teste para saber a largura e altura exatas do
	-- personagem]
end

-- 	Altera os valores boolean com base no ultimo movimento do jogador, para então ser possível identificar o lado que o 
--	jogador 2 deve permanecer virado.
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
end