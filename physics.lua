require("MiddleClass.lua")

Physics = class('Physics')

-- wsl This really needs to be a singleton!

function Physics:initialize(width, height)

    self.objects={}
    self.width = width
    self.height = height
	self.world = love.physics.newWorld(0, 0, self.width, self.height) --create a world for the bodies to exist in.
	self.world:setGravity(10, 10) --the x component of the gravity will be 0, and the y component of the gravity will be 700
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

function Physics:newBody(game_actor_instance)
	  --let's create a ball
  		game_actor_instance.body = love.physics.newBody(world, 650/2, 650/2, 15, 0) --place the body in the center of the world, with a mass of 15
  		game_actor_instance.shape = love.physics.newCircleShape(game_actor_instance.body, 0, 0, 20) --the ball's shape has no offset from it's body and has a radius of 20
		-- make sure the physics body has a reference back to the game_actor - needed for acting on collisions, applying damage, all that sort of thing
		-- print_table(game_actor_instance.body) --wsl note can't print out c-userdata
		-- wsl note: looks like userdata has to be strings only... see https://love2d.org/forums/viewtopic.php?f=3&t=469

	    --wsl:  For reasons beyond my comprehension the userdata goes on the shape, not the body...
		game_actor_instance.shape:setData(game_actor_instance.name) 
		
--		wendyprint("In  Physics:newBody ... game_actor_instance is: ")
--	    wendyprint(game_actor_instance)
--	    wendyprint("In  Physics:newBody ... game_actor_instance.body is: ")
--	    wendyprint(game_actor_instance.body)
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


	
