

mapa = require "map"
bump = require "bump"

player = { x = 0, y = 0, width = 50, height = 50, speed = 100}
fisica = {}

function love.load()
    fisica.world = bump.newWorld(32)
    fisica.world:add(player, player.x, player.y, player.width, player.height)

    for i = 1, #mapa.layers do
        if mapa.layers[i].type == "objectgroup" then
            v = mapa.layers[i]
            for j = 1, #v.objects do
                objeto = v.objects[j]
                fisica.world:add(objeto, objeto.x, objeto.y, objeto.width, objeto.height)
            end
        end
    end
end

function love.update(dt)
    diff = dt * player.speed
    cols = {}
    if (love.keyboard.isDown("up")) then
        player.x, player.y, cols = fisica.world:move(player, player.x, player.y - diff)
    elseif (love.keyboard.isDown("down")) then
        player.x, player.y, cols = fisica.world:move(player, player.x, player.y + diff)
    elseif (love.keyboard.isDown("left")) then
        player.x, player.y, cols = fisica.world:move(player, player.x - diff, player.y)
    elseif (love.keyboard.isDown("right")) then
        player.x, player.y, cols = fisica.world:move(player, player.x + diff, player.y)
    end

    for i = 1, #cols do
        print(cols[i].other.name)
    end
end

function love.draw()
    love.graphics.rectangle("line", player.x, player.y, player.width, player.height)

    for i = 1, #mapa.layers do
        if mapa.layers[i].type == "objectgroup" then
            v = mapa.layers[i]
            for j = 1, #v.objects do
                objeto = v.objects[j]
                love.graphics.rectangle("fill", objeto.x, objeto.y, objeto.width, objeto.height)
            end
        end
    end
end

--[[

map = {}
fisica = {}
teto = {}
chao = {}
wallLeft = {}
wallRight = {}

window_width = love.graphics.getWidth()
window_height = love.graphics.getHeight()

-- fisica.world = love.physics.newWorld(0, 0, true) -- 9.81 * 64 [Gravidade]

map = {}


function map_load()
	map.all = love.graphics.newImage("arena(2).png")

	love.physics.setMeter(64)
    fisica.world = love.physics.newWorld(0, 0, true) -- 9.81 * 64
    fisica.player1 = love.physics.newBody(fisica.world, 75, 75, "dynamic")
    fisica.fixture = love.physics.newFixture(fisica.player1, love.physics.newRectangleShape(50, 50))
    fisica.player2 = love.physics.newBody(fisica.world, 75, 375, "dynamic")
    fisica.fixture = love.physics.newFixture(fisica.player2, love.physics.newRectangleShape(50, 50))

    teto.body = love.physics.newBody(fisica.world, 0 + love.graphics.getWidth() / 2, 10, "static")
    teto.fixture = love.physics.newFixture(teto.body, love.physics.newRectangleShape(love.graphics.getWidth(), -30))

	chao.body = love.physics.newBody(fisica.world, 0 + love.graphics.getWidth() / 2, love.graphics.getHeight() - 10, "static")
    chao.fixture = love.physics.newFixture(chao.body, love.physics.newRectangleShape(love.graphics.getWidth(), 30))

	wallRight.body = love.physics.newBody(fisica.world, love.graphics.getWidth() - 10, 0 + love.graphics.getHeight() / 2, "static")
	wallRight.fixture = love.physics.newFixture(wallRight.body, love.physics.newRectangleShape(-15, love.graphics.getHeight()))

	wallLeft.body = love.physics.newBody(fisica.world, 10, 0 + love.graphics.getHeight() / 2, "static")
	wallLeft.fixture = love.physics.newFixture(wallLeft.body, love.physics.newRectangleShape(-25, love.graphics.getHeight()))

end



function map_draw()
	love.graphics.draw(map.all, 0, 0, 0, 1.68, 1.8)

end

]]--
