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

local M = {}

local create_bullet = require('bullet')

function M.Down(bullets)

    local bullets_with_velocity = {}

    for i, xy in ipairs(bullets) do
        table.insert(bullets_with_velocity, create_bullet(xy[1] * 16 , xy[2] *16, 0, 200))
    end

    return bullets_with_velocity

end

return M