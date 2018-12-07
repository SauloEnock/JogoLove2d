

function battle(p1, p2)
    if p1.attack and p1.top and p1.y-p1.attackY <= p2.y then
        p2.life = p2.life - 1000
        print(p2.life)
        p2.x, p2.y = fisica.world:move(p2, p2.x, p2.y-25)
    elseif p1.attack and p1.down and p1.y+p1.attackY >= p2.y then
        p2.life = p2.life - 1000
        print(p2.life)
        p2.x, p2.y = fisica.world:move(p2, p2.x, p2.y+25)
    elseif p1.attack and p1.right and p1.x+p1.attackX >= p2.x then
        p2.life = p2.life - 1000
        print(p2.life)
        p2.x, p2.y = fisica.world:move(p2, p2.x+25, p2.y)
    elseif p1.attack and p1.left and p1.x-p1.attackX <= p2.x then
        p2.life = p2.life - 1000
        print(p2.life)
        p2.x, p2.y = fisica.world:move(p2, p2.x-25, p2.y)
    end
end

function battle_load()
end

function battle_update(dt)
    

end

function battle_draw()
end 

if player1.attack and player1.top and player1.y-player1.attackY <= player2.y then
    player2.life = player2.life - 1000
    print(player2.life)
    player2.x, player2.y = fisica.world:move(player2, player2.x, player2.y-25)
elseif player1.attack and player1.down and player1.height+player1.attackY >= player2.y then
    player2.life = player2.life - 1000
    print(player2.life)
    player2.x, player2.y = fisica.world:move(player2, player2.x, player2.y+25)
elseif player1.attack and player1.right and player1.width+player1.attackX >= player2.x then
    player2.life = player2.life - 1000
    print(player2.life)
    player2.x, player2.y = fisica.world:move(player2, player2.x+25, player2.y)
elseif player1.attack and player1.left and player1.x-player1.attackX <= player2.x then
    player2.life = player2.life - 1000
    print(player2.life)
    player2.x, player2.y = fisica.world:move(player2, player2.x-25, player2.y)
end