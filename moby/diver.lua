function load_diver()
	diver = {}
	diver.sprites = {}
	diver.x = 100
	diver.y = 200
	diver.direction = "right"
	diver.moving = 0
	
	diver.sprites.one = love.graphics.newImage("man_swim_1.png")
	diver.sprites.two = love.graphics.newImage("man_swim_2.png")
	diver.sprites.one:setFilter("nearest","nearest")
	diver.sprites.two:setFilter("nearest","nearest")
end

function update_diver(dt)
	local speed = 100
	if love.keyboard.isDown("right") then
		diver.direction = "right"
		diver.x = diver.x + (dt * speed)
	elseif love.keyboard.isDown("left") then
		diver.direction = "left"
		diver.x = diver.x - (dt * speed)
	elseif love.keyboard.isDown("up") then
		diver.y = diver.y - (dt * speed)
	elseif love.keyboard.isDown("down") then
		diver.y = diver.y + (dt * speed)
	end
	diver.moving = diver.moving + 1
end

local first = 10
local second = 20
function draw_diver()
	if diver.direction == "left" then
		if diver.moving < first then 
			love.graphics.draw(diver.sprites.one, diver.x, diver.y,0,-2,2,18)
		elseif diver.moving >= first and diver.moving < second then
			love.graphics.draw(diver.sprites.two, diver.x, diver.y,0,-2,2,18) 
		else
			love.graphics.draw(diver.sprites.one, diver.x, diver.y,0,-2,2,18)
			diver.moving = 1
		end
	elseif diver.direction == "right" then
		if diver.moving < first then
			love.graphics.draw(diver.sprites.one, diver.x, diver.y,0,2,2)
		elseif diver.moving >= first and diver.moving < second then
			love.graphics.draw(diver.sprites.two, diver.x, diver.y,0,2,2) 
		else
			love.graphics.draw(diver.sprites.one, diver.x, diver.y,0,2,2)
			diver.moving = 1
		end
	end
end