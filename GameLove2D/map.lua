

mapa = require "maptiled(1)"
bump = require "bump"

sounds = {}
fisica = {}
fisica.world = bump.newWorld(64)


function map_load()
    sounds.hit = love.audio.newSource('sounds/sword_slash_sound.wav', 'static')
    sounds.hit2 = love.audio.newSource('sounds/mace_hit_sound.wav', 'static')
    arena = love.graphics.newImage("arena(2).png")

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

function map_update(dt)
    
end

function map_draw()
    love.graphics.draw(arena, 0, -4)
end

--[[

for i = 1, #mapa.layers do
        if mapa.layers[i].type == "objectgroup" then
            v = mapa.layers[i]
            for j = 1, #v.objects do
                objeto = v.objects[j]
                love.graphics.rectangle("fill", objeto.x, objeto.y, objeto.width, objeto.height)
            end
        end
    end

---

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
    fisica.player11 = love.physics.newBody(fisica.world, 75, 75, "dynamic")
    fisica.fixture = love.physics.newFixture(fisica.player11, love.physics.newRectangleShape(50, 50))
    fisica.player12 = love.physics.newBody(fisica.world, 75, 375, "dynamic")
    fisica.fixture = love.physics.newFixture(fisica.player12, love.physics.newRectangleShape(50, 50))

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
