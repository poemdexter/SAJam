require("diver.lua")
require("bullet.lua")

function load_diving()
	dive_bg = love.graphics.newImage("dive_bg.png")
	load_diver()
	load_bullet()
end

function keypressed_diving(key)
end

function update_diving(dt)
	if love.keyboard.isDown(" ") then new_bullet(objects.diver.body:getX(), objects.diver.body:getY() + 9, objects.diver.direction) end
	
	local accum = dt
	while accum > 0 do     
		local dt = math.min( 1/50, accum )
		accum = accum - dt
	end
	update_diver(dt)
	update_bullet(dt)
end

function draw_diving()
	love.graphics.draw(dive_bg, 0, 0) 
	draw_diver()
	draw_bullets()
end