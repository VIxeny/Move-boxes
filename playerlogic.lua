---@diagnostic disable: lowercase-global
level = current_level
tile_tables = tiles
playerOnePos = {}
mup = false
mdown = false
mleft = false
mright = false
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
function canMove(level)
    getPlayerOnePos(level)
    if playerOnePos + null ~= wall then
            
    end
end

function MovePlayer(direction)
    --сделать движение
end
