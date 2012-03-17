bullet_wait = 0
bullet_delay = .3

function load_bullet()
	bullets = {}
	bullets.one = {}
	bullets.two = {}
	bullets.three = {}
	
	bullet_sprite = love.graphics.newImage("spear.png")
	bullet_sprite:setFilter("nearest", "nearest")
	
	bullets.one.sprite = bullet_sprite
	bullets.two.sprite = bullet_sprite
	bullets.three.sprite = bullet_sprite
	
	bullets.one.alive = false
	bullets.two.alive = false
	bullets.three.alive = false
end

function new_bullet(x, y, dir)
	if bullet_wait < 0 then
		if bullets.one.alive ~= true then
			bullets.one.alive = true
			bullets.one.x = x
			bullets.one.y = y
			bullets.one.direction = dir
			bullet_wait = bullet_delay
		elseif bullets.two.alive ~= true then
			bullets.two.alive = true
			bullets.two.x = x
			bullets.two.y = y
			bullets.two.direction = dir
			bullet_wait = bullet_delay
		elseif bullets.three.alive ~= true then
			bullets.three.alive = true
			bullets.three.x = x
			bullets.three.y = y
			bullets.three.direction = dir
			bullet_wait = bullet_delay
		end
	end
end

function update_bullet(dt)
	bullet_wait = bullet_wait - dt

	local speed = 300
	if bullets.one.alive then
		if bullets.one.direction == "right" then 
			bullets.one.x = bullets.one.x + (dt * speed)
		elseif bullets.one.direction == "left" then
			bullets.one.x = bullets.one.x - (dt * speed)
		end
	end
	if bullets.two.alive then
		if bullets.two.direction == "right" then 
			bullets.two.x = bullets.two.x + (dt * speed)
		elseif bullets.two.direction == "left" then
			bullets.two.x = bullets.two.x - (dt * speed)
		end
	end
	if bullets.three.alive then
		if bullets.three.direction == "right" then 
			bullets.three.x = bullets.three.x + (dt * speed)
		elseif bullets.three.direction == "left" then
			bullets.three.x = bullets.three.x - (dt * speed)
		end
	end
end

function draw_bullets()
	if bullets.one.alive then
		if bullets.one.direction == "right" then 
			love.graphics.draw(bullets.one.sprite, bullets.one.x, bullets.one.y,0,2,2)
		elseif bullets.one.direction == "left" then
			love.graphics.draw(bullets.one.sprite, bullets.one.x, bullets.one.y,0,-2,2,8)
		end
	end
	if bullets.two.alive then
		if bullets.two.direction == "right" then 
			love.graphics.draw(bullets.two.sprite, bullets.two.x, bullets.two.y,0,2,2)
		elseif bullets.two.direction == "left" then
			love.graphics.draw(bullets.two.sprite, bullets.two.x, bullets.two.y,0,-2,2,8)
		end
	end
	if bullets.three.alive then
		if bullets.three.direction == "right" then 
			love.graphics.draw(bullets.three.sprite, bullets.three.x, bullets.three.y,0,2,2)
		elseif bullets.three.direction == "left" then
			love.graphics.draw(bullets.three.sprite, bullets.three.x, bullets.three.y,0,-2,2,8)
		end
	end
end