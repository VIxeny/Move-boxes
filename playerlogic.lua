---@diagnostic disable: lowercase-global
pressedDirection = nil
clevel = current_level
tile_tables = tiles
playerOnePos = {}
mup = false
mdown = false
mleft = false
mright = false

directions = {
    up = {0, 1},
    down = {0, -1},
    left = {-1, 0},
    right = {1, 0}
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

-- таблица движения для переменной "direction"? типо up = {0,1} down = {0,-1} и т.д.
function canMove(level, direction)
    getPlayerOnePos(level)
    if playerOnePos + direction[pressedDirection] ~= tile_tables.wall then
        love.graphics.print("Wall not found", 10, 10)
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