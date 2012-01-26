-- Holds the passing clouds.

Clouds = {
	clouds={},
	cloud_buffer = 0,
	cloud_interval = 1
}
Clouds.__index=Clouds
	-- Inserts a new cloud.
function Clouds:try_spawn_cloud(dt)

	self.cloud_buffer = self.cloud_buffer + dt
	
	if self.cloud_buffer > self.cloud_interval then
		self.cloud_buffer = 0
		self:spawn_cloud(-512, math.random(-50, 500), 80 + math.random(0, 50))
	end
		
end


function Clouds:spawn_cloud(xpos, ypos, speed)
	table.insert(self.clouds, { x = xpos, y = ypos, s = speed } )
end


function Clouds.create()
	local self = {}
	setmetatable(self, Clouds)

	local clouds = {}
	self.clouds=clouds

   	return self
   	
end	

function Clouds:newState(dt,oldstate,ctx)

	local new = Clouds.create() 
	local count = 20
	local length = #oldstate.clouds
	local surplus = (length-count)
	if surplus < 0 then surplus = 0 end 
	new.cloud_buffer=oldstate.cloud_buffer
	for k, c in ipairs(oldstate.clouds) do

		if k>surplus then 
			new.clouds[k-surplus]={x=c.x, y=c.y, s=c.s}
			new.clouds[k-surplus].x = c.x + c.s * dt
		end 
	end

	return new
end


function Clouds:newDrawable() 
	local d= {}
	for k, c in ipairs(self.clouds) do
		table.insert(d, {
			name="cloud",  --scale should be camera and db responsibilities
			character="clouds",
			x=c.x,
			y=c.y,    --x and y assuming 800x600 screen
			a=0,
			sx=1,
			sy=1,
			cx=0,
			cy=0
		})
	end
	

	return d 
end
