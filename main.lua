-- imports
local world = require('world')
local create_bullet = require('bullet')

local down_bullet = create_bullet(349, 248, 0, 200)
--
local right_bullet = create_bullet(348, 248, 200, 0)
local left_bullet = create_bullet(347, 248, -200, 0)
local up_bullet = create_bullet(346, 248, 0, -200)

local bullets = {
    down_bullet,
    right_bullet,
    left_bullet,
    up_bullet
}
--]]

-- useful variables
local width, height = love.graphics.getDimensions( )
local x_center = width / 2
local y_center = height / 2

-- cirno size
-- 134 × 224
-- 67 x 112
local x_cirno_center, y_cirno_center = 67, 112


function loadImage (path)
	local info = love.filesystem.getInfo( path )
	if info then
		return love.graphics.newImage( path )
	end
end


local image = loadImage ("cirno_2x.png")

function love.draw()

    love.graphics.draw(image, x_center - x_cirno_center, (height * 0.3) - y_cirno_center)

    -- down_bullet:draw()

    --
    for index, value in ipairs(bullets) do
        value:draw()
    end
    --


end


function love.update(dt)
    world:update(dt)
end
