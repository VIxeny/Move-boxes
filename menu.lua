
local utf8 = require("utf8")
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
local fieldsActive
local singlePlayerButtons
local splitScreenButtons
local multiplayerButtons
local joinButtons
local joinField
local mainMenuButtons
local buttonBack

local field = {x = WidthOfScreen/2, y = HeightOfScreen/2, w = 600, h = 50, text = ""}

local function ShowSinglePlayerButtons()
    ButtonsActive = singlePlayerButtons
end
local function ShowSplitScreenButtons()
    ButtonsActive = splitScreenButtons
end
local function ShowMultiplayerButtons()
    ButtonsActive = multiplayerButtons
end
local function ShowHostButtons()
    --launch server
    ButtonsActive = splitScreenButtons
end
local function ShowJoinButtons()
    ButtonsActive = joinButtons
    fieldsActive = joinField
end

function Back()
    ButtonsActive = mainMenuButtons
    if fieldsActive then
        fieldsActive[1].text = ""
        fieldsActive = nil
    end
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

splitScreenButtons = {
    CreateButton(WidthOfScreen/2 - 200, HeightOfScreen/2 + 100, 50, 50, "1"),
    CreateButton(WidthOfScreen/2 - 100, HeightOfScreen/2 + 100, 50, 50, "2"),
    CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 100, 50, 50, "3"),
    CreateButton(WidthOfScreen/2 + 100, HeightOfScreen/2 + 100, 50, 50, "4"),
    CreateButton(WidthOfScreen/2 + 200, HeightOfScreen/2 + 100, 50, 50, "5"),
    buttonBack
}
multiplayerButtons = {
    CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 30, 200, 50, "host", ShowHostButtons),
    CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 100, 200, 50, "join", ShowJoinButtons),
    buttonBack
}

joinButtons = {
    CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 100, 200, 50, "Connect"),
    buttonBack
}

mainMenuButtons = {
    CreateButton(WidthOfScreen/2, HeightOfScreen/2, 400, 50, "SINGLEPLAYER", ShowSinglePlayerButtons),
    CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 70, 400, 50, "SPLITSCREEN", ShowSplitScreenButtons),
    CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 140, 400, 50, "MULTIPLAYER", ShowMultiplayerButtons)
}

joinField = {
    field
}



ButtonsActive = mainMenuButtons
function DrawButton(button, extraColor)
    love.graphics.setColor(1 - extraColor[1], 1 - extraColor[2], 1 - extraColor[3])
    love.graphics.rectangle("fill", button.x - button.w/2, button.y - button.h/2, button.w, button.h)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(button.text, button.x - button.w/2, button.y - button.h/2.3, button.w, "center")
end

function DrawField(field)
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.rectangle("fill", field.x - field.w/2, field.y - field.h/2, field.w, field.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", field.x - field.w/2, field.y - field.h/2, field.w, field.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(field.text, field.x - field.w/2 + 5, field.y - field.h/2.3)
end

local previousFrameCursorPressed = false
function UpdateMenu()
    if love.mouse.isDown(1) and not previousFrameCursorPressed then
        for index, button in ipairs(ButtonsActive) do
            local cursorX, cursorY = love.mouse.getX(), love.mouse.getY()
            if cursorX > button.x - button.w/2 and cursorX < button.x + button.w/2 and
               cursorY > button.y - button.h/2 and cursorY < button.y + button.h/2 then
                button.func()
            end
        end
        previousFrameCursorPressed = true
    elseif not love.mouse.isDown(1) then
        previousFrameCursorPressed = false
    end
end

function PressedKeyUI(key)
    if fieldsActive and key == "backspace" then
        local byteOffset = utf8.offset(fieldsActive[1].text, -1)
        if byteOffset then
            fieldsActive[1].text = string.sub(fieldsActive[1].text, 1, byteOffset - 1)
        end
    end
end

function love.textinput(text)
    if fieldsActive then
        fieldsActive[1].text = fieldsActive[1].text .. text
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
    if fieldsActive then
        for index, field in ipairs(fieldsActive) do
            DrawField(field)
        end 
    end
end