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

local background = display.newImage("/image/ZsfUJx8.jpg")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background.alpha = 0
	background:scale(0.2,0.2)

local barrier = display.newRect(150,540,700,30)

local ball = display.newImage("/image/glassorb1.png")
	ball.x = 150
	ball.y = 100
	ball.alpha = 0

physics.addBody(barrier,"static",{friction=0.5, bounce = 0.5})
physics.addBody(ball,"dynamic",{density=7.0, friction = 1.0, bounce = 0.5})

local gx, gy = physics.getGravity()

local grav = display.newText(gy, 
		display.contentCenterX, display.contentCenterY-100, "/fonts/Roboto-LightItalic.ttf" )
	grav.alpha = 0

local button = display.newRect(165,50,50,30)
	button.alpha = 0 
	button:setFillColor(1,1,0.5)

local button2 = display.newRect(230,50,50,30)
	button2.alpha = 0 
	button2:setFillColor(1,0.8,1)

local button3 = display.newRect(100,50,50,30)
	button3.alpha = 0 
	button3:setFillColor(0.5,1,1)

local function afterclick()
	transition.to(pretext, {time = 300, alpha =0})
	transition.to(preRec, {time = 500, alpha = 0})
	transition.to(background, {time = 1500, alpha = 0.75})
	transition.to(ball, {time = 1500, alpha = 1 })
	transition.to(grav, {time = 500, alpha = 1 })
	transition.to(button, {time = 1500, alpha = 1 })
	transition.to(button2, {time = 1500, alpha = 1 })
	transition.to(button3, {time = 1500, alpha = 1 })
end

local function reset()
	ball.y = 100
end

local function addBall()
	local ball2 = display.newImage("/image/glassorb1.png")
	ball2.x = 150
	ball2.y = 100
	physics.addBody(ball2,"dynamic",{density=7.0, friction = 1.0, bounce = 0.5})
end

local function col()
	local gx, gy = physics.getGravity()
	physics.setGravity(0,gy+1)
	grav.text = gy 
end

local function col2()
	local gx, gy = physics.getGravity()
	physics.setGravity(0,gy-1)
	grav.text = gy
end

button:addEventListener("tap", addBall)
button2:addEventListener("tap", col)
button3:addEventListener("tap", col2)
preRec:addEventListener("tap", afterclick)