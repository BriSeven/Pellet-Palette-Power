require("singleton_mixin.lua")

-- See https://love2d.org/forums/viewtopic.php?f=5&t=1053

-- Use a Singleton to hold physics world. Almost certainly overkill, but I 
-- do not have a strong enough feel for visibility and variable-scope in Lua
-- to be sure any othre way thta a) only one of these gets mnade and b) it is easy to access from anywhere. 

--PhysicsWorld = class("PhysicsWorld")
--PhysicsWorld:include(Singleton)
--
--function PhysicsWorld:initialize()
----	self.world = love.physics.newWorld(0, 0, 650, 650) --create a world for the bodies to exist in with width and height of 650
----	self.world:setGravity(100, -100) --the x component of the gravity will be 0, and the y component of the gravity will be 700
----	self.world:setMeter(64) --the height of a meter in this world will be 64px
--   local y = 4
--end
--
--function PhysicsWorld:getWorld()
----	return self.world 
--    local x = 3
--end

-- File 'Game.lua'
--require('singleton.lua')
PhysicsWorld = class('PhysicsWorld')
function PhysicsWorld:initialize()
	self.world = love.physics.newWorld(0, 0, 650, 650) --create a world for the bodies to exist in with width and height of 650
	self.world:setGravity(100, -100) --the x component of the gravity will be 0, and the y component of the gravity will be 700
	self.world:setMeter(64) --the height of a meter in this world will be 64px
	print("PhysicsWorld:initialize()...")
end


-- It is important that this is done at the end, or at least after the Game:initialize() function is defined. Otherwise it will not work
PhysicsWorld:include(Singleton) -- the ... means 'parameters for creating the PhysicsWorld instance, if any'