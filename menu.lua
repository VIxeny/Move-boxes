

local buttonPrototype = {x = 0, y = 0, w = 200, h = 40, text = "text"}

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
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", button.x - button.w/2, button.y - button.h/2, button.w, button.h)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(button.text, button.x - button.w/2, button.y - button.h/2 - 5, button.w, "center")
end

function DrawMenu()
    for index, value in ipairs(buttons) do
        DrawButton(value)
    end
end