love.graphics.setDefaultFilter("nearest", "nearest")
local levelSprites = {
    love.graphics.newImage("sprites/tile.png"),
    love.graphics.newImage("sprites/wall.png"),
    love.graphics.newImage("sprites/box-finnish.png"),
}
local playerSprite = love.graphics.newImage("sprites/player1.png")
local boxSprite = love.graphics.newImage("sprites/box.png")

local sizeOfSide = levelSprites[1]:getHeight()

function DrawLevel()
    if CurrentLevel then
        love.graphics.setColor({1, 1, 1})
        local scale = HeightOfScreen / (#CurrentLevel * sizeOfSide)
        for indexOfLine, line in ipairs(CurrentLevel) do
            for index, tile in ipairs(line) do
                love.graphics.draw(levelSprites[tile], (index - 1) * sizeOfSide*scale, (indexOfLine - 1) *sizeOfSide *scale, 0, scale, scale)
            end
        end
        love.graphics.draw(playerSprite, (Player.x - 1) * sizeOfSide*scale, (Player.y - 1) * sizeOfSide*scale, 0 , scale, scale)
        for index, box in ipairs(Boxes) do
            love.graphics.draw(boxSprite, (box[1] - 1) * sizeOfSide*scale, (box[2] - 1) * sizeOfSide*scale, 0 , scale, scale)
        end
    end
end