require("middleclass.lua")
require ("Vector.lua")



Gate = class("Gate")




function Gate:initialize(is_open, x,y,ctx)
	self.x=x
	self.y=y

	self.open = is_open

	--return constructed instance
	return self
end


function Gate:newState(dt,oldstate,ctx)
	-- Use newState in places where you might normally use something like an 'update()' method.
	-- It does what an update() method would do, except that onstea of mutating the values on the original
	-- instance, it actually returns an entire new instance ... The role of this method is really very
	-- similar to the role of update() type methods, except that, by returning a new instance,  newState provides
	-- some useful capabilities which could be used for things like playhead etc...

	return self
end

function Gate:Toggle()

	self.open = not self.open

end

function Gate:newDrawable(state)
	local d = {}
	state = self


	table.insert(d, {
	name="gatepost1",  --center and scale should be camera and db responsibilities
	character="ballochan",
	x=self.x*32,
	y=self.y*32,     --x and y assuming 800x600 screen
	a=0,
	sx=0.25,
	sy=0.25,
	cx=0,
	cy=0
	})
	
	table.insert(d, {
	name="gatepost2",  --center and scale should be camera and db responsibilities
	character="ballochan",
	x=self.x*32,
	y=self.y*32,     --x and y assuming 800x600 screen
	a=0,
	sx=0.25,
	sy=0.25,
	cx=0,
	cy=0
	})

	-- insert a different graphic for opern vs closed forcefield states
	if self.open then
	
		table.insert(d, {
		name="open_forcefield",  --center and scale should be camera and db responsibilities
		character="ballochan",
		x=self.x*32,
		y=self.y*32,     --x and y assuming 800x600 screen
		a=0,
		sx=0.25,
		sy=0.25,
		cx=0,
		cy=0
		})
	end
	if self.open then
		table.insert(d, {
		name="closed_forcefield",  --center and scale should be camera and db responsibilities
		character="ballochan",
		x=self.x*32,
		y=self.y*32,     --x and y assuming 800x600 screen
		a=0,
		sx=0.25,
		sy=0.25,
		cx=0,
		cy=0
		})
	end	

	return d
end
