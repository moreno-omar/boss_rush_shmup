local world = require('world')

local player = {}
player.body = love.physics.newBody(world, 450, 1000, 'dynamic')
player.shape = love.physics.newCircleShape(0, 0, 10)

-- fix into place. Set mass so it can be moved by player input, but not by bullet or border
player.fixture = love.physics.newFixture(player.body, player.shape, 1)

return player
