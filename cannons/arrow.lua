prevX = 0
prevY = 0

function getNewArrow(dir)
	objects.arrow = {}
	if dir == 1 then
		objects.arrow.body = love.physics.newBody(world, objects.players.one.body:getX(), 375, 15, 0)
	elseif dir == 2 then
		objects.arrow.body = love.physics.newBody(world, objects.players.two.body:getX(), 375, 15, 0)
	end
	objects.arrow.shape = love.physics.newRectangleShape(objects.arrow.body, 0, 0, 14, 6, 0)
	objects.arrow.sprite = love.graphics.newImage("arrow.png")
	objects.arrow.sprite:setFilter("nearest","nearest")
	objects.arrow.shape:setData("arrow")
	prevX = objects.arrow.body:getX()
	prevY = objects.arrow.body:getY()
end

function drawArrow()
	updateArrowGraphic()
	updatePreviousCoords()
	love.graphics.polygon("fill", objects.arrow.shape:getPoints())
	love.graphics.draw(objects.arrow.sprite,objects.arrow.body:getX(),objects.arrow.body:getY(),objects.arrow.body:getAngle(),2,2,3,.75)
end

function updateArrowGraphic()
	objects.arrow.body:setAngle(math.atan2(prevY - objects.arrow.body:getY(), prevX - objects.arrow.body:getX()))
end

function updatePreviousCoords()
	prevX = objects.arrow.body:getX()
	prevY = objects.arrow.body:getY()
end

function checkArrowInBounds()
	
end