bullet_wait = 0
bullet_delay = .3

b1restart = 10
b2restart = 25
b3restart = 40

function load_bullet()
	objects.bullets = {}
	objects.bullets.one = {}
	objects.bullets.two = {}
	objects.bullets.three = {}
	
	bullet_sprite = love.graphics.newImage("spear.png")
	bullet_sprite:setFilter("nearest", "nearest")
	
	objects.bullets.one.sprite = bullet_sprite
	objects.bullets.two.sprite = bullet_sprite
	objects.bullets.three.sprite = bullet_sprite
	
	objects.bullets.one.alive = false
	objects.bullets.two.alive = false
	objects.bullets.three.alive = false
	
	objects.bullets.one.body = love.physics.newBody(world, b1restart, b1restart, 0, 0)
	objects.bullets.one.shape = love.physics.newRectangleShape(objects.bullets.one.body, 8, 5, 16, 10, 0)
	objects.bullets.two.body = love.physics.newBody(world, b2restart, b2restart, 0, 0)
	objects.bullets.two.shape = love.physics.newRectangleShape(objects.bullets.two.body, 8, 5, 16, 10, 0)
	objects.bullets.three.body = love.physics.newBody(world, b3restart, b3restart, 0, 0)
	objects.bullets.three.shape = love.physics.newRectangleShape(objects.bullets.three.body, 8, 5, 16, 10, 0)
	
	objects.bullets.one.shape:setFilterData(1,0,0)
	objects.bullets.two.shape:setFilterData(1,0,0)
	objects.bullets.three.shape:setFilterData(1,0,0)
	
	objects.bullets.one.shape:setMask(1)
	objects.bullets.two.shape:setMask(1)
	objects.bullets.three.shape:setMask(1)
	
	objects.bullets.one.shape:setData("bullet1")
	objects.bullets.two.shape:setData("bullet2")
	objects.bullets.three.shape:setData("bullet3")
end

function new_bullet(x, y, dir)
	if bullet_wait < 0 then
		if objects.bullets.one.alive ~= true then
			objects.bullets.one.alive = true
			objects.bullets.one.body:setX(x)
			objects.bullets.one.body:setY(y)
			objects.bullets.one.direction = dir
			bullet_wait = bullet_delay
		elseif objects.bullets.two.alive ~= true then
			objects.bullets.two.alive = true
			objects.bullets.two.body:setX(x)
			objects.bullets.two.body:setY(y)
			objects.bullets.two.direction = dir
			bullet_wait = bullet_delay
		elseif objects.bullets.three.alive ~= true then
			objects.bullets.three.alive = true
			objects.bullets.three.body:setX(x)
			objects.bullets.three.body:setY(y)
			objects.bullets.three.direction = dir
			bullet_wait = bullet_delay
		end
	end
end

function update_bullet(dt)
	bullet_wait = bullet_wait - dt

	local speed = 300
	if objects.bullets.one.alive then
		if objects.bullets.one.body:getX() > 610 or objects.bullets.one.body:getX() < -10 then
				objects.bullets.one.alive = false
				objects.bullets.one.body:setX(b1restart)
				objects.bullets.one.body:setY(b1restart)
		elseif objects.bullets.one.direction == "right" then 
			objects.bullets.one.body:setX(objects.bullets.one.body:getX() + (dt * speed))
		elseif objects.bullets.one.direction == "left" then
			objects.bullets.one.body:setX(objects.bullets.one.body:getX() - (dt * speed))
		end
	end
	if objects.bullets.two.alive then
		if objects.bullets.two.body:getX() > 610 or objects.bullets.two.body:getX() < -10 then
				objects.bullets.two.alive = false
				objects.bullets.two.body:setX(b2restart)
				objects.bullets.two.body:setY(b2restart)
		elseif objects.bullets.two.direction == "right" then 
			objects.bullets.two.body:setX(objects.bullets.two.body:getX() + (dt * speed))
		elseif objects.bullets.two.direction == "left" then
			objects.bullets.two.body:setX(objects.bullets.two.body:getX() - (dt * speed))
		end
	end
	if objects.bullets.three.alive then
		if objects.bullets.three.body:getX() > 610 or objects.bullets.three.body:getX() < -10 then
				objects.bullets.three.alive = false
				objects.bullets.three.body:setX(b3restart)
				objects.bullets.three.body:setY(b3restart)
		elseif objects.bullets.three.direction == "right" then 
			objects.bullets.three.body:setX(objects.bullets.three.body:getX() + (dt * speed))
		elseif objects.bullets.three.direction == "left" then
			objects.bullets.three.body:setX(objects.bullets.three.body:getX() - (dt * speed))
		end
	end
end

function draw_bullets()

	--love.graphics.polygon("fill", objects.bullets.one.shape:getPoints())
	--love.graphics.polygon("fill", objects.bullets.two.shape:getPoints())
	--love.graphics.polygon("fill", objects.bullets.three.shape:getPoints())

	if objects.bullets.one.alive then
		if objects.bullets.one.direction == "right" then 
			love.graphics.draw(objects.bullets.one.sprite, objects.bullets.one.body:getX(), objects.bullets.one.body:getY(),0,2,2)
		elseif objects.bullets.one.direction == "left" then
			love.graphics.draw(objects.bullets.one.sprite, objects.bullets.one.body:getX(), objects.bullets.one.body:getY(),0,-2,2,8)
		end
	end
	if objects.bullets.two.alive then
		if objects.bullets.two.direction == "right" then 
			love.graphics.draw(objects.bullets.two.sprite, objects.bullets.two.body:getX(), objects.bullets.two.body:getY(),0,2,2)
		elseif objects.bullets.two.direction == "left" then
			love.graphics.draw(objects.bullets.two.sprite, objects.bullets.two.body:getX(), objects.bullets.two.body:getY(),0,-2,2,8)
		end
	end
	if objects.bullets.three.alive then
		if objects.bullets.three.direction == "right" then 
			love.graphics.draw(objects.bullets.three.sprite, objects.bullets.three.body:getX(), objects.bullets.three.body:getY(),0,2,2)
		elseif objects.bullets.three.direction == "left" then
			love.graphics.draw(objects.bullets.three.sprite, objects.bullets.three.body:getX(), objects.bullets.three.body:getY(),0,-2,2,8)
		end
	end
end