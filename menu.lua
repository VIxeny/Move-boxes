----@param num number # The input number
----@return number # The same number is returned

function LoadVarsMenu(w, h)
    WidthOfScreen, HeightOfScreen = w, h
end

local buttonPrototype = {x = 0, y = 0, w = 100, h = 30, text = "", color = {1, 1, 1}}

---@param x number? 
---@param y number? 
---@param w number? 
---@param h number? 
---@param text string?
function CreateButton(x, y, w, h, text)
    local button = {x = x, y = y, w = w, h = h, text = text}
    setmetatable(button, {__index = buttonPrototype})
    return button
end

local singlePlayerButton = CreateButton(WidthOfScreen/2, HeightOfScreen/2)
local localScreenButton = CreateButton(WidthOfScreen/2, HeightOfScreen/2 + 50)

local buttons = {singlePlayerButton, localScreenButton}

function DrawButton(button)
    love.graphics.rectangle("fill", button.x - button.w/2, button.y - button.h/2, button.w, button.h)
end

function DrawMenu()
    for index, value in ipairs(buttons) do
        DrawButton(value)
    end
end