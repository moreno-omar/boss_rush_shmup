local world = require('world')

local player = {}
player.body = love.physics.newBody(world, 450, 1000, 'dynamic')
player.shape = love.physics.newCircleShape(0, 0, 10)

-- fix into place. Set mass so it can be moved by player input, but not by bullet or border
player.fixture = love.physics.newFixture(player.body, player.shape, 1)
player.fixture:setUserData(player)

player.id = "player"

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

player.focus = function (self)
    if player.is_focused == true then
        love.graphics.setColor( 255, 0, 0 )
        --love.graphics.rectangle("line", player.body:getX() + 1.5,  player.body:getY() + 1.5, 10, 10)
        love.graphics.circle("line",player.body:getX(), player.body:getY(), 10 )
        -- return color back to normal
        love.graphics.setColor( 255, 255, 255 )
        
    end
end

player.is_focused = false
player.speed = 1


return player
