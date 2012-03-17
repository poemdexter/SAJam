function getNewPlayers()

	objects.players = {one = {}, two = {}}
	
	objects.players.one.body = love.physics.newBody(world, math.random(100,250), 400, 0, 0)
	objects.players.one.shape = love.physics.newRectangleShape(objects.players.one.body, 0, -8, 16, 16, 0)
	objects.players.one.shape:setData("p1")
	objects.players.one.sprite = love.graphics.newImage("leftarcher.png")
	objects.players.one.sprite:setFilter("nearest","nearest")
	
	objects.players.two.body = love.physics.newBody(world, math.random(550,700), 400, 0, 0)
	objects.players.two.shape = love.physics.newRectangleShape(objects.players.one.body, 0, -8, 16, 16, 0)
	objects.players.two.shape:setData("p2")
	objects.players.two.sprite = love.graphics.newImage("rightarcher.png")
	objects.players.two.sprite:setFilter("nearest","nearest")
end

function drawPlayers()
	love.graphics.polygon("fill", objects.players.one.shape:getPoints())
	love.graphics.polygon("fill", objects.players.two.shape:getPoints())
	love.graphics.draw(objects.players.one.sprite,objects.players.one.body:getX(),objects.players.one.body:getY(),0,2,2,4,8)
	love.graphics.draw(objects.players.two.sprite,objects.players.two.body:getX(),objects.players.two.body:getY(),0,2,2,4,8)
end
	