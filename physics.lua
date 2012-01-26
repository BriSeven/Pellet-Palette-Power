require("MiddleClass.lua")

Physics = class('Physics')



function Physics:initialize(width, height)

    self.objects={}
    self.width = width
    self.height = height
	self.world = love.physics.newWorld(0, 0, self.width, self.height) --create a world for the bodies to exist in.
	self.world:setGravity(100, -100) --the x component of the gravity will be 0, and the y component of the gravity will be 700
	self.world:setMeter(64) --the height of a meter in this world will be 64px
	 -- wsl: I have literally no idea how it is that the name wendyprint is visible from here. This frightens me just
	 --     a teensy litle bit. Ah well, I shall soldier on...I guess it's better to have names appear out of 
	 --     nothing than to have names go ina black hole of inaccessibility...
	wendyprint("In PhysicsWorld:initialize() self.world is: ")
	wendyprint(self.world)
	
end

function Physics:updateWorld(dt)
	self.world:update(dt) --this puts the world into motion
end



function Physics:getWorld()
	return self.world;
end



function Physics:getWorldWidth()
	return self.width
end

function Physics:getWorldHeight()
	return self.height
end


	
