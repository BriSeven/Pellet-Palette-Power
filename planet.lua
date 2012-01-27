require( "MiddleClass.lua" );
require("has_physics.lua");


-- possibly things like ballochain should also be a singleton, and 
-- it is only the _state_ which should be recreated each time, not 
-- the whole thing (would solve most of my physics-related inelegancies) 
-- ie 'have a state' rather than 'be a state'


--stepwise animation

Planet = class("Planet");
Planet:include(HasPhysics);


function Planet:initialize(ctx)

	
    self.ctx = ctx -- wsl: note change - now has ctx as member
--    wendyprint("Planet:initialise(ctx): self.ctx is: ")
--    wendyprint(self.ctx)
--    self.ctx.physics:newBody(self)

    wendyprint("Planet:initialise(ctx): self.body is: ")
    wendyprint(self.body)
  	if self.ctx.restart_physics then
--		self.x = 400
--		self.y = 250
--		self.a = 0	
  		wendyprint("Planet:initialise(ctx): creating body! ")
  		self:createBody(self) --wsl note pass in a game_actor, ie self,  as userdata
  		self.x = self.body:getX()
  		self.y = self.body:getY()
  		self.a = 0	
  		-- wsl whether to restart physics may later in some case be worked 
  		-- out from the known context, but in general we wil only do it on the first iteration.
  		self.ctx.restart_physics = false 
  	else
  		self.body = self.ctx.saved_physics_body --Probably a big nope
  	end
  	
end



function Planet:newState(dt,oldstate,ctx)
--	local new = Planet.create() --wsl: note change noe use new not create,and now pass in ctx.
    ctx.saved_physics_body = self.body
	local new = Planet:new(ctx)
	new.a=oldstate.a+10 * dt
	local vx, vy,d 
	vx=ctx.mouse.x-oldstate.x 
	vy=ctx.mouse.y-oldstate.y
    d= math.sqrt(vx*vx+vy*vy) 
    
    use_mouse = false
  	if use_mouse then 
  	    self:fly() --wsl
  	    print("Planet:newState: Using Mouse!")
--		new.x = 2*(ctx.mouse.x*0.01+oldstate.x*0.99)
--		new.y = 2*(ctx.mouse.y*0.01+oldstate.y*0.99)
  	else 
  		print("Planet:newState: Using Physics Only!")
--        wendyprint("In Planet:newState: Using Physics Only...self is:")
--	    wendyprint(self)
--	    print_table(self)
  	    wendyprint("In Planet:newState: Using Physics Only...self.body is:")
--	    wendyprint(self.body)
--	    print_table(self.body)
  		new.x = self.body:getX()
  		new.y = self.body:getY()
  		wendyprint(new.x)
  		wendyprint("         " ..new.y)
--		new.x = oldstate.x+math.cos(clock)*(d/64)*3
--		new.y = oldstate.y+math.sin(clock)*(d/64)*5
  	end
  	 
  	return new
  	
  	---------------------------------------------
--	--	local new = Planet.create() --wsl: note change noe use new not create,and now pass in ctx.
--	local new = Planet:new(ctx)
--	new.a=oldstate.a+10 * dt
--	local vx, vy,d 
--	vx=ctx.mouse.x-oldstate.x 
--	vy=ctx.mouse.y-oldstate.y
--    d= math.sqrt(vx*vx+vy*vy) 
--
--	if d > 64 then 
--	    self:fly() --wsl
--		new.x = 2*(ctx.mouse.x*0.01+oldstate.x*0.99)
--		new.y = 2*(ctx.mouse.y*0.01+oldstate.y*0.99)
--	else 
--		new.x = oldstate.x+math.cos(clock)*(d/64)*3
--		new.y = oldstate.y+math.sin(clock)*(d/64)*5
--	end
--	 
--	return new
end

function Planet:newDrawable(state)
	local d = {}
	local r = 1 + math.sin(self.a*math.pi/20)
	state = state or self
	for i = 1,10 do

		table.insert(d, {
			name="ear",  --center and scale should be camera and db responsibilities
			character="Planet",
			x=state.x,
			y=state.y,    --x and y assuming 800x600 screen
			a=(i * math.pi*2/10) + state.a/10,
			sx=1,
			sy=1,
			cx=16,
			cy=(64+10*r)
		})

	end
	table.insert(d, {
		 name="body",  --center and scale should be camera and db responsibilities
		 character="Planet",
		 x=state.x,
		 y=state.y,     --x and y assuming 800x600 screen
		 a=0,
		 sx=1,
		 sy=1,
		 cx=64,
		 cy=64
	})
-- wsl: Planet is a faceless chan...
--	table.insert(d, {
--		 name="face",  --center and scale should be camera and db responsibilities
--		 character="Planet",
--		 x=state.x,
--		 y=(state.y + math.sin(state.a/5) * 3),    --x and y assuming 800x600 screen
--		 a=0,
--		 sx=1,
--		 sy=1,
--		 cx=64,
--		 cy=64
--	})



	return d
end

















