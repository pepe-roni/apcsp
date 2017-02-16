local physics = require ("physics")
physics.start()

local preRec = display.newImage("/image/cyan_texture_by_ladyoftheapocalypse-d9btc9w.jpg")
	preRec.x = display.contentCenterX
	preRec.y = display.contentCenterY
	preRec.xScale = 1.2
	preRec.yScale = 1.2
	preRec.alpha = 0.8 

local pretext = display.newText("Yellow = Draw Ball, Blue, Pink adjust grav",
	display.contentCenterX, display.contentCenterY,"/fonts/Roboto-LightItalic.ttf")
	pretext.alpha = 1 

local background = display.newImage("/image/kek.png")
	background.x = 300
	background.y = display.contentCenterY
	background.alpha = 0
	background:scale(1.5,1.5)


local background2 = display.newImage("/image/kek.png")
	background2.x = 900
	background2.y = display.contentCenterY
	background2.alpha = 0
	background2:scale(1.5,1.5)


local gx, gy = physics.getGravity()

local function afterclick()
	transition.to(pretext, {time = 300, alpha =0})
	transition.to(preRec, {time = 500, alpha = 0})
	transition.to(background, {time = 1500, alpha = 0.75})
	transition.to(background2, {time = 1500, alpha = 0.75})
end

local function left()
	background.x = background.x - 1
	if(background.x<-600) then
		background.x = 600
	end
	background2.x = background2.x - 1
	if(background2.x<-600) then
		background2.x=600
	end
end

timer.performWithDelay(1, left, -1)

local function reset()
	ball.y = 100
end

preRec:addEventListener("tap", afterclick)