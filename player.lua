local world = require('world')

local player = {}
player.body = love.physics.newBody(world, 450, 1000, 'dynamic')
player.shape = love.physics.newCircleShape(0, 0, 10)

-- fix into place. Set mass so it can be moved by player input, but not by bullet or border
player.fixture = love.physics.newFixture(player.body, player.shape, 1)

player.shoot = function (x, y, bullet)
    -- should create a bullet, vertical offset. with velocity
    -- get players movements | Body:getPosition
    -- x, y = player.body:getPosition()


    return bullet(x, y - 40, 0, -400)
end

player.damaged = function (self)
    print("player hit")
end

-- color attribute. r,g,b
player.color = {0,0,0}


return player
