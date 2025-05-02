---@diagnostic disable: lowercase-global
if arg[2] == "debug" then
    require("lldebugger").start()
end

WidthOfScreen = love.graphics.getWidth()
HeightOfScreen = love.graphics.getHeight()
MyFont = love.graphics.newFont("PixelizerBold.ttf", 50)
love.graphics.setFont(MyFont)


require("menu")
 --сделать логику смены уровня
tiles = {wall =1, box = 2, bfin =3, tile =4, player1 =5, player2 =6}
test_level = {
    {tiles.wall, tiles.wall, tiles.wall,tiles.wall},
    {tiles.wall, tiles.bfin, tiles.player1, tiles.wall},
    {tiles.wall, tiles.box, tiles.tile, tiles.wall},
    {tiles.wall, tiles.tile, tiles.tile, tiles.wall},
    {tiles.wall, tiles.wall, tiles.wall, tiles.wall}
}
current_level = test_level
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    objects = {
        love.graphics.newImage("sprites/wall.png"),
        love.graphics.newImage("sprites/box.png"),
        love.graphics.newImage("sprites/box-finnish.png"),
        love.graphics.newImage("sprites/tile.png"),
        love.graphics.newImage("sprites/player1.png"),
        love.graphics.newImage("sprites/player1.png"),
    }

    scale = 5
    tiles_width = 16 * scale
    tiles_height = 16 * scale
end

require("playerlogic")
--Не забыть включить DrawMenu при включении UpdateMenu
function love.update()
    UpdateMenu()
end

function love.keypressed(key)
    PressedKeyUI(key)
    Test(key)
end

--Не забыть включить UpdateMenu при включении DrawMenu
function love.draw()
    --love.graphics.setColor(1, 1, 1)
    --for i=1,#test_level do
        --for j=1,#test_level[i] do
            --love.graphics.draw(objects[test_level[i][j]], j*tiles_width, i*tiles_height, 0, scale, scale)
        --end
    --end
    DrawMenu()
end

