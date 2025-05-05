---@diagnostic disable: lowercase-global
if arg[2] == "debug" then
    require("lldebugger").start()
end

WidthOfScreen = love.graphics.getWidth()
HeightOfScreen = love.graphics.getHeight()
MyFont = love.graphics.newFont("UI/PixelizerBold.ttf", 50)
love.graphics.setFont(MyFont)

require("UI.UIManager")
require("gameLogic")
require("Levels")
require("DisplayScene")

IQ = 1000
Timer = 0

function love.load()

end

function love.update(dt)
    if CurrentLevel then
        Timer = Timer + dt
        TimerText.text = Timer - Timer % 0.01
    end
    UpdateUI()
end

--Не забыть включить UpdateMenu при включении DrawMenu
function love.draw()
    DrawLevel()
    DrawUI()
end

function love.keypressed(key)
    if CurrentLevel then
        PlayerMove(key)
    end
    if key == "backspace" then
        UITextDelete()
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        UIOn1Down()
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    if button == 1 then
        UIon1Release()
    end
end

function love.textinput(t)
    UITextInput(t)
end