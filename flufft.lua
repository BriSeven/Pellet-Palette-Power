require( "MiddleClass.lua" );


-- possibly things like ballochain should also be a singleton, and 
-- it is only the _state_ which should be recreated each time, not 
-- the whole thing (would solve most of my physics-related inelegancies) 
-- ie 'have a state' rather than 'be a state'


--stepwise animation

Flufft = class("Flufft");


function Flufft:initialize(ctx)
	self.x=0
	self.y=0

	
end



function Flufft:newState(dt,oldstate,ctx)


	self.x = math.floor(ctx.mouse.x/32)
	self.y = math.floor(ctx.mouse.y/32)

	return self
end

function Flufft:newDrawable(state)
	local d = {}
	state = self
	table.insert(d, {
		 name="body",  --center and scale should be camera and db responsibilities
		 character="ballochan",
		 x=state.x*32,
		 y=state.y*32,     --x and y assuming 800x600 screen
		 a=0,
		 sx=0.25,
		 sy=0.25,
		 cx=0,
		 cy=0
	})

	return d
end

















