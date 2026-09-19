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
return function(pos_x, pos_y)
    local entity = {}
    entity.body = love.physics.newBody(world, pos_x, pos_y, 'dynamic')
    entity.shape = love.physics.newCircleShape(10)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    entity.draw = function(self)
        -- love.graphics.draw(image, 383, 248)
        -- bullet.body:getWorldPoints(bullet.shape:getPoint())
        local self_x, self_y = self.body:getWorldCenter()
        love.graphics.draw(image, self_x, self_y)
    end

    return entity
end
