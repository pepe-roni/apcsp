
local physics = require ("physics")
physics.start()
physics.setGravity(-9,9)
math.randomseed(os.time())

local ocean = display.newImage("/image/198p6t2d72mvfjpg.jpg")

local background = display.newImage("/image/1.png")
	background.x = 300
	background.y = display.contentCenterY
	background.alpha = 0
	background:scale(1.5,1.5)

local options = 
{
	width = 175,
	height = 175,
	numFrames = 10,
}

local ti = 800

local squid  = graphics.newImageSheet("/image/act_enm_oct_flm.png", options)
local sequenceData = 
{
	{
		name = "swim",
		start = 1,
		count = 10,
		time=ti,
	},
}

local sprite = display.newSprite(squid,sequenceData)
sprite.x = 240
sprite.alpha = 0
sprite.y =270
sprite:play()

local barrierleft = display.newRect(-75,155,50,350)
local barrierr = display.newRect(560,155,50,350)
local ground = display.newRect(250,350,800,20)

physics.addBody(sprite, {density=1.0,friction = 0.0, bounce = 0.0})
physics.addBody(barrierleft,"static",{friction = 0.0, bounce = 0.0})
physics.addBody(barrierr,"static",{friction = 0.0, bounce = 0.0})
physics.addBody(ground,"static",{friction = 0.0, bounce = 0.0})

local preRec = display.newImage("/image/cyan_texture_by_ladyoftheapocalypse-d9btc9w.jpg")
	preRec.x = display.contentCenterX
	preRec.y = display.contentCenterY
	preRec.xScale = 1.2
	preRec.yScale = 1.2
	preRec.alpha = 0.8 
local background2 = display.newImage("/image/1.png")
	background2.x = 800
	background2.y = display.contentCenterY
	background2.alpha = 0
	background2:scale(1.5,1.5)

local pretext = display.newText("Yellow = Draw Ball, Blue, Pink adjust grav",
	display.contentCenterX, display.contentCenterY,"/fonts/Roboto-LightItalic.ttf")
	pretext.alpha = 1 
--no comment


local function afterclick()
	transition.to(pretext, {time = 300, alpha =0})
	transition.to(preRec, {time = 500, alpha = 0})
	transition.to(background, {time = 1500, alpha = 0.75})
	transition.to(background2, {time = 1500, alpha = 0.85})
	transition.to(sprite, {time = 1500, alpha = 0.5})
end

local torpedo = display.newImage("/image/838178_bomb_512x512.png")
	torpedo.x = math.random(1,450)

local function left()
	background.x = background.x - 30
	if(background.x< -300) then
		background.x = 800
	end
	background2.x = background2.x - 30
	if(background2.x< -300) then
		background2.x= 800
	end
	

end

local function ryzen()
	sprite:applyLinearImpulse(45,0,sprite.x, sprite.y)
	ti = 200
end

timer.performWithDelay(1, left, -1)
Runtime:addEventListener("touch", ryzen)
preRec:addEventListener("tap", afterclick)