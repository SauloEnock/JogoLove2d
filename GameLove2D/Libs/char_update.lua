
-- require "player1"
-- require "player2"

-- function love.update(dt)
-- 	player1_update(dt)
-- 	player2_update(dt)
-- end

-- função que funciona como um sistema de dano entre os dois jogadores
function battle_update(dt)
  if player1.attack then
    if player1.top == true and (player1.y - 10) <= (player2.y + player2.height) and (player1.x <= (player2.x + player2.width) or (player1.x + player1.width) >= player2.x)  then
			player2.life = player2.life - player1.damage
			print(player2.life)
			-- player2.x, player2.y = fisica.world:move(player2, player2.x, player2.y-25)
		elseif player1.down == true and (player1.y + player1.height) + 10 >= player2.y and (player1.x <= (player2.x + player2.width) or (player1.x + player1.width) >= player2.x) then
			player2.life = player2.life - player1.damage
			print(player2.life)
			-- player2.x, player2.y = fisica.world:move(player2, player2.x, player2.y+25)
		elseif player1.right == true and (player1.x + player1.width) + 21 >= player2.x and (player1.y <= (player2.y + player2.height) or (player1.y + player1.height) >= player2.y) then
			player2.life = player2.life - player1.damage
			print(player2.life)
			-- player2.x, player2.y = fisica.world:move(player2, player2.x+25, player2.y)
		elseif player1.left == true and (player1.x - 21) <= (player2.x + player2.width) and (player1.y <= (player2.y + player2.height) or (player1.y + player1.height) >= player2.y) then
			player2.life = player2.life - player1.damage
			print(player2.life)
			-- player2.x, player2.y = fisica.world:move(player2, player2.x-25, player2.y)
    end
  elseif player2.attack then 
		if player2.top == true and (player2.y - 10) <= (player1.y + player1.height) and (player2.x <= (player1.x + player1.width) or (player2.x + player2.width) >= player1.x)  then
			player1.life = player1.life - player2.damage
			print(player1.life)
			-- player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y-50)
		elseif player2.down == true and (player2.y + player2.height) + 10 >= player1.y and (player2.x <= (player1.x + player1.width) or (player2.x + player2.width) >= player1.x) then
			player1.life = player1.life - player2.damage
			print(player1.life)
			-- player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y+50)
		elseif player2.right == true and (player2.x + player2.width) + 21 >= player1.x and (player2.y <= (player1.y + player1.height) or (player2.y + player2.height) >= player1.y) then
			player1.life = player1.life - player2.damage
			print(player1.life)
			-- player1.x, player1.y = fisica.world:move(player1, player1.x+50, player1.y)
		elseif player2.left == true and (player2.x - 21) <= (player1.x + player1.width) and (player2.y <= (player1.y + player1.height) or (player2.y + player2.height) >= player1.y) then
			player1.life = player1.life - player2.damage
			print(player1.life)
			-- player1.x, player1.y = fisica.world:move(player1, player1.x-50, player1.y)
		end
  end
end

function status_update(dt)
end

--[[

[Detecção de Dano Intuitiva]
if player1.attack then
    if player1.top == true and (player1.y - 10) <= (player2.y + player2.height) and (player1.x <= (player2.x + player2.width) or (player1.x + player1.width) >= player2.x)  then
			player2.life = player2.life - player1.damage
			print(player2.life)
			-- player2.x, player2.y = fisica.world:move(player2, player2.x, player2.y-25)
		elseif player1.down == true and (player1.y + player1.height) + 10 >= player2.y and (player1.x <= (player2.x + player2.width) or (player1.x + player1.width) >= player2.x) then
			player2.life = player2.life - player1.damage
			print(player2.life)
			-- player2.x, player2.y = fisica.world:move(player2, player2.x, player2.y+25)
		elseif player1.right == true and (player1.x + player1.width) + 21 >= player2.x and (player1.y <= (player2.y + player2.height) or (player1.y + player1.height) >= player2.y) then
			player2.life = player2.life - player1.damage
			print(player2.life)
			-- player2.x, player2.y = fisica.world:move(player2, player2.x+25, player2.y)
		elseif player1.left == true and (player1.x - 21) <= (player2.x + player2.width) and (player1.y <= (player2.y + player2.height) or (player1.y + player1.height) >= player2.y) then
			player2.life = player2.life - player1.damage
			print(player2.life)
			-- player2.x, player2.y = fisica.world:move(player2, player2.x-25, player2.y)
    end
  elseif player2.attack then 
		if player2.top == true and (player2.y - 10) <= (player1.y + player1.height) and (player2.x <= (player1.x + player1.width) or (player2.x + player2.width) >= player1.x)  then
			player1.life = player1.life - player2.damage
			print(player1.life)
			-- player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y-50)
		elseif player2.down == true and (player2.y + player2.height) + 10 >= player1.y and (player2.x <= (player1.x + player1.width) or (player2.x + player2.width) >= player1.x) then
			player1.life = player1.life - player2.damage
			print(player1.life)
			-- player1.x, player1.y = fisica.world:move(player1, player1.x, player1.y+50)
		elseif player2.right == true and (player2.x + player2.width) + 21 >= player1.x and (player2.y <= (player1.y + player1.height) or (player2.y + player2.height) >= player1.y) then
			player1.life = player1.life - player2.damage
			print(player1.life)
			-- player1.x, player1.y = fisica.world:move(player1, player1.x+50, player1.y)
		elseif player2.left == true and (player2.x - 21) <= (player1.x + player1.width) and (player2.y <= (player1.y + player1.height) or (player2.y + player2.height) >= player1.y) then
			player1.life = player1.life - player2.damage
			print(player1.life)
			-- player1.x, player1.y = fisica.world:move(player1, player1.x-50, player1.y)
		end
  end

]]--
