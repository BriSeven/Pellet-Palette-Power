require("MiddleClass.lua")

PhysicsWorld = class('PhysicsWorld')
function PhysicsWorld:initialize()
	self.world = love.physics.newWorld(0, 0, 650, 650) --create a world for the bodies to exist in with width and height of 650
	self.world:setGravity(100, -100) --the x component of the gravity will be 0, and the y component of the gravity will be 700
	self.world:setMeter(64) --the height of a meter in this world will be 64px
	print("PhysicsWorld:initialize()...")
end

function PhysicsWorld:getWorld()
	return self.world
end