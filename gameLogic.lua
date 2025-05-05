Player = {}

Boxes = {}

function PlayerMove(key)
    local direction = {0, 0}
    if key == "w" then
        direction = {0, -1}
    end
    if key == "s" then
        direction = {0, 1}
    end
    if key == "d" then
        direction = {1, 0}
    end
    if key == "a" then
        direction = {-1, 0}
    end

    if direction[1] ~= 0 or direction[2] ~= 0 then
        if CurrentLevel[Player.y + direction[2]][Player.x + direction[1]] ~= 2 then
            local firstBox = HasBox{Player.x + direction[1], Player.y + direction[2]}
            local secondBox = HasBox{Player.x + direction[1]*2, Player.y + direction[2]*2}
            if firstBox then
                if not secondBox and CurrentLevel[Player.y + direction[2]*2][Player.x + direction[1]*2] ~= 2 then
                    firstBox[1] = firstBox[1] + direction[1]
                    firstBox[2] = firstBox[2] + direction[2]
                    Player.x = Player.x + direction[1]
                    Player.y = Player.y + direction[2]
                    CheckWinConditions()
                end
            else
                Player.x = Player.x + direction[1]
                Player.y = Player.y + direction[2]
            end

        end
    end
end

function HasBox(coordinates)
    for index, box in ipairs(Boxes) do
        if coordinates[1] == box[1] and coordinates[2] == box[2] then
            return box
        end
    end
end

function CheckWinConditions()
    local win = true
    for index, box in ipairs(Boxes) do
        if CurrentLevel[box[2]][box[1]] ~= 3 then
            win = false
            break
        end
    end
    if win then
        LoadLevel(NumberOfLevel + 1)
    end
end