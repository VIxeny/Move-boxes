require "UI.UILibrary"
local mainMenu = require "UI.mainMenu"

ActiveUI = {mainMenu.firstScreen}

local restartButton = UI.Button.new{
    x = WidthOfScreen/2 + 200, y = HeightOfScreen/2 + 210, w = 200, h = 50, text = UI.Text.new{text = "restart", alignH = "center", y = 4},
    trigger = function()
        LoadLevel(NumberOfLevel)
    end
}

TimerText = UI.Text.new{
    x = WidthOfScreen/2 + 200, color = {1, 1, 1}
}

IqText = UI.Text.new{
    x = WidthOfScreen/2 - 200, w = 400, y = HeightOfScreen/2 - 25, alignH = "center", color = {1, 1, 1}
}

function ManageUI(remove, add)
    ChangeActiveUI(remove, add)
end

function ShowTimer()
    ChangeActiveUI({mainMenu.firstScreen}, {TimerText, restartButton})
end

function ShowIQ()
    ChangeActiveUI({TimerText, restartButton}, {IqText})
end