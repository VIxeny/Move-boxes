---@diagnostic disable: lowercase-global
if arg[2] == "debug" then
    require("lldebugger").start()
end

WidthOfScreen = love.graphics.getWidth()
HeightOfScreen = love.graphics.getHeight()

require("menu")
LoadVarsMenu(WidthOfScreen, HeightOfScreen)
current_level = test_level --сделать логику смены уровня
wall = 1
box = 2
bfin = 3
player1 = 4
tile = 5
test_level = {
    {wall, wall, wall,wall},
    {wall, bfin, player1, wall},
    {wall, box, tile, wall},
    {wall, tile, tile, wall},
    {wall, wall, wall, wall}
}

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    objects = {
        love.graphics.newImage("sprites/wall.png"), -- wall image
        love.graphics.newImage("sprites/box.png"),
        love.graphics.newImage("sprites/box-finnish.png"),  --bfin - box finnish
        love.graphics.newImage("sprites/player1.png"),
        love.graphics.newImage("sprites/tile.png"),
        
    }


    scale = 5
    tiles_width = 16 * scale
    tiles_height = 16 * scale
end

-- оптимизация с "player1 index", то есть, сразу импортировать где игрок в таблице?
function canMove(level,key)
    for i=1,#level do
        for j=1,#level do
            if level[i][j] == player1 then
                
                -- сделать проверку на соседние клетки в стиле (если key == w then проверить что сверху, если можно идти, переместить туда игрока)


            end
        end
    end
end
function MovePlayer(direction)
    --сделать движение
end

function love.update()
--    if love.keypressed(w) then
--        if  canMove(current_level,w) == true then
--            MovePlayer(up)
--        end
--    end
end


function love.draw()
    for i=1,#test_level do
        for j=1,#test_level[i] do
            love.graphics.draw(objects[test_level[i][j]], j*tiles_width, i*tiles_height, 0, scale, scale)
        end
    end
end

