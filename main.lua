---@diagnostic disable: lowercase-global
if arg[2] == "debug" then
    require("lldebugger").start()
end

WidthOfScreen = love.graphics.getWidth()
HeightOfScreen = love.graphics.getHeight()

require("menu")
require("playerlogic")
LoadVarsMenu(WidthOfScreen, HeightOfScreen)

local wall = 1
local box = 2
local bfin = 3
local player1 = 4
local tile = 5
test_level = {
    {wall, wall, wall,wall},
    {wall, bfin, player1, wall},
    {wall, box, tile, wall},
    {wall, tile, tile, wall},
    {wall, wall, wall, wall}
}
LoadVarsLevel(test_level)

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

function love.update()
    
end

function love.draw()
    for i=1,#test_level do
        for j=1,#test_level[i] do
            love.graphics.draw(objects[test_level[i][j]], j*tiles_width, i*tiles_height, 0, scale, scale)
        end
    end
end

