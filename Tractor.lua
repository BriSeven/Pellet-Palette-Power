require("middleclass.lua")
require ("Vector.lua")



Tractor = class("Tractor")


function Tractor:initialize(x,y,ctx)

	
	self.x=x
	self.y=y



	self.UpMoveVec        = Vector:new(0,-1)
	self.UpLeftMoveVec    = Vector:new(-0.52,-0.52)
	self.LeftMoveVec      =  Vector:new(-1,0)
	self.DownLeftMoveVec  = Vector:new(-0.52,0.52)
	self.DownMoveVec      =  Vector:new(0,1)
	self.DownRightMoveVec = Vector:new(0.52,0.52)
	self.RightMoveVec     =  Vector:new(1,0)
	self.UpRightMoveVec   =  Vector:new(0.52,-0.52)

	--return constructed instance
	return self
end


function Tractor:newState(dt,oldstate,ctx)
	-- Use newState in places where you might normally use something like an 'update()' method.
	-- It does what an update() method would do, except that onstea of mutating the values on the original
	-- instance, it actually returns an entire new instance ... The role of this method is really very
	-- similar to the role of update() type methods, except that, by returning a new instance,  newState provides
	-- some useful capabilities which could be used for things like playhead etc...
	
	-- UnFear the tile we are about to depart
	self:MakeCreaturesUnFearMe(self.x, self.y, ctx)
	local newx = self.x
	local newy = self.y

	if ctx.use_mouse then                       -- use mouse 
		newx = math.floor(ctx.mouse.x/32)
		newy =  math.floor(ctx.mouse.y/32)
	else                                       -- use keyboard
	
		local direction = Vector:new(0,0)
		
		
		
		
		if(ctx.keyboard.up) then
			direction.y=direction.y-1;
		end
		if(ctx.keyboard.down) then
			direction.y=direction.y+1;
		end
		if(ctx.keyboard.left) then
			direction.x=direction.x-1;
		end
		if(ctx.keyboard.right) then
			direction.x=direction.x+1;
		end
		
		local scale = 8;
		newx = self.x + direction.x/scale
		newy = self.y + direction.y/scale

	end  

	
	-- Deal with obstacles
	
	local isobstacle = getTileProperty("Obstacle",newx,newy,ctx, "Ground")
	if isobstacle == nil then 
		isobstacle = 0
	end
		
--	print(getTileProperty("HasCreature",newx,newy,ctx,"Creatures"))
	local iscreature = 	getTileProperty("HasCreature",newx,newy,ctx,"Creatures")

		self.obstaclemultiplier = 1
	

	-- if new position is not on an obstacle or a creature, we will assign the new coords to self.
	if ((iscreature == 1) or (isobstacle == 1)) then
				
	else
		-- clean-up: we set the 'HasTractor' property to 'false' for the current tile we are about to leave.
		--setTileProperty("HasCreature", 0, newx, newy, ctx, "Creatures")  --wsl:todo oops don't collide with ourself!!

		self.x = newx
		self.y = newy
		-- preparation: we set the 'HasTractor' property to 'true' for the new tile we are about to enter.
		--setTileProperty("HasCreature", 1, newx, newy, ctx, "Creatures") --wsl:todo oops don't collide with ourself!!
		
		
	end
	-- Make Creatures Flee from me using repelling grouping force
	self:MakeCreaturesFearMe(newx, newy, -15, ctx)
	
	return self
end

function  Tractor:MakeCreaturesFearMe(newx, newy, force_strength, ctx)
    -- good value is negative, and less than negative 10
	--add grouping forces
	
	setTileProperty("RedGroupForce",force_strength, newx, newy ,ctx,"Creatures")

	setTileProperty("YellowGroupForce",force_strength, newx, newy ,ctx,"Creatures")

	setTileProperty("PurpleGroupForce",force_strength, newx, newy,ctx,"Creatures")

end

function Tractor:MakeCreaturesUnFearMe(oldx, oldy, ctx)

	--add grouping forces
	
	setTileProperty("RedGroupForce",0, oldx, oldy ,ctx,"Creatures")

	setTileProperty("YellowGroupForce",0, oldx, oldy ,ctx,"Creatures")

	setTileProperty("PurpleGroupForce",0, oldx, oldy,ctx,"Creatures")

end

function Tractor:newDrawable(state)
	local d = {}
	state = self

	table.insert(d, {
	name="body",  --center and scale should be camera and db responsibilities
	character="ballochan",
	x=self.x*32,
	y=self.y*32,     --x and y assuming 800x600 screen
	a=0,
	sx=0.25*self.obstaclemultiplier,
	sy=0.25*self.obstaclemultiplier,
	cx=0,
	cy=0
	})

	table.insert(d, {
	name="face",  --center and scale should be camera and db responsibilities
	character="ballochan",
	x=self.x*32,
	y=self.y*32,     --x and y assuming 800x600 screen
	a=0,
	sx=0.25,
	sy=0.25,
	cx=0,
	cy=0
	})


	return d
end










--------------------------------------------------------------------------------
-- Food and Shit Related Methods
--------------------------------------------------------------------------------


function Tractor:DropFood(color,ctx)

	
------------------	
	if(color == "purple") then
	
		
		local purple_shitLevel = getTileProperty("PurpleFood",self.x,self.y,ctx,"PurplePellets")
		
		if(red_shitLevel ~= nil) then 
			
		else
			
		end

	   -- if purple shitlevel == nil
		if(purple_shitLevel == nil)then
			purple_shitLevel = 0
		end
		
		if(purple_shitLevel == 3)then
			setTileProperty("PurpleFood",3,self.x,self.y,ctx,"PurplePellets")
		end
		
		if(purple_shitLevel == 2)then
			setTileProperty("PurpleFood",3,self.x,self.y,ctx,"PurplePellets")
		end
		
		if(purple_shitLevel == 1)then
			setTileProperty("PurpleFood",2,self.x,self.y,ctx,"PurplePellets")
		end
		
		if(purple_shitLevel == 0)then
			setTileProperty("PurpleFood",1,self.x,self.y,ctx,"PurplePellets")
		end
	end
