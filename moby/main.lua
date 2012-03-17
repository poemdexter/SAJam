require("opening.lua")
require("boat.lua")

function love.load()
	love.graphics.setMode(600, 600, false, true, 0)
	love.graphics.setBackgroundColor(66, 64, 255)
	love.graphics.setCaption("DICK: THE VIDEO GAME")
	
	load_opening()
	load_boat()
	
	gamestate = "opening"
end

function love.keypressed(key)
	if gamestate == "opening" then
		key_opening(key)
	elseif gamestate == "boat" then
		keypressed_boat(key)
	end
end

function love.update(dt)
	if gamestate == "boat" then
		-- if random event then scuba else update
		update_boat(dt)
	end
end

function love.draw()
	if gamestate == "opening" then
		draw_opening()
	elseif gamestate == "boat" then
		draw_boat()
	end
end