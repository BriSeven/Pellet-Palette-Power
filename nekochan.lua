--require( "middleclass.lua" );

--stepwise animation

Nekochan =  Nekochan or {
	x = 400, 
	y = 250, 
	a = 0
}
Nekochan.__index=Nekochan


function Nekochan:newState(dt,oldstate,ctx)
	local new = Nekochan.create()
	new.a=oldstate.a+10 * dt
	local vx, vy,d 
	vx=ctx.mouse.x-oldstate.x 
	vy=ctx.mouse.y-oldstate.y
    d= math.sqrt(vx*vx+vy*vy) 

	if d > 64 then 
		new.x = (ctx.mouse.x*0.1+oldstate.x*0.9)
		new.y = (ctx.mouse.y*0.1+oldstate.y*0.9)
	else 
		new.x = oldstate.x+math.cos(clock)*(d/64)*3
		new.y = oldstate.y+math.sin(clock)*(d/64)*5
	end
	 
	return new
end

function Nekochan:newDrawable(state)
	local d = {}
	local r = 1 + math.sin(self.a*math.pi/20)
	state = state or self
	for i = 1,10 do

		table.insert(d, {
			name="ear",  --center and scale should be camera and db responsibilities
			character="nekochan",
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
		 character="nekochan",
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
		 character="nekochan",
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


function Nekochan.create()
	local self = {}
	setmetatable(self,Nekochan)

	return self
end