---@diagnostic disable: lowercase-global
if arg[2] == "debug" then
    require("lldebugger").start()
end

WidthOfScreen = love.graphics.getWidth()
HeightOfScreen = love.graphics.getHeight()

require("menu")
require("playerlogic")
LoadVarsMenu(WidthOfScreen, HeightOfScreen)

local wall = 0
local box = 1
local bfin = 2
local player1 = 3
local tile = 4
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
    walli = love.graphics.newImage("sprites/wall.png") -- wall image
    boxi = love.graphics.newImage("sprites/box.png")
    playeri = love.graphics.newImage("sprites/player1.png")
    tilei = love.graphics.newImage("sprites/tile.png")
    bfini = love.graphics.newImage("sprites/box-finnish.png")  --bfin - box finnish

    scale = 5
    tiles_width = 16 * scale
    tiles_height = 16 * scale
end

function love.update()
    
end

function love.draw()
    for i=1,#test_level do
        for j=1,#test_level[i] do
            if test_level[i][j] == wall then
                love.graphics.draw(walli, j*tiles_width, i*tiles_height, 0, scale, scale)
            end 
            if test_level[i][j] == box then
                love.graphics.draw(boxi, j*tiles_width, i*tiles_height, 0, scale, scale)
            end 
            if test_level[i][j] == bfin then
                love.graphics.draw(bfini, j*tiles_width, i*tiles_height, 0, scale, scale)
            end 
            if test_level[i][j] == tile then
                love.graphics.draw(tilei, j*tiles_width, i*tiles_height, 0, scale, scale)
            end 
            if test_level[i][j] == player then
                love.graphics.draw(playeri, j*tiles_width, i*tiles_height, 0, scale, scale)
            end 
        end
    end
end

