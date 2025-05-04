require "UI.UILibrary"
local mainMenu = require "UI.mainMenu"
print("XD")

ActiveUI = {mainMenu.firstScreen}

function ManageUI(remove, add)
    ChangeActiveUI(remove, add)
end

