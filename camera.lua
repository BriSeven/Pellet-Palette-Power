require( "middleclass.lua" );
require("playhead.lua")

-- possibly things like ballochain should also be a singleton, and 
-- it is only the _state_ which should be recreated each time, not 
-- the whole thing (would solve most of my physics-related inelegancies) 
-- ie 'have a state' rather than 'be a state'

---careful with mouse coordinates- you have to reverse the transformation through the camera.

thing = thing or 0
--stepwise animation

Camera = class("Camera");


function Camera:initialize(ctx)
  	self.width=800
  	self.height=600
  	self.screenWidth=320
  	self.screenHeight=240
  	self.x=0
  	self.y=0
--	self.scale=self.screenWidth/self.width
  	self.zoom=self.screenWidth/self.width
end



function Camera:newState(dt,oldstate,ctx)
  thing = thing + 1
  self.x = self.x+1/self.zoom
  if  (thing % 40) < 1 then 
	   self.width = self.width * 0.5

  end 
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