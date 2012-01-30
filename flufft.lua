require( "middleclass.lua" );


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

	local newx = math.floor(ctx.mouse.x/32)
	local newy =  math.floor(ctx.mouse.y/32)
	local isobstacle = getTileProperty("obstacle",newx,newy,ctx)
	if(ctx.key) then
		setTileProperty("obstacle",false,newx,newy,ctx)
	end

	if(isobstacle ~= 1) then
		self.x = newx
		self.y = newy
	else 
		-- if using this for release version, consider correcting 0,0 reset, see ie Tractor:newState for wahat to do instead...
		self.x=0
		self.y=0
	end
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

















