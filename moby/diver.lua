function load_diver()
	objects.diver = {}
	objects.diver.sprites = {}
	objects.diver.x = 100
	objects.diver.y = 200
	objects.diver.direction = "right"
	objects.diver.moving = 0
	
	objects.diver.body = love.physics.newBody(world, objects.diver.x, objects.diver.y, 0,0)
	objects.diver.shape = love.physics.newRectangleShape(objects.diver.body, 18, 15, 36, 30, 0)
	objects.diver.shape:setData("diver")
	objects.diver.shape:setFilterData(1,0,0)
	objects.diver.shape:setMask(1)
	
	objects.diver.sprites.one = love.graphics.newImage("man_swim_1.png")
	objects.diver.sprites.two = love.graphics.newImage("man_swim_2.png")
	objects.diver.sprites.one:setFilter("nearest","nearest")
	objects.diver.sprites.two:setFilter("nearest","nearest")
end

function update_diver(dt)
	local speed = 100
	if love.keyboard.isDown("right") then
		objects.diver.direction = "right"
		objects.diver.body:setX(objects.diver.body:getX() + (dt * speed))
	elseif love.keyboard.isDown("left") then
		objects.diver.direction = "left"
		objects.diver.body:setX(objects.diver.body:getX() - (dt * speed))
	elseif love.keyboard.isDown("up") then
		objects.diver.body:setY(objects.diver.body:getY() - (dt * speed))
	elseif love.keyboard.isDown("down") then
		objects.diver.body:setY(objects.diver.body:getY() + (dt * speed))
	end
	objects.diver.moving = objects.diver.moving + 1
end

local first = 10
local second = 20
function draw_diver()
	--love.graphics.polygon("fill", objects.diver.shape:getPoints())

	if objects.diver.direction == "left" then
		if objects.diver.moving < first then 
			love.graphics.draw(objects.diver.sprites.one, objects.diver.body:getX(), objects.diver.body:getY(),0,-2,2,18)
		elseif objects.diver.moving >= first and objects.diver.moving < second then
			love.graphics.draw(objects.diver.sprites.two, objects.diver.body:getX(), objects.diver.body:getY(),0,-2,2,18) 
		else
			love.graphics.draw(objects.diver.sprites.one, objects.diver.body:getX(), objects.diver.body:getY(),0,-2,2,18)
			objects.diver.moving = 1
		end
	elseif objects.diver.direction == "right" then
		if objects.diver.moving < first then
			love.graphics.draw(objects.diver.sprites.one, objects.diver.body:getX(), objects.diver.body:getY(),0,2,2)
		elseif objects.diver.moving >= first and objects.diver.moving < second then
			love.graphics.draw(objects.diver.sprites.two, objects.diver.body:getX(), objects.diver.body:getY(),0,2,2) 
		else
			love.graphics.draw(objects.diver.sprites.one, objects.diver.body:getX(), objects.diver.body:getY(),0,2,2)
			objects.diver.moving = 1
		end
	end
end