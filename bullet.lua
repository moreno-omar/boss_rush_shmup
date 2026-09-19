local world = require("world")

-- bullet
function loadImage (path)
	local info = love.filesystem.getInfo( path )
	if info then
		return love.graphics.newImage( path )
	end
end

local image = loadImage ("bullets/big1.png")

-- create 1 bullet

-- when importing, have main provide coordinates
-- return function(pos_x, pos_y)

local entity = {}
entity.body = love.physics.newBody(world, 383, 248, 'dynamic')
entity.shape = love.physics.newCircleShape(10)
entity.fixture = love.physics.newFixture(entity.body, entity.shape)
entity.fixture:setUserData(entity)

entity.draw = function(self)
love.graphics.draw(image, 383, 248)
end

return entity
