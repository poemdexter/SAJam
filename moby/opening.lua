function load_opening()
	introsprite = love.graphics.newImage("img/intro.png")
	introsprite:setFilter("nearest","nearest")
end

function draw_opening()
	love.graphics.draw(introsprite, 0,0,0,2,2)
end

function key_opening(key)
	if key == "return" then gamestate = "boat" end
end