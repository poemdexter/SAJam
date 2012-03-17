require("arrow.lua")
require("player.lua")
require("turn.lua")
require("tree.lua")

function love.load()
	math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,6)))
	
	world = love.physics.newWorld(0,0,800,600)
	setNewWind()
	world:setMeter(32)
	world:setCallbacks(add, persist, rem, result)
	
	objects = {}
	objects.ground = {}
	-- x, y, mass, rot inertia
	objects.ground.body = love.physics.newBody(world, 800/2, 600 - 100, 0, 0) 
	-- xoffset, yoffset, width, height, angle
	objects.ground.shape = love.physics.newRectangleShape(objects.ground.body, 0, 0, 800, 200, 0)
	objects.ground.shape:setData("ground")
	
	love.keyboard.setKeyRepeat(10,100)
	love.graphics.setCaption("cannons i think")
	love.graphics.setFont("OCRAExt.TTF", 15)
	love.graphics.setBackgroundColor(135, 206, 250)
	
	getNewPlayers()
	getTrunk()
	getTree()
	
	dscore = 0
	hscore = 0

	pangle = 45
	ppower = 50
	
	text = ""
	firing = false
	cleaning = false
end

function setNewWind()
	wpower = math.random(1,50)
	wdirection = math.random(1,2)
	world:setGravity(getWindPower(),100)
end

function getWindPower()
	if wdirection == 1 then
		return -wpower
	elseif wdirection == 2 then
		return wpower
	end
end

function getWindDirectionText()
	if wdirection == 1 then
		return "<--"
	elseif wdirection == 2 then
		return "-->"
	end
end

function love.keypressed(key)
	if not firing then
	
	if key == "up" then
		if ppower + 1 > 100 then ppower = 100
		else ppower = ppower + 1
		end
	elseif key == "down" then 
		if ppower - 1 < 0 then ppower = 0
		else ppower = ppower - 1
		end
	elseif key == "left" then
		if pangle - 1 < 0 then pangle = 0
		else pangle = pangle - 1
		end
	elseif key == "right" then
		if pangle + 1 > 90 then pangle = 90
		else pangle = pangle + 1
		end
	elseif key == " " then 
		fire()
	end
	
	end
end

function fire()
	firing = true
	getNewArrow(getTurn())
	if getTurn() == 1 then 
		objects.arrow.body:applyForce(ppower * 120 * math.cos(math.rad(pangle)), -ppower * 120 * math.sin(math.rad(pangle)))
	elseif getTurn() == 2 then
		objects.arrow.body:applyForce(-ppower * 120 * math.cos(math.rad(pangle)), -ppower * 120 * math.sin(math.rad(pangle)))
	end
end

function love.update(dt)
	world:update(dt)
	
	checkArrowInBounds()
	
	if cleaning then
		objects.arrow.body:destroy()
		objects.arrow.shape:destroy()
		objects.arrow = nil
		cleaning = false
	end
end

function add(a, b, coll)
    --text = text..a.." colliding with "..b.." on turn "..getTurn().."\n"

	if (a == "p1" and getTurn() == 2) then
		hscore = hscore + 1
		setNewTree()
		setNewWind()
	elseif (a == "p2" and getTurn() == 1) then
		dscore = dscore + 1
		setNewTree()
		setNewWind()
	end
	
	changeTurn()
	firing = false
	cleaning = true
	
end

function love.draw()
	
	-- GROUND
	love.graphics.setColor(72,160,14)
	love.graphics.polygon("fill", objects.ground.shape:getPoints())
	
	love.graphics.setColor(255,255,255)
	
	-- TREE
	drawTree()
	
	-- PLAYERS
	drawPlayers()
	
	-- ARROW
	if objects.arrow ~= nil then
		drawArrow()
	end
	
	-- GUI
	love.graphics.print("- SCORE -",0,0)
	love.graphics.print("Daniel: "..dscore.." "..dturn,0,15)
	love.graphics.print("Hannah: "..hscore.." "..hturn,0,30)
	
	love.graphics.print("- AIMING -",300,0)
	love.graphics.print("Angle: "..pangle,300,15)
	love.graphics.print("Power: "..ppower,300,30)
	
	love.graphics.print("- WIND -",600,0)
	love.graphics.print("Strength: "..wpower/10,600,15)
	love.graphics.print("Direction: "..getWindDirectionText(),600,30)
	
	-- DEBUG
	love.graphics.print(text, 100, 100)
end