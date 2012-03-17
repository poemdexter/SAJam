require("opening.lua")
require("boat.lua")
require("diving.lua")

function love.load()
	math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,6)))
	love.graphics.setBackgroundColor(66, 64, 255)
	love.graphics.setCaption("DICK: THE VIDEO GAME")
	
	world = love.physics.newWorld(0,0,600,600)
	
	load_opening()
	load_boat()
	load_diving()
	
	gamestate = "opening"
	text = ""
end

function love.keypressed(key)
	if gamestate == "opening" then key_opening(key)
	elseif gamestate == "boat" then keypressed_boat(key)
	elseif gamestate == "diving" then keypressed_diving(key) 
	end
end

dive_event_delay = 1
dive_event_trigger = false
function love.update(dt)
	if gamestate == "boat" then
		if dive_event_trigger == false then
			dive_event_delay = dive_event_delay - dt
			if dive_event_delay < 0 then dive_event_trigger = true end
		else
			if math.ceil(math.random(1,1000)) > 995 then gamestate = "diving" end
		end
		update_boat(dt)
		
	elseif gamestate == "diving" then
		update_diving(dt)
	end
	
end

function love.draw()
	love.graphics.print(text, 100, 100)

	if gamestate == "opening" then draw_opening()
	elseif gamestate == "boat" then draw_boat()
	elseif gamestate == "diving" then draw_diving()
	end
end