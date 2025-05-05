require "UI.UILibrary"
local mainMenu = require "UI.mainMenu"
print("XD")

ActiveUI = {mainMenu.firstScreen}

local restartButton = UI.Button.new{
    x = WidthOfScreen/2 + 200, y = HeightOfScreen/2 + 210, w = 200, h = 50, text = UI.Text.new{text = "restart", alignH = "center", y = 4},
    trigger = function()
        LoadLevel(NumberOfLevel)
    end
}

function ManageUI(remove, add)
    ChangeActiveUI(remove, add)
    if #ActiveUI == 0 then
        ChangeActiveUI({}, {restartButton})
    end
end

