-- imports
local world = require('world')
local bullet = require('bullet')


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

    bullet:draw(x_center - x_cirno_center, (height * 0.3) - y_cirno_center)


end


function love.update(dt)
end
