--[[
local myText = UI.Text.new({text = "Hello world", color = {1, 1, 1}, font = {30}})
local myImage = UI.Image.new({x = 400, w = 200})
local myButton = UI.Button.new{x = 400, y = 200, trigger = function ()
    ManageUI({menu.firstScreen}, {menu.secondScreen})
end}
local myButton2 = UI.Button.new{x = 450, y = 200, text = UI.Text.new{text = "Hahaha", alignH = "center", alignV = "down"}}

--local myImage2 = UI.Image.new{y= 200, image = "Sword.png"}
local textField = UI.TextField.new{y = 300, amountOfLines = 2}

menu = {
    firstScreen = {myText, myImage, myButton, {myButton2}, textField},
    --secondScreen = {myImage2}
}
]]

local menu

local singlePlayerButton = UI.Button.new{
    x = WidthOfScreen/2 - 175, y = HeightOfScreen/2, w = 350, h = 50, text = UI.Text.new{text = "SINGLEPLAYER", alignH = "center", y = 4},
    trigger = function() 
        ShowTimer()
        LoadLevel(1)
    end
}
local splitScreenButton = UI.Button.new{
    x = WidthOfScreen/2 - 175, y = HeightOfScreen/2 + 70, w = 350, h = 50, text = UI.Text.new{text = "SPLITSCREEN", alignH = "center", y = 4},
    trigger = function() ManageUI({menu.firstScreen}, {menu.splitScreenMenu}) end
}
local multiplayerButton = UI.Button.new{
    x = WidthOfScreen/2 - 175, y = HeightOfScreen/2 + 140, w = 350, h = 50, text = UI.Text.new{text = "MULTIPLAYER", alignH = "center", y = 4},
    trigger = function() ManageUI({menu.firstScreen}, {menu.multiplayerMenu}) end
}
local backButton = UI.Button.new{
    x = WidthOfScreen/2 + 100, y = HeightOfScreen/2 + 210, w = 200, h = 50, text = UI.Text.new{text = "back", alignH = "center", y = 4},
    trigger = function() 
        ManageUI({menu.singlePlayerMenu, menu.splitScreenMenu, menu.multiplayerMenu, menu.hostMenu, menu.joinMenu}, {menu.firstScreen})
    end
}

local crossImage1 = UI.Image.new{
    image = "UI/Cross.png", x = WidthOfScreen/2 - 175, y = HeightOfScreen/2 + 70
}
local crossImage2 = UI.Image.new{
    image = "UI/Cross.png", x = WidthOfScreen/2 - 175, y = HeightOfScreen/2 + 140
}


local singlePlayerMenu = {
    UI.Button.new{
        x = WidthOfScreen/2 - 250, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "1", alignH = "center", y = 4},
        trigger = function() 
            ManageUI({menu.singlePlayerMenu}, {})
            LoadLevel(1)
        end
    },
    UI.Button.new{
        x = WidthOfScreen/2 - 150, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "2", alignH = "center", y = 4},
        trigger = function() 
            ManageUI({menu.singlePlayerMenu}, {})
            LoadLevel(2)
        end
    },
    UI.Button.new{
        x = WidthOfScreen/2 - 50, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "3", alignH = "center", y = 4},
        trigger = function() 
            ManageUI({menu.singlePlayerMenu}, {})
            LoadLevel(3)
        end
    },
    UI.Button.new{
        x = WidthOfScreen/2 + 50, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "4", alignH = "center", y = 4}
    },
    UI.Button.new{
        x = WidthOfScreen/2 + 150, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "5", alignH = "center", y = 4}
    },
    backButton
}

local splitScreenMenu = {
    UI.Button.new{
        x = WidthOfScreen/2 - 250, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "1", alignH = "center", y = 4}
    },
    UI.Button.new{
        x = WidthOfScreen/2 - 150, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "2", alignH = "center", y = 4}
    },
    UI.Button.new{
        x = WidthOfScreen/2 - 50, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "3", alignH = "center", y = 4}
    },
    UI.Button.new{
        x = WidthOfScreen/2 + 50, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "4", alignH = "center", y = 4}
    },
    UI.Button.new{
        x = WidthOfScreen/2 + 150, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "5", alignH = "center", y = 4}
    },
    backButton
}

local multiplayerMenu = {
    UI.Button.new{
        x = WidthOfScreen/2 - 100, y = HeightOfScreen/2, w = 200, h = 50, text = UI.Text.new{text = "host", alignH = "center", y = 4},
        trigger = function() ManageUI({menu.multiplayerMenu}, {menu.hostMenu}) end
    },
    UI.Button.new{
        x = WidthOfScreen/2 - 100, y = HeightOfScreen/2 + 70, w = 200, h = 50, text = UI.Text.new{text = "join", alignH = "center", y = 4},
        trigger = function() ManageUI({menu.multiplayerMenu}, {menu.joinMenu}) end
    },
    backButton
}

local hostMenu = {
    UI.Button.new{
        x = WidthOfScreen/2 - 250, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "1", alignH = "center", y = 4}
    },
    UI.Button.new{
        x = WidthOfScreen/2 - 150, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "2", alignH = "center", y = 4}
    },
    UI.Button.new{
        x = WidthOfScreen/2 - 50, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "3", alignH = "center", y = 4}
    },
    UI.Button.new{
        x = WidthOfScreen/2 + 50, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "4", alignH = "center", y = 4}
    },
    UI.Button.new{
        x = WidthOfScreen/2 + 150, y = HeightOfScreen/2 + 70, w = 50, h = 50, text = UI.Text.new{text = "5", alignH = "center", y = 4}
    },
    backButton
}

local joinMenu = {
    UI.TextField.new{
        x = WidthOfScreen/2 - 300, y = HeightOfScreen/2, w = 600, h = 50, text = UI.Text.new{color = {1, 1, 1}}, amountOfCharacters = 20
    },
    UI.Button.new{
        x = WidthOfScreen/2 - 100, y = HeightOfScreen/2 + 70, w = 200, text = UI.Text.new{text = "connect", alignH = "center"}
    },
    backButton
}

menu = {
    firstScreen = {singlePlayerButton, splitScreenButton, multiplayerButton, crossImage1, crossImage2},
    singlePlayerMenu = singlePlayerMenu,
    splitScreenMenu = splitScreenMenu,
    multiplayerMenu = multiplayerMenu,
    hostMenu = hostMenu,
    joinMenu = joinMenu
}

return menu