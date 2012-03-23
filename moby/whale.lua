function load_whale()
	objects.whale = {}
	objects.whale.sprites = {}
	objects.whale.x = 500
	objects.whale.y = 200
	objects.whale.direction = "left"
	objects.whale.moving = 0
	
	objects.whale.body = love.physics.newBody(world, objects.whale.x, objects.whale.y, 10,0)
	objects.whale.shape = love.physics.newRectangleShape(objects.whale.body, 50, 17, 100, 34, 0)
	objects.whale.shape:setData("whale")
	
	objects.diver.shape:setFilterData(2,1,0)
	
	objects.whale.sprites.one = love.graphics.newImage("img/moby_move_1.png")
	objects.whale.sprites.two = love.graphics.newImage("img/moby_move_2.png")
	objects.whale.sprites.three = love.graphics.newImage("img/moby_move_3.png")
	objects.whale.sprites.four = love.graphics.newImage("img/moby_move_4.png")
	objects.whale.sprites.one:setFilter("nearest","nearest")
	objects.whale.sprites.two:setFilter("nearest","nearest")
	objects.whale.sprites.three:setFilter("nearest","nearest")
	objects.whale.sprites.four:setFilter("nearest","nearest")
end

function update_whale(dt)
	local force
	if objects.whale.direction == "left" then force = -100 else force = 100 end
	objects.whale.body:setLinearVelocity(force, 0)
	objects.whale.moving = objects.whale.moving + 1
end

local first = 10
local second = 20
local third = 30
local forth = 40
function draw_whale()
	--love.graphics.polygon("fill", objects.whale.shape:getPoints())

	if objects.whale.direction == "left" then
		if objects.whale.moving < first then 
			love.graphics.draw(objects.whale.sprites.one, objects.whale.body:getX(), objects.whale.body:getY(),0,-2,2,50)
		elseif objects.whale.moving >= first and objects.whale.moving < second then
			love.graphics.draw(objects.whale.sprites.two, objects.whale.body:getX(), objects.whale.body:getY(),0,-2,2,50)
		elseif objects.whale.moving >= second and objects.whale.moving < third then
			love.graphics.draw(objects.whale.sprites.three, objects.whale.body:getX(), objects.whale.body:getY(),0,-2,2,50) 
		elseif objects.whale.moving >= third and objects.whale.moving < forth then
			love.graphics.draw(objects.whale.sprites.four, objects.whale.body:getX(), objects.whale.body:getY(),0,-2,2,50) 
		else
			love.graphics.draw(objects.whale.sprites.one, objects.whale.body:getX(), objects.whale.body:getY(),0,-2,2,50)
			objects.whale.moving = 1
		end
	elseif objects.whale.direction == "right" then
		if objects.whale.moving < first then
			love.graphics.draw(objects.whale.sprites.one, objects.whale.body:getX(), objects.whale.body:getY(),0,2,2)
		elseif objects.whale.moving >= first and objects.whale.moving < second then
			love.graphics.draw(objects.whale.sprites.two, objects.whale.body:getX(), objects.whale.body:getY(),0,2,2) 
		else
			love.graphics.draw(objects.whale.sprites.one, objects.whale.body:getX(), objects.whale.body:getY(),0,2,2)
			objects.whale.moving = 1
		end
	end
end