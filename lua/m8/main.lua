local preRec = display.newImage("/image/cyan_texture_by_ladyoftheapocalypse-d9btc9w.jpg")
	preRec.x = display.contentCenterX
	preRec.y = display.contentCenterY
	preRec.xScale = 1.2
	preRec.yScale = 1.2
	preRec.alpha = 0.8 

local background = display.newImage("/image/ZsfUJx8.jpg")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background.xScale = 0.5
	background.yScale = 0.5
	background.alpha = 0
local ball = display.newImage("/image/glassorb1.png")
	ball.x = display.contentCenterX
	ball.y = display.contentCenterY - 50
	ball.alpha = 0

local function afterclick()
	transition.to(preRec, {time = 750, alpha = 0})
	transition.to(background, {time = 1500, alpha = 1})
	transition.to(ball, {time = 1500, alpha = 0.75 })
end
Runtime:addEventListener("tap", afterclick)




