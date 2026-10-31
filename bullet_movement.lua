-- to set velocity of bullets based on movement one wants to achieve
-- use as module

--[[

Input : bullet table from bullet_pattern file

Bullet movement
- down
- aimed / aimed offset
- pop -> randomly go up and then fall down
- radiate
- orbit

Output : bullet made with create_bullet with desired velocities


--]]

local create_bullet = require('bullet')

local M = {}
local bullets_with_velocity = {}
local bullet_rate = 20

-- helper functions only for this file

local function player_slope(bullet_pair, player)
    -- local bx = ((player.body:getX() - bullet_pair[1]) / bullet_pair[1]) * bullet_rate
    local bx = (((bullet_pair[1]*16) - player.body:getX()) / (bullet_pair[1] * 16)) * bullet_rate
    local by = ((player.body:getY()- (bullet_pair[2])*16) / (bullet_pair[2] * 16) ) * bullet_rate

    return {bx, by}
end


-- can be used within bullet pattern
-- later -> call create_bullet from 2nd argument passed?
function M.Down(bullets)

    for i, xy in ipairs(bullets) do
        table.insert(bullets_with_velocity, create_bullet(xy[1] * 16 , xy[2] *16, 0, 200))
    end

    return bullets_with_velocity

end

-- following functions have to be in main
-- since they require either player or boss

M.aimed = function(bullets, player)


--[[
    local temp = player_slope(bullets[1], player)
    return(temp[1])
--]]

---[[
    

    for i, xy in pairs(bullets) do
        local temp = player_slope(xy, player)
        table.insert(bullets_with_velocity, create_bullet(xy[1] * 16 , xy[2] *16, temp[1], temp[2]))
    end

    return bullets_with_velocity
--]]



end



return M