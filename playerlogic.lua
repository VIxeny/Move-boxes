---@diagnostic disable: lowercase-global
pressedDirection = nil
clevel = current_level
tile_tables = tiles
playerOnePos = {x = 0, y = 0}
mup = false
mdown = false
mleft = false
mright = false

directions = {
    up = {x =0, y= 1},
    down = {x =0,  y=-1},
    left = {x =-1, y= 0},
    right = {x =1, y= 0}
}
dkeys = {
    w = true,
    s = true,
    a = true,
    d = true
}


--playerTwoPos = {}
function getPlayerOnePos(level)
    for i = 1,#level do
        for j=1,#level do
            if level[i][j] == tile_tables.player1 then
                playerOnePos = {i,j}
            end
        end
    end
end

--function getPlayerTwoPos(level)
--for i = 1,#level do
--        for j=1,#level do
--            if level[i][j] == tile_tables.player2 then
--                playerTwoPos = {i,j}
--            end
--        end
--    end
--end

function canMove(level, direction)
    getPlayerOnePos(level)
    local newX = playerOnePos.x + directions[pressedDirection].x -- я слишком туп, помогай пожалустаааааа (если что, я собираюсь не пользоваться ИИ до конца)
    local newY = playerOnePos.y + directions[pressedDirection].y

    if level[newX] and level[newX][newY] and level[newX][newY] ~= tile_tables.wall then
        love.graphics.print("Wall not found", 10, 10)
    else
        love.graphics.print("Wall found", 10, 10)
    end
end

function MovePlayer(direction)
    --сделать движение
end

function Test(key)
    if dkeys[key] then
        pressedDirection = key
        canMove(clevel,pressedDirection)
    end
end