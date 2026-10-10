local world = require('world')

local boss = {}
boss.body = love.physics.newBody(world, 450, 600, 'dynamic')
boss.shape = love.physics.newCircleShape(0, 0, 10)

-- fix into place. Set mass so it can be moved by boss input, but not by bullet or border
boss.fixture = love.physics.newFixture(boss.body, boss.shape, 1)
boss.fixture:setUserData(boss)

-- to use sensor to relay when boss is hit
boss.fixture:setSensor(true)

boss.health = 10
boss.id = "boss"

boss.damaged = function(self) 
    print("boss hit")
    boss.health = boss.health - 1
end



return boss
