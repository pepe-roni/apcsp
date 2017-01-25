display.setStatusBar(display.HiddenStatusBar)
local degrees = 0

local background = display.newImage("images/back_1.jpg")
background.x =display.contentCenterX
background.y = display.contentCenterY
-- 400x, 600y
local logo = display.newImage("images/onlyLogo.png")
logo:rotate(degrees)
logo.x = display.contentCenterX
logo.y = display.contentCenterY*0.5
rot()

local function rot()
	degrees = degrees + 1
end