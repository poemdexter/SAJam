function getTree()
	objects.tree = {}
	objects.tree.body = love.physics.newBody(world, 400, math.random(286,340), 0, 0)
	objects.tree.shape = love.physics.newCircleShape(objects.tree.body, 0, 0, 50)
	objects.tree.sprite = love.graphics.newImage("tree.png")
	objects.tree.sprite:setFilter("nearest","nearest")
	objects.tree.shape:setData("tree")
end

function getTrunk()
	objects.trunk = {}
	objects.trunk.body = love.physics.newBody(world, 400, 400, 0, 0)
	objects.trunk.shape = love.physics.newRectangleShape(objects.trunk.body, 0, -32, 16, 64, 0)
	objects.trunk.sprite = love.graphics.newImage("trunk.png")
	objects.trunk.sprite:setFilter("nearest","nearest")
	objects.trunk.shape:setData("tree")
end

function setNewTree()
		objects.tree.body:destroy()
		objects.tree.shape:destroy()
		objects.tree = nil
		getTree()
end

function drawTree()
	love.graphics.circle("fill", objects.tree.body:getX(),objects.tree.body:getY(),objects.tree.shape:getRadius(),20)
	love.graphics.polygon("fill", objects.trunk.shape:getPoints())
	
	love.graphics.draw(objects.trunk.sprite,objects.trunk.body:getX(),objects.trunk.body:getY(),0,2,2,4,32)
	love.graphics.draw(objects.tree.sprite,objects.tree.body:getX(),objects.tree.body:getY(),0,2,2,25,25)
end