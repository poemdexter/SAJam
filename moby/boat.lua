function load_boat()
	boat = {}
	boat.sprites = {}
	boat.x = 100
	boat.y = 200
	boat.moving = 0
	boat.direction = "right"
	
	load_boat_sprites()
end

function draw_boat()
	if boat.moving == 0 then
		if boat.direction == "right" then
			love.graphics.draw(boat.sprites.right_still, boat.x, boat.y,0,2,2)
		elseif boat.direction == "left" then
			love.graphics.draw(boat.sprites.right_still, boat.x, boat.y,0,-2,2,26)
		elseif boat.direction == "up" then
			love.graphics.draw(boat.sprites.up_still, boat.x, boat.y,0,2,2)
		elseif boat.direction == "down" then
			love.graphics.draw(boat.sprites.down_still, boat.x, boat.y,0,2,2)
		end
	else
		draw_animated_sprite()
	end
end

function update_boat()
	if love.keyboard.isDown("right") then
		boat.direction = "right"
		boat.x = boat.x + 1
		boat.moving = boat.moving + 1
	elseif love.keyboard.isDown("left") then
		boat.direction = "left"
		boat.x = boat.x - 1
		boat.moving = boat.moving + 1
	elseif love.keyboard.isDown("up") then
		boat.direction = "up"
		boat.y = boat.y - 1
		boat.moving = boat.moving + 1
	elseif love.keyboard.isDown("down") then
		boat.direction = "down"
		boat.y = boat.y + 1
		boat.moving = boat.moving + 1
	else
		boat.moving = 0
	end
end

function keypressed_boat(key)
	
end

local first = 10
local second = 20
local third = 30
local forth = 40
local fifth = 50
function draw_animated_sprite()
	if boat.direction == "right" then
		if boat.moving < first then
			love.graphics.draw(boat.sprites.right_move_1, boat.x, boat.y,0,2,2)
		elseif boat.moving >= first and boat.moving < second then
			love.graphics.draw(boat.sprites.right_move_2, boat.x, boat.y,0,2,2)
		elseif boat.moving >= second and boat.moving < third then
			love.graphics.draw(boat.sprites.right_move_3, boat.x, boat.y,0,2,2)
		elseif boat.moving >= third and boat.moving < forth then
			love.graphics.draw(boat.sprites.right_move_4, boat.x, boat.y,0,2,2)
		elseif boat.moving >= forth and boat.moving < fifth then
			love.graphics.draw(boat.sprites.right_move_5, boat.x, boat.y,0,2,2)
		else
			love.graphics.draw(boat.sprites.right_move_1, boat.x, boat.y,0,2,2)
			boat.moving = 1
		end
	elseif boat.direction == "left" then
		if boat.moving < first then
			love.graphics.draw(boat.sprites.right_move_1, boat.x, boat.y,0,-2,2,26)
		elseif boat.moving >= first and boat.moving < second then
			love.graphics.draw(boat.sprites.right_move_2, boat.x, boat.y,0,-2,2,26)
		elseif boat.moving >= second and boat.moving < third then
			love.graphics.draw(boat.sprites.right_move_3, boat.x, boat.y,0,-2,2,26)
		elseif boat.moving >= third and boat.moving < forth then
			love.graphics.draw(boat.sprites.right_move_4, boat.x, boat.y,0,-2,2,26)
		elseif boat.moving >= forth and boat.moving < fifth then
			love.graphics.draw(boat.sprites.right_move_5, boat.x, boat.y,0,-2,2,26)
		else
			love.graphics.draw(boat.sprites.right_move_1, boat.x, boat.y,0,-2,2,26)
			boat.moving = 1
		end
	elseif boat.direction == "up" then
		if boat.moving < first then
			love.graphics.draw(boat.sprites.up_move_1, boat.x, boat.y,0,2,2)
		elseif boat.moving >= first and boat.moving < second then
			love.graphics.draw(boat.sprites.up_move_2, boat.x, boat.y,0,2,2)
		else
			love.graphics.draw(boat.sprites.up_move_1, boat.x, boat.y,0,2,2)
			boat.moving = 1
		end
	elseif boat.direction == "down" then
		if boat.moving < first then
			love.graphics.draw(boat.sprites.down_move_1, boat.x, boat.y,0,2,2)
		elseif boat.moving >= first and boat.moving < second then
			love.graphics.draw(boat.sprites.down_move_2, boat.x, boat.y,0,2,2)
		else
			love.graphics.draw(boat.sprites.down_move_1, boat.x, boat.y,0,2,2)
			boat.moving = 1
		end
	end
end

function load_boat_sprites()
	boat.sprites.up_still = love.graphics.newImage("boat_up_still.png")
	boat.sprites.up_move_1 = love.graphics.newImage("boat_up_move_1.png")
	boat.sprites.up_move_2 = love.graphics.newImage("boat_up_move_2.png")
	
	boat.sprites.down_still = love.graphics.newImage("boat_down_still.png")
	boat.sprites.down_move_1 = love.graphics.newImage("boat_down_move_1.png")
	boat.sprites.down_move_2 = love.graphics.newImage("boat_down_move_2.png")
	
	boat.sprites.right_still = love.graphics.newImage("boat_right_still.png")
	boat.sprites.right_move_1 = love.graphics.newImage("boat_right_move_1.png")
	boat.sprites.right_move_2 = love.graphics.newImage("boat_right_move_2.png")
	boat.sprites.right_move_3 = love.graphics.newImage("boat_right_move_3.png")
	boat.sprites.right_move_4 = love.graphics.newImage("boat_right_move_4.png")
	boat.sprites.right_move_5 = love.graphics.newImage("boat_right_move_5.png")
	
	boat.sprites.up_still:setFilter("nearest","nearest")
	boat.sprites.up_move_1:setFilter("nearest","nearest")
	boat.sprites.up_move_2:setFilter("nearest","nearest")
	
	boat.sprites.down_still:setFilter("nearest","nearest")
	boat.sprites.down_move_1:setFilter("nearest","nearest")
	boat.sprites.down_move_2:setFilter("nearest","nearest")
	
	boat.sprites.right_still:setFilter("nearest","nearest")
	boat.sprites.right_move_1:setFilter("nearest","nearest")
	boat.sprites.right_move_2:setFilter("nearest","nearest")
	boat.sprites.right_move_3:setFilter("nearest","nearest")
	boat.sprites.right_move_4:setFilter("nearest","nearest")
	boat.sprites.right_move_5:setFilter("nearest","nearest")
end