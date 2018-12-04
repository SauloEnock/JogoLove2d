

map = {}
fisica = {}
teto = {}
chao = {}
wallLeft = {}
wallRight = {}

-- fisica.world = love.physics.newWorld(0, 0, true) -- 9.81 * 64

map = {}


function map_load()
	map.all = love.graphics.newImage("arena(2).png")

	love.physics.setMeter(64)
    fisica.world = love.physics.newWorld(0, 0, true) -- 9.81 * 64
    fisica.player = love.physics.newBody(fisica.world, player.x - 25, player.y - 25, "dynamic")
    fisica.fixture = love.physics.newFixture(fisica.player, love.physics.newRectangleShape(50, 50))

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

--[[

fisica = {}

map = {}
pedra = {}
chao = {}
wallLeft = {}
wallRight = {}

fisica.world = love.physics.newWorld(0, 0, true) -- 9.81 * 64

function map_load()

    map.all = love.graphics.newImage("arena(1).png")

    pedra.body = love.physics.newBody(fisica.world, 0, 0, "static")
    pedra.fixture = love.physics.newFixture(pedra.body, love.physics.newRectangleShape(50, 50))

    chao.body = love.physics.newBody(fisica.world, 0 + love.graphics.getWidth() / 1, love.graphics.getHeight() - 10, "static")
    chao.fixture = love.physics.newFixture(chao.body, love.physics.newRectangleShape(love.graphics.getWidth(), 100))

    wallLeft.body = love.physics.newBody(fisica.world, 0, 0, "static")
    wallLeft.fixture = love.physics.newFixture(wallLeft.body, love.graphics.newRectangleShape(10, love.graphics.getHeight()))

    wallRight.body = love.physics.newBody(fisica.world, 0, 0, "static")
    wallRight.fixture = love.physics.newFixture(wallRight.body, love.graphics.newRectangleShape(600, love.graphics.getHeight()))

end

function map_draw()
	love.graphics.draw(map.all, 10, 50, 0, 1.65, 3.4)
end

--

map = {}


function map_load()
	map.all = love.graphics.newImage("arena(1).png")

end



function map_draw()
	love.graphics.draw(map.all, 10, 50, 0, 2.65, 3.4)
end

]]--
