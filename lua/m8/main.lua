local preRec = display.newImage("/image/cyan_texture_by_ladyoftheapocalypse-d9btc9w.jpg")
	preRec.x = display.contentCenterX
	preRec.y = display.contentCenterY
	preRec.xScale = 1.2
	preRec.yScale = 1.2
	preRec.alpha = 0.8 

local pretext = display.newText("Click to display stuff.",
	display.contentCenterX,display.contentCenterY,"/fonts/Roboto-LightItalic.ttf" )
	pretext:scale(1.2,1.2)

	pretext.x = display.contentCenterX
	pretext.y = display.contentCenterY
	pretext.alpha = 1 
local background = display.newImage("/image/ZsfUJx8.jpg")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background.xScale = 0.5
	background.yScale = 0.5
	background.alpha = 0
local ball = display.newImage("/image/glassorb1.png")
	ball.x = display.contentCenterX
	ball.y = display.contentCenterY - 50
	ball:scale(1.1,1.1)
	ball.alpha = 0
local meme = display.newText(" ",display.contentCenterX,display.contentCenterY-50,"/fonts/Roboto-Italic.ttf")
meme:scale(1.2,1.2)
local function afterclick()
	transition.to(pretext, {time = 300, alpha =0})
	transition.to(preRec, {time = 500, alpha = 0})
	transition.to(background, {time = 1500, alpha = 0.75})
	transition.to(ball, {time = 1500, alpha = 0.75 })
	local stuff = {"It is certain","It is decidedly so",
"Without a doubt",
"Yes definitely",
"You may rely on it",
"As I see it, yes",
"Most likely",
"Outlook good",
"Yes",
"Signs point to yes",
"Reply hazy try again",
"Ask again later",
"Better not tell you now",
"Cannot predict now",
"Concentrate and ask again",
"Dont count on it",
"My reply is no",
"My sources say no",
"Outlook not so good",
"Very doubtful"}
	meme.alpha = 1
	meme:setFillColor(1,1,0.5)
	meme.text = stuff[math.random(1,20)]
end

Runtime:addEventListener("tap", afterclick)

local function change()
	transition.to(meme, {time = 1000, alpha = 1})
end

Runtime:addEventListener("tap", change)
