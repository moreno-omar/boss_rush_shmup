-- imports
local world = require('world')
local create_bullet = require('bullet')
local player = require('player')

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
local y = 0
local timer = 0 -- for bullet rate

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

    love.graphics.setBackgroundColor(0.78, 0.88, 0.72)

    --love.graphics.draw(image, x_center - x_cirno_center, (height * 0.3) - y_cirno_center)

    -- box for now
    love.graphics.rectangle("fill", x_center - x_cirno_center, (height * 0.3) - y_cirno_center, 40, 40)

    -- draw player
    -- Draw the boss using the physics body coordinates
    -- We subtract 2.5 to center the 5x5 rectangle on the body's X/Y coordinates
    -- has to call getY and getX or it will draw in the same place
    love.graphics.rectangle("fill", player.body:getX() - 2.5,  player.body:getY() - 2.5, 20, 20)

    -- down_bullet:draw()

    --
    for index, value in ipairs(bullets) do
        value:draw()
    end
    --


end


function love.update(dt)
    world:update(dt)

    y = y + (dt * 100)
    local rate = dt * 5000

    timer = timer + 1
--
        -- player shooting
    if love.keyboard.isDown('f') and (timer/10 > 1) then
        table.insert(bullets, player.shoot(player.body:getX() - 2.5,  player.body:getY() - 2.5, create_bullet))

        timer = 0
    end
--]]

    -- move player with input
    if love.keyboard.isDown('up') then
        -- boss_pos_y = boss_pos_y + (input_movement.up * rate)
        player.body:setLinearVelocity(0, (-1 * rate))
    elseif love.keyboard.isDown('down') then
        player.body:setLinearVelocity(0, 1 * rate)
    elseif love.keyboard.isDown('left') then
        player.body:setLinearVelocity(-1 * rate, 0)
    elseif love.keyboard.isDown('right') then
        player.body:setLinearVelocity(1 * rate, 0)
    else
        -- Stop movement when no keys are pressed
        player.body:setLinearVelocity(0, 0)
    end

end
