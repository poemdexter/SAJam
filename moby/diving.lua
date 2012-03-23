require("diver.lua")
require("bullet.lua")
require("whale.lua")

function load_diving()
	dive_bg = love.graphics.newImage("img/dive_bg.png")
	spear_sfx = love.audio.newSource("sfx/speargun.wav","static")
	whale_hit_sfx = love.audio.newSource("sfx/spear_hits_whale.wav","static")
	diver_hit_sfx = love.audio.newSource("sfx/whale_hits_diver.wav","static")
	load_diver()
	load_bullet()
	load_whale()
end

function keypressed_diving(key)
end

function update_diving(dt)
	world:update(dt)
	if love.keyboard.isDown(" ") then 
		if objects.diver.direction == "left" then offset = -20 else offset = 20 end
		new_bullet(objects.diver.body:getX() + offset, objects.diver.body:getY() + 9, objects.diver.direction)
	end
	
	local accum = dt
	while accum > 0 do     
		local dt = math.min( 1/50, accum )
		accum = accum - dt
	end
	update_diver(dt)
	update_bullet(dt)
	update_whale(dt)
end

function draw_diving()
	love.graphics.draw(dive_bg, 0, 0) 
	draw_diver()
	draw_bullets()
	draw_whale()
end

function add(a, b, coll)
    if a == "bullet1" and b == "whale" then
		love.audio.stop(whale_hit_sfx)
		love.audio.play(whale_hit_sfx)
		objects.bullets.one.body:setLinearVelocity(0, 0)
		objects.bullets.one.alive = false
		objects.bullets.one.body:setX(b1restart)
		objects.bullets.one.body:setY(b1restart)
	end
	if a == "bullet2" and b == "whale" then
		love.audio.stop(whale_hit_sfx)
		love.audio.play(whale_hit_sfx)
		objects.bullets.two.body:setLinearVelocity(0, 0)
		objects.bullets.two.alive = false
		objects.bullets.two.body:setX(b2restart)
		objects.bullets.two.body:setY(b2restart)
	end
	if a == "bullet3" and b == "whale" then
		love.audio.stop(whale_hit_sfx)
		love.audio.play(whale_hit_sfx)
		objects.bullets.three.body:setLinearVelocity(0, 0)
		objects.bullets.three.alive = false
		objects.bullets.three.body:setX(b3restart)
		objects.bullets.three.body:setY(b3restart)
	end
	if a == "diver" and b == "whale" then
		love.audio.stop(diver_hit_sfx)
		love.audio.play(diver_hit_sfx)
	end
	
	text = text..a.." collding with "..b.." at an angle of "..coll:getNormal().."\n"
end