require( "middleclass.lua" );


-- possibly things like ballochain should also be a singleton, and 
-- it is only the _state_ which should be recreated each time, not 
-- the whole thing (would solve most of my physics-related inelegancies) 
-- ie 'have a state' rather than 'be a state'

---careful with mouse coordinates- you have to reverse the transformation through the camera.


	
--stepwise animation

Camera = class("Camera");


function Camera:initialize(ctx)
  	self.width=800
  	self.height=600
  	self.screenWidth=800
  	self.screenHeight=600
  	self.x=0
  	self.y=0
--	self.scale=self.screenWidth/self.width
  	self.zoom=self.width/self.screenWidth
end



function Camera:newState(dt,oldstate,ctx)
	self.width = self.width
	self.height = ( self.screenHeight / self.screenWidth) * self.width
	self.zoom=self.width/self.screenWidth
	return self
end



function Camera:worldCoodsFromScreenCoords(x,y) --for reverse transforming mouse coordinates
	return x*self.scale,y*self.scale
end

function Camera:pickmode()
    modes = love.graphics.getModes()
    lowest = reduce(function (a,b) if math.abs((a.width/a.height)-1.5)<math.abs((b.width/b.height)-1.5) then return a else return b end end,modes)
    
    love.graphics.setMode(self.screenWidth,self.screenHeight)


end