require("diver.lua")
require("bullet.lua")

function load_diving()
	load_diver()
	load_bullet()
end

function keypressed_diving(key)
end

function update_diving(dt)
	if love.keyboard.isDown(" ") then new_bullet(diver.x, diver.y, diver.direction) end
	
	local accum = dt
	while accum > 0 do     
		local dt = math.min( 1/50, accum )
		accum = accum - dt
	end
	update_diver(dt)
	update_bullet(dt)
end

function draw_diving()
	draw_diver()
	draw_bullets()
end