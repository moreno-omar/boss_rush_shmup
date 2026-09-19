-- useful variables
width, height = love.graphics.getDimensions( )
x_center = width / 2
y_center = height / 2

-- cirno size
-- 134 × 224
-- 67 x 112

function loadImage (path)
	local info = love.filesystem.getInfo( path )
	if info then
		return love.graphics.newImage( path )
	end
end

image = loadImage ("cirno_2x.png")

function love.draw()

    love.graphics.draw(image, x_center - 67, (height * 0.3) - 112)


end


function love.update(dt)
end
