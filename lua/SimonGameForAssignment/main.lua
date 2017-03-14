--
-- Project: Simon Test
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2011 J. A. Whye. All Rights Reserved.

-- Use the following code for whatever you like. 
-- However, the graphic assets in this sample project
-- should NOT be used for anything other than this sample code.

--crawlspaceLib = require("crawlspaceLib")

--Anywhere you see "--" I took a comment out.  
--Look at the code, figure out what it does, and write your own comments when you see "--""

centerX, centerY = display.contentCenterX, display.contentCenterY
screenX, screenY = display.screenOriginX, display.screenOriginY
screenWidth, screenHeight = display.contentWidth - screenX * 2, display.contentHeight - screenY * 2
display.setStatusBar ( display.HiddenStatusBar )
math.randomseed( os.time() )

local colorBalls = {"Blue", "Green", "Red", "Yellow"}
local newSeq = {}
local mainBalls = {}
local numBalls = 1	-- how many in the sequence?
local sequenceIdx = 1

local BOOP_PAUSE = 1000
local GAME_STATE = "waiting"

local LoserSound = audio.loadSound("audio/Loser.aiff")
local WinnerSound = audio.loadSound("audio/Winner.aiff")

local resetGame -- initalize resetGame, doesnt really do anything

--shows the reset text "start game", fades obj in reset touched 

local function showReset(obj)
	local function resetTouched(e)
		if e.phase == "ended" then
			if obj ~= nil then
				transition.fadeOut(obj, {time=500, onComplete=function() display.remove(obj) end })
			end
			e.target:removeEventListener ( "touch", resetTouched )
			e.target:removeSelf()
			resetGame()
		end
	end
	local resetText = display.newText( "Start Game", 0, 0, "Helvetica", 42 )
	resetText.x = centerX
	resetText.y = centerY + 100
	resetText:addEventListener ( "touch", resetTouched )
end

-- expands the obj (ball) when called or shrinks it 
local function popBall(b)
	local function unPop(b)
		transition.to ( b, { time=100/(numBalls*0.5), xScale = 1, yScale = 1, alpha = .9 } )
	end
	transition.to ( b, { time=100/(numBalls*0.5), xScale = 1.2, yScale = 1.2, alpha = 1, onComplete=unPop} )
	audio.play ( b.sound )
end

-- goes through the newSeq array within a mainBalls array to show a sequence of balls
-- moves index along , +1, sets the "game mode" as "playing", uses popBall to show
local function playSequence()
	popBall(mainBalls[newSeq[sequenceIdx]])
	if sequenceIdx < #newSeq then
		timer.performWithDelay( BOOP_PAUSE/(numBalls*0.8), playSequence )
	else
		GAME_STATE = "playing"
		sequenceIdx = 0 --sets index to 0
		local yourTurn = display.newText( "Your Turn...", centerX, centerY, "Helvetica", 36 )
		transition.fadeIn(yourTurn, {time=2000, onComplete=function() transition.fadeOut(yourTurn, {time=2000}) end })
	end
	sequenceIdx = sequenceIdx + 1
end

-- creates a random array "sequence"
local function createSequence(numColors)
	local sequence = {}
	for i = 1, numColors do
		sequence[#sequence+1] = colorBalls[math.random(1, #colorBalls)]
	end
	return sequence
end

-- resets the game by setting index to 1,creating a new set of patterns
function resetGame()
	sequenceIdx = 1
	newSeq = createSequence(numBalls)
	timer.performWithDelay( 200, playSequence )
end

-- pops a ball when it is clicked, checks for correct sequence and decides if it is correct and if the player has won or not

local function ballTouched(e)
	if e.phase == "ended" then
		
		-- checks if the game is playing, returning nil if so
		if GAME_STATE ~= "playing" then
			return
		end

		popBall(e.target)
		
		-- checks if the sequence chosen is the "target.color", provides feedback if correct/wrong, moves index along
		if newSeq[sequenceIdx] == e.target.color then
			local star = display.newImage("images/Star.png")
			star.x = e.target.x
			star.y = e.target.y - e.target.height
			transition.fadeOut(star, {time=1000, onComplete=function() display.remove(star) end })
			sequenceIdx = sequenceIdx + 1
			-- if the sequence has been completed w/o error
			if sequenceIdx > #newSeq then
				GAME_STATE = "won"
				audio.play ( WinnerSound )
				local youWon = display.newText( "You Won!", centerX, centerY, "Helvetica", 36 )
				showReset(youWon)
				numBalls = numBalls + 1
			end
		else
			local ex = display.newImage("images/X.png")
			ex.x = e.target.x
			ex.y = e.target.y - e.target.height
			transition.fadeOut(ex, {time=4000, onComplete=function() display.remove(obj) end })
			GAME_STATE = "lost"
			audio.play ( LoserSound )
			local youLost = display.newText( "You Lost! :(", centerX, centerY, "Helvetica", 36 )
			showReset(youLost)
			
		end
		
	end
end

-- sets the balls up with init values, such as color and position
local function setUpBalls()
	for i=1, 4 do
		local idx = colorBalls[i]
		mainBalls[idx] = display.newImage("images/" .. colorBalls[i] .. ".png" )
		mainBalls[idx].x = 160
		mainBalls[idx].y = 70* i + 5
		mainBalls[idx].alpha = .9
		mainBalls[idx].color = colorBalls[i]
		mainBalls[idx].sound = audio.loadSound("audio/" .. colorBalls[i] .. ".aiff")
		mainBalls[idx]:addEventListener ( "touch", ballTouched )
	end
end

-- supposedly shows the sequence of the game
local function displaySequence()
	for i=1, #newSeq do
		print (newSeq[i])
		local text = display.newText( newSeq[i], 30, 150 + (20 * i), "Helvetica", 18 )
	end
end

-- uncomment to cheat!
displaySequence()

setUpBalls()

showReset(nil)