------------------
	if(color == "red") then
		
		local red_shitLevel = getTileProperty("RedFood",self.x,self.y,ctx,"RedPellets") 
		
		
		if(red_shitLevel ~= nil) then 
			
		else
			
		end
	
	
		if(red_shitLevel == nil)then
			red_shitLevel = 0
		end
		
		if(red_shitLevel == 3)then
			setTileProperty("RedFood",3,self.x,self.y,ctx,"RedPellets")
		end
		
		if(red_shitLevel == 2)then
			setTileProperty("RedFood",3,self.x,self.y,ctx,"RedPellets")
		end
		
		if(red_shitLevel == 1)then
			setTileProperty("RedFood",2,self.x,self.y,ctx,"RedPellets")
		end
		
		if(red_shitLevel == 0)then
			setTileProperty("RedFood",1,self.x,self.y,ctx,"RedPellets")
		end
	end

		
------------------
	if(color == "yellow") then
		
		local yellow_shitLevel = getTileProperty("YellowFood",self.x,self.y,ctx,"YellowPellets") 
		
		if(yellow_shitLevel ~= nil) then 
			
		else
			
		end
	
		-- if yellow shitlevel == nil
		if(yellow_shitLevel == nil)then
			yellow_shitLevel = 0
		end
		
		if(yellow_shitLevel == 3)then
			setTileProperty("YellowFood",3,self.x,self.y,ctx,"YellowPellets")
		end
		
		if(yellow_shitLevel == 2)then
			setTileProperty("YellowFood",3,self.x,self.y,ctx,"YellowPellets")
		end
		
		if(yellow_shitLevel == 1)then
			setTileProperty("YellowFood",2,self.x,self.y,ctx,"YellowPellets")
		end
		
		if(yellow_shitLevel == 0)then
			setTileProperty("YellowFood",1,self.x,self.y,ctx,"YellowPellets")
		end
	end
	
	-------------------------------------------------
	self:UpdateCellShitLevel(color, self.x,self.y,ctx)
	-------------------------------------------------

end

--update the shit level of this cell
function Tractor:UpdateCellShitLevel(color,x,y,ctx)
	
--	")
	--update red shit
	if(color=="red") then
	
		--get current shit level
		local redShitLevel = getTileProperty("RedFood",x,y,ctx,"RedPellets")
		--set cell graphic
		
		if(redShitLevel ~= nil) then 
			
		end
		
		--if there is no shit
		if redShitLevel == 0 then
			setTileGraphic("RedPellets",0,x,y,ctx)
		end
			
		--if shit is at level 1
		if redShitLevel == 1 then
			setTileGraphic("RedPellets",50,x,y,ctx)
		end
		--if shit is at level 2
		if redShitLevel == 2 then
			setTileGraphic("RedPellets",53,x,y,ctx)
		end
		--if shit is at level 3
		if redShitLevel == 3 then
			setTileGraphic("RedPellets",56,x,y,ctx)
		end
	end
	
	
	--update yellow shit
	if(color=="yellow") then
		--get current shit level
		local yellowShitLevel = getTileProperty("YellowFood",x,y,ctx,"YellowPellets")
		--set cell graphic
		
		if(yellowShitLevel ~= nil) then 
			
		end
		
		--if there is no shit
		if yellowShitLevel == 0 then
			setTileGraphic("YellowPellets",0,x,y,ctx)
		end
			
		--if shit is at level 1
		if yellowShitLevel == 1 then
			setTileGraphic("YellowPellets",49,x,y,ctx)
		end
		--if shit is at level 2
		if yellowShitLevel == 2 then
			setTileGraphic("YellowPellets",52,x,y,ctx)
		end
		--if shit is at level 3
		if yellowShitLevel == 3 then
			setTileGraphic("YellowPellets",55,x,y,ctx)
		end
	end
	
	--update purple shit
	if(color=="purple") then
			--get current shit level
		local purpleShitLevel = getTileProperty("PurpleFood",x,y,ctx,"PurplePellets")
		--set cell graphic
		

		--if there is no shit
		if(purpleShitLevel ~= nil) then 
			
		end
			
		--if shit is at level 1
		if purpleShitLevel == 1 then
			setTileGraphic("PurplePellets",51,x,y,ctx)
		end
		--if shit is at level 2
		if purpleShitLevel == 2 then
			setTileGraphic("PurplePellets",54,x,y,ctx)
		end
		--if shit is at level 3
		if purpleShitLevel == 3 then
			setTileGraphic("PurplePellets",57,x,y,ctx)
		end
	end
end

--------------------------------------------------------------------------------
-- Gate Related Methods
--------------------------------------------------------------------------------
function Tractor:ToggleGate(dt,oldstate,ctx)
	gate = self:FindNearestGate(dt,oldstate,ctx)
	gate:Toggle()
end

function Tractor:FindNearestGate(dt,oldstate,ctx)



	shortest_distance_squared_found_so_far = 0

	nearest_gate = {}
	
	for i, gate in ipairs(ctx.gates)  do
		dist_squared = gate.x*gate.x + gate.y*gate.y
		if dist_squared < shortest_distance_squared_found_so_far then
			shortest_distance_squared_found_so_far = dist_squared
			nearest_gate = gate
		end
	end

	return nearest_gate
end

-------------------------------------------------------------------------



