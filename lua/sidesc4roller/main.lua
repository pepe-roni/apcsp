local physics = require ("physics")
physics.start()
local options = 
{
	width = 175,
	height = 175,
	numFrames = 10,
}

local squid  = graphics.newImageSheet("/image/act_enm_oct_flm.png", options)
local sequenceData = 
{
	{
		name = "swim",
		start = 1,
		count = 4,
		time=500,
	},
}

local sprite = display.newSprite(squid,sequenceData)
sprite.x = 240
sprite.alpha = 0
sprite.y =270
sprite:play()

local preRec = display.newImage("/image/cyan_texture_by_ladyoftheapocalypse-d9btc9w.jpg")
	preRec.x = display.contentCenterX
	preRec.y = display.contentCenterY
	preRec.xScale = 1.2
	preRec.yScale = 1.2
	preRec.alpha = 0.8 

local pretext = display.newText("Yellow = Draw Ball, Blue, Pink adjust grav",
	display.contentCenterX, display.contentCenterY,"/fonts/Roboto-LightItalic.ttf")
	pretext.alpha = 1 
--no comment
local background = display.newImage("/image/1.png")
	background.x = 300
	background.y = display.contentCenterY
	background.alpha = 0
	background:scale(1.5,1.5)


local background2 = display.newImage("/image/1.png")
	background2.x = -300
	background2.y = display.contentCenterY
	background2.alpha = 0
	background2:scale(1.5,1.5)

local function afterclick()
	transition.to(pretext, {time = 300, alpha =0})
	transition.to(preRec, {time = 500, alpha = 0})
	transition.to(background, {time = 1500, alpha = 0.75})
	transition.to(background2, {time = 1500, alpha = 1})
	transition.to(sprite, {time = 1500, alpha = 1})
end


local function left()
	background.x = background.x + 1.4
	if(background.x> 800) then
		background.x = -300
	end
	background2.x = background2.x + 1.2
	if(background2.x> 800) then
		background2.x=-300
	end
end

timer.performWithDelay(1, left, -1)
preRec:addEventListener("tap", afterclick)