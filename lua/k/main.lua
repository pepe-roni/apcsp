display.setStatusBar(display.HiddenStatusBar)

local background = display.newImage("images/back_1.jpg")
background.x =display.contentCenterX
background.y = display.contentCenterY

local logo = display.newImage("images/onlyLogo.png")
logo.x = display.contentCenterX
logo.y = display.contentCenterY - 300


local text = display.newText("Click Here", logo.x, logo.y+120,"fonts/Roboto-LightItalic.ttf", 50)


local function fade()
	transition.to(background,{time = 1000, alpha = 0})
	transition.to(logo, {time = 500, alpha = 0})
end
Runtime:addEventListener("tap", fade)

local function shape()
	local rect = display.newRect(display.contentCenterX,display.contentCenterY,100,100)
	rect:setFillColor(1,0.2,0.3)
	rect.alpha = 0
	transition.to(rect, {time = 3000, alpha = 1})
end

local function meme()
	local back2 = display.newImage("images/back_2.jpeg")
	back2.alpha = 0
	back2.x =display.contentCenterX
	back2.y = display.contentCenterY
	local text = display.newText("Enspire Music", logo.x, logo.y-120,"fonts/Roboto-LightItalic.ttf", 50)
	text.alpha = 0
	transition.to(back2, {time = 3000, alpha = 1})
	transition.to(text, {time=2000, alpha = 1})
	shape()
end
Runtime:addEventListener("tap", meme)

transition.from(logo, {time = 1000, alpha = 0})


