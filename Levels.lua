--[[ Загатовка
local level = {
    {2,2,2,2,2,2},
    {2,1,1,1,1,2},
    {2,1,1,1,1,2},
    {2,1,1,1,1,2},
    {2,1,1,1,1,2},
    {2,2,2,2,2,2},
}
]]

CurrentLevel = nil
NumberOfLevel = nil
function LoadLevel(levelNumber)
    if not levelNumber then
        levelNumber = NumberOfLevel + 1
    end
    CurrentLevel = Levels[levelNumber].map
    Player.x = Levels[levelNumber].playerStart[1]
    Player.y = Levels[levelNumber].playerStart[2]
    for index, box in ipairs(Levels[levelNumber].boxesStart) do
        Boxes[index] = {}
        Boxes[index][1] = Levels[levelNumber].boxesStart[index][1]
        Boxes[index][2] = Levels[levelNumber].boxesStart[index][2]
    end
    NumberOfLevel = levelNumber
end
-- 1-Пол, 2-Стена, 3-Места для коробок
Levels = {
    {
        playerStart = {2, 2},
        map = {
            {2,2,2,2,2,2},
            {2,1,1,3,1,2},
            {2,1,1,1,1,2},
            {2,3,1,1,1,2},
            {2,1,1,1,1,2},
            {2,2,2,2,2,2},
        },
        boxesStart = {
            {3, 4},
            {4, 4}
        }
    },
    {
        playerStart = {2, 2},
        map = {
            {2,2,2,2,2,2},
            {2,1,1,1,1,2},
            {2,1,1,1,1,2},
            {2,1,1,1,3,2},
            {2,1,3,1,1,2},
            {2,2,2,2,2,2},
        },
        boxesStart = {
            {3, 4},
            {4, 4}
        }
    },
    {
        playerStart = {4, 2},
        map = {
            {2,2,2,2,2,2,2,2},
            {2,2,1,1,3,1,1,2},
            {2,2,2,1,2,1,1,2},
            {2,1,2,1,2,1,1,2},
            {2,1,1,1,1,1,3,2},
            {2,1,1,1,2,1,1,2},
            {2,1,3,1,1,1,1,2},
            {2,2,2,2,2,2,2,2},
        },
        boxesStart = {
            {5, 5},
            {3, 5},
            {4, 7}
        }
    },
}
