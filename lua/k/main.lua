display.setStatusBar(display.HiddenStatusBar)

local background = display.newImage("images/back_1.jpg")
background.x =display.contentCenterX
background.y = display.contentCenterY

local logo = display.newImage("images/onlyLogo.png")
logo.x = display.contentCenterX
logo.y = display.contentCenterY - 300


local function fade()
	transition.to(background,{time = 2000, alpha = 0})
	transition.to(logo, {time = 500, alpha = 0})
--	transition.to(background,{time = 4000, display.newImage("images/back_2.jpeg")})
end
Runtime:addEventListener("tap", fade)

local function meme()
	local back2 = display.newImage("images/back_2.jpeg")
	back2.alpha = 0
	back2.x =display.contentCenterX
	back2.y = display.contentCenterY
	transition.to(back2, {time = 3000, alpha = 1})
end
Runtime:addEventListener("tap", meme)
transition.from(logo, {time = 1000, alpha = 0})


