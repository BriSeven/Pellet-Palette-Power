require( "MiddleClass.lua" );


-- possibly things like ballochain should also be a singleton, and 
-- it is only the _state_ which should be recreated each time, not 
-- the whole thing (would solve most of my physics-related inelegancies) 
-- ie 'have a state' rather than 'be a state'

---careful with mouse coordinates- you have to reverse the transformation through the camera.

--todo: Move as much of this stuff to camera.lua as possible
lowbuffer = love.graphics.newFramebuffer(240,160)
scale = 240/800
pixelsize = 4
clock = 0;
	
--stepwise animation

Camera = class("Camera");


function Camera:initialize(ctx)
	self.width=800
	self.height=600
	self.x=0
	self.y=0
	self.scale=240/self.width

end



function Camera:newState(dt,oldstate,ctx)
	self.width=self.width+dt*50 
	self.scale=240/self.width
	return self
end

function Camera:newDrawable(drawable)
	local d = {}
	--state = state or self
	for k,c in ipairs(drawable) do
		table.insert(d, {
			 name=c.name,  --center and scale should be camera and db responsibilities
			 character=c.character,
			 x=c.x * self.scale,
			 y=c.y * self.scale,     --x and y assuming 800x600 screen
			 a=c.a,
			 sx=c.sx*self.scale,
			 sy=c.sy*self.scale,
			 cx=c.cx,
			 cy=c.cy
		})
	end


	return d
end


function Camera:worldCoodsFromScreenCoords() --for reverse transforming mouse coordinates
	
end

function pickmode()
    modes = love.graphics.getModes()
    lowest = reduce(function (a,b) if math.abs((a.width/a.height)-1.5)<math.abs((b.width/b.height)-1.5) then return a else return b end end,modes)
    love.graphics.setMode(960,640)


end