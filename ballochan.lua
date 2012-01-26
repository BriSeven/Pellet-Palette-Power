require( "MiddleClass.lua" );

--stepwise animation

Ballochan = class("Ballochan");
function Ballochan:initialise()
	self.x = 400
	self.y = 250
	self.a = 0
end



function Ballochan:newState(dt,oldstate,ctx)
--	local new = Ballochan.create()
	local new = Ballochan:new()
	new.a=oldstate.a+10 * dt
	local vx, vy,d 
	vx=ctx.mouse.x-oldstate.x 
	vy=ctx.mouse.y-oldstate.y
    d= math.sqrt(vx*vx+vy*vy) 

	if d > 64 then 
		new.x = 2*(ctx.mouse.x*0.01+oldstate.x*0.99)
		new.y = 2*(ctx.mouse.y*0.01+oldstate.y*0.99)
	else 
		new.x = oldstate.x+math.cos(clock)*(d/64)*3
		new.y = oldstate.y+math.sin(clock)*(d/64)*5
	end
	 
	return new
end

function Ballochan:newDrawable(state)
	local d = {}
	local r = 1 + math.sin(self.a*math.pi/20)
	state = state or self
	for i = 1,10 do

		table.insert(d, {
			name="ear",  --center and scale should be camera and db responsibilities
			character="ballochan",
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
		 character="ballochan",
		 x=state.x,
		 y=state.y,     --x and y assuming 800x600 screen
		 a=0,
		 sx=1,
		 sy=1,
		 cx=64,
		 cy=64
	})
	table.insert(d, {
		 name="face",  --center and scale should be camera and db responsibilities
		 character="ballochan",
		 x=state.x,
		 y=(state.y + math.sin(state.a/5) * 3),    --x and y assuming 800x600 screen
		 a=0,
		 sx=1,
		 sy=1,
		 cx=64,
		 cy=64
	})



	return d
end


--function Ballochan.create()
--	local self = {}
--	setmetatable(self,Ballochan)
--	
--
--	return self
--end















--require( "MiddleClass.lua" );
--
----stepwise animation
--
--Ballochan =  Ballochan or {
--	x = 400, 
--	y = 250, 
--	a = 0
--}
--Ballochan.__index=Ballochan
--
--
--function Ballochan:newState(dt,oldstate,ctx)
--	local new = Ballochan.create()
--	new.a=oldstate.a+10 * dt
--	local vx, vy,d 
--	vx=ctx.mouse.x-oldstate.x 
--	vy=ctx.mouse.y-oldstate.y
--    d= math.sqrt(vx*vx+vy*vy) 
--
--	if d > 64 then 
--		new.x = 2*(ctx.mouse.x*0.01+oldstate.x*0.99)
--		new.y = 2*(ctx.mouse.y*0.01+oldstate.y*0.99)
--	else 
--		new.x = oldstate.x+math.cos(clock)*(d/64)*3
--		new.y = oldstate.y+math.sin(clock)*(d/64)*5
--	end
--	 
--	return new
--end
--
--function Ballochan:newDrawable(state)
--	local d = {}
--	local r = 1 + math.sin(self.a*math.pi/20)
--	state = state or self
--	for i = 1,10 do
--
--		table.insert(d, {
--			name="ear",  --center and scale should be camera and db responsibilities
--			character="ballochan",
--			x=state.x,
--			y=state.y,    --x and y assuming 800x600 screen
--			a=(i * math.pi*2/10) + state.a/10,
--			sx=1,
--			sy=1,
--			cx=16,
--			cy=(64+10*r)
--		})
--
--	end
--	table.insert(d, {
--		 name="body",  --center and scale should be camera and db responsibilities
--		 character="ballochan",
--		 x=state.x,
--		 y=state.y,     --x and y assuming 800x600 screen
--		 a=0,
--		 sx=1,
--		 sy=1,
--		 cx=64,
--		 cy=64
--	})
--	table.insert(d, {
--		 name="face",  --center and scale should be camera and db responsibilities
--		 character="ballochan",
--		 x=state.x,
--		 y=(state.y + math.sin(state.a/5) * 3),    --x and y assuming 800x600 screen
--		 a=0,
--		 sx=1,
--		 sy=1,
--		 cx=64,
--		 cy=64
--	})
--
--
--
--	return d
--end
--
--
--function Ballochan.create()
--	local self = {}
--	setmetatable(self,Ballochan)
--	
--
--	return self
--end