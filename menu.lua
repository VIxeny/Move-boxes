

local buttonPrototype = {x = 0, y = 0, w = 200, h = 50, text = "text", func = function() print("Button is clicked") end}

---@param x number? 
---@param y number? 
---@param w number? 
---@param h number? 
---@param text string?
function CreateButton(x, y, w, h, text, func)
    local button = {x = x, y = y, w = w, h = h, text = text, func = func}
    setmetatable(button, {__index = buttonPrototype})
    return button
end


local ButtonsActive
local singlePlayerButtons
local mainMenuButtons
local buttonBack

local function ShowSinglePlayerButtons()
    ButtonsActive = singlePlayerButtons
end

function Back()
    ButtonsActive = mainMenuButtons
end

buttonBack = CreateButton(WidthOfScreen-300, HeightOfScreen-100, 200, 50, "back", Back)

singlePlayerButtons = {
    CreateButton(WidthOfScreen/2 - 200, HeightOfScreen/2 + 100, 50, 50, "1"),
    CreateButton(WidthOfScreen/2 - 100, HeightOfScreen/2 + 100, 50, 50, "2"),
    CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 100, 50, 50, "3"),
    CreateButton(WidthOfScreen/2 + 100, HeightOfScreen/2 + 100, 50, 50, "4"),
    CreateButton(WidthOfScreen/2 + 200, HeightOfScreen/2 + 100, 50, 50, "5"),
    buttonBack
}

mainMenuButtons = {
    CreateButton(WidthOfScreen/2, HeightOfScreen/2, 400, 50, "SINGLEPLAYER", ShowSinglePlayerButtons),
    CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 70, 400, 50, "SPLITSCREEN"),
    CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 140, 400, 50, "MULTIPLAYER")
}



ButtonsActive = mainMenuButtons
function DrawButton(button, extraColor)
    love.graphics.setColor(1 - extraColor[1], 1 - extraColor[2], 1 - extraColor[3])
    love.graphics.rectangle("fill", button.x - button.w/2, button.y - button.h/2, button.w, button.h)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(button.text, button.x - button.w/2, button.y - button.h/2.3, button.w, "center")
end

function UpdateMenu()
    if love.mouse.isDown(1) then
        for index, button in ipairs(ButtonsActive) do
            local cursorX, cursorY = love.mouse.getX(), love.mouse.getY()
            if cursorX > button.x - button.w/2 and cursorX < button.x + button.w/2 and
               cursorY > button.y - button.h/2 and cursorY < button.y + button.h/2 then
                button.func()
            end
        end
    end
end

function DrawMenu()
    for index, button in ipairs(ButtonsActive) do
        local extraColor = {0, 0, 0}
        local cursorX, cursorY = love.mouse.getX(), love.mouse.getY()
        if cursorX > button.x - button.w/2 and cursorX < button.x + button.w/2 and
           cursorY > button.y - button.h/2 and cursorY < button.y + button.h/2 then
            extraColor = {0.3, 0.3, 0.3}
        end
        DrawButton(button, extraColor)
    end
end