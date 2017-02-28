
local physics = require ("physics")
physics.start()
physics.setGravity(-10.35,9)
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

local pretext = display.newText("Dont get hit by the torpedo! \n Click to accelerate! \n Torpedo distance is on top along with score \n Click Score to Pause \n Click yellow box to reset when ded",
	display.contentCenterX, display.contentCenterY,"/fonts/Roboto-LightItalic.ttf")
	pretext.alpha = 1 
--no comment

local endgame = true

local function afterclick()
	transition.to(pretext, {time = 300, alpha =0})
	transition.to(preRec, {time = 500, alpha = 0})
	transition.to(background, {time = 1500, alpha = 0.75})
	transition.to(background2, {time = 1500, alpha = 0.85})
	transition.to(sprite, {time = 1500, alpha = 0.5})
	endgame = false
end

local torpedo = display.newImage("/image/838178_bomb_512x512.png")
	torpedo.x = math.random(1,450)
	torpedo.y = -950
	torpedo:rotate(-45)

local scoreValue = 0
local score = display.newText(scoreValue,
	display.contentCenterX+230, display.contentCenterY-100,"/fonts/Roboto-LightItalic.ttf")

local goodgame = false

local function kek()
	torpedo.y = -800
end

local function ryzen()
	if(endgame) then
		sprite:setLinearVelocity(0,0)
	else
	sprite:applyLinearImpulse(77.5,0,sprite.x, sprite.y)
	ti = 200
	
	end
end

local function reset()
	scoreValue = 0
	sprite.x = 0
	torpedo.y = -950
	endgame = false
	goodgame = false
end 

local meters = display.newText(0,
	display.contentCenterX-150, display.contentCenterY-100,"/fonts/Roboto-LightItalic.ttf")

local function pause()
	if(endgame) then
	 endgame = false
	else
		sprite:setLinearVelocity(0,0)
		physics.setGravity(0,9)
		endgame = true
	end
end

local function left()
	if((torpedo.x <= sprite.x+65) and (torpedo.x >= sprite.x-65) and (torpedo.y >= 175) and torpedo.y <= 225) then
		endgame = true
		goodgame = true
	end

	meters.text = torpedo.y

print(torpedo.y)
	if(endgame == false) then
		physics.setGravity(-10.35,9)
		background.x = background.x - 30
		if(background.x< -300) then
			background.x = 800
		end
		background2.x = background2.x - 30
		if(background2.x< -300) then
			background2.x= 800
		end
		torpedo.y = torpedo.y + 15

		if(torpedo.y > 450) then
			scoreValue = scoreValue + 1
			score.text = scoreValue
			torpedo.x = sprite.x
			torpedo.y = math.random(-400,-100)
		end
	end
	if(goodgame) then
		local button = display.newRect(225,50,50,30)
		button:setFillColor(1,1,0.5)
		button:addEventListener("tap", reset)
		physics.setGravity(0,9)
		sprite:setLinearVelocity(0,0)
	end
end

timer.performWithDelay(1, left, -1)
Runtime:addEventListener("touch", ryzen)
torpedo:addEventListener("collision" , kek )
preRec:addEventListener("tap", afterclick)
score:addEventListener("tap", pause)