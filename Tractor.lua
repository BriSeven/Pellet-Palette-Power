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
	local newx = self.x
	local newy = self.y
	local keyboard = true

	
	if not keyboard then                       -- use mouse
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
----=============================================================================	
--------------------> wsl:todo Make this work again for obstacles!
--
--	availableDirections ={
--	
--		IsUpAvailable = {0 , -1},
--		IsLeftAvailable = {-1, 0},
--		--{0 , 0}
--		IsRightAvailable = {1 , 0},
--		IsDownAvailable = {0 , 1},
--	}
--	available = f_map(
--	function(d)
--
--	--	if d and d[0] and d[1] and self.NewLocation.x and self.NewLocation.y then
--			if(
--			getTileProperty("Obstacle",
--			newx+d[1],
--			newy+d[2],
--			ctx,"Ground") ~= 1 and
--			getTileProperty("HasCreature",
--			newx+d[1],
--			newy+d[2],
--			ctx,"Creatures") ~= 1) then
--
--			return true
--			end
--		--end
--
--		return false
--
--
--	end,
--	availableDirections)
----=============================================================================
--	
	

	
	-- Deal with obstacles
	local isobstacle = getTileProperty("obstacle",newx,newy,ctx, "Ground")
	local iscreature = 	getTileProperty("HasCreature",newx,newy,ctx,"Creatures")
	
--	if(ctx.key) then
--		setTileProperty("obstacle",false,newx,newy,ctx)
--	end

	-- if new position is not on an obstacle or a creature, we will assign the new coords to self.
--	if ((isobstacle == 1) or (iscreature ==1)) then
--	if (isobstacle) then
	if (iscreature) then
		print("==============================================================Tractor on an obstacle!!!!!!!!!!!!!!!!!!!!!!!")		
	else
		-- clean-up: we set the 'HasTractor' property to 'false' for the current tile we are about to leave.
		--setTileProperty("HasCreature", false, newx, newy, ctx, "Creatures")  --wsl:todo oops don't collide with ourself!!
		self.x = newx
		self.y = newy
		-- preparation: we set the 'HasTractor' property to 'true' for the new tile we are about to enter.
		-- setTileProperty("HasCreature", 1, newx, newy, ctx, "Creatures") --wsl:todo oops don't collide with ourself!!
		
	end

	self.x=newx
	self.y=newy
	
	
	return self
end

------------------> wsl:todo Make this work again for obstacles!
--available = f_map(
--	function(d)
--
--		
--	--	if d and d[0] and d[1] and self.NewLocation.x and self.NewLocation.y then
--			if(
--			getTileProperty("Obstacle", 
--			self.NewLocation.x+d[1],
--			self.NewLocation.y+d[2],
--			ctx,"Ground") ~= 1 and 
--			getTileProperty("HasCreature",
--			self.NewLocation.x+d[1],
--			self.NewLocation.y+d[2],
--			ctx,"Creatures") ~= 1) then
--
--			return true
--			end
--		--end
--		
--		return false
--		
--		
--	end,
--	availableDirections)





--wsl:todo cleanup internet files from deranged tractor...
function Tractor:newDrawable(state)
	local d = {}
	state = self

	table.insert(d, {
	name="body",  --center and scale should be camera and db responsibilities
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

function Tractor:DropRedFood(dt,oldstate,ctx)
	-- drop some food in this cell
--	print(DumpObject(ctx))
-- 	local num_red_pellets = getTileProperty("RedFood",self.x,self.y,ctx,"RedPellets") or 0
--	setTileProperty("RedFood", num_red_pellets + 1,self.x,self.y,ctx,"RedPellets")
--	self:UpdateCellShitLevel("red", self.x,self.y,ctx)
	print("=========================Tractor:DropRedFood(dt,oldstate,ctx) Not Implemented!!!!!")
end

function Tractor:DropYellowFood(dt,oldstate,ctx)
	-- drop some food in this cell
--	print(DumpObject(ctx))
-- 	local num_red_pellets = getTileProperty("YellowFood",self.x,self.y,ctx,"YellowPellets") or 0
--	setTileProperty("YellowFood", num_red_pellets + 1,self.x,self.y,ctx,"YellowPellets")
--	self:UpdateCellShitLevel("yellow", self.x,self.y,ctx)
print("=========================Tractor:DropYellowFood(dt,oldstate,ctx) Not Implemented!!!!!")
end
function Tractor:DropPurpleFood(dt,oldstate,ctx)
	-- drop some food in this cell
--	print(DumpObject(ctx))
-- 	local num_red_pellets = getTileProperty("PurpleFood",self.x,self.y,ctx,"PurplePellets") or 0
--	setTileProperty("PurpleFood", num_red_pellets + 1,self.x,self.y,ctx,"PurplePellets")
--	self:UpdateCellShitLevel("purple", self.x,self.y,ctx)
print("=========================Tractor:DropPurpleFood(dt,oldstate,ctx) Not Implemented!!!!!")
end



--------------------------------------------------------------------------------
-- Food and Shit Related Methods
--------------------------------------------------------------------------------
--update the shit level of this cell
function Tractor:UpdateCellShitLevel(color,x,y,ctx)
	
	--update red shit
	if(color == "red") then
	--get current shit level
	local redShitLevel = getTileProperty("RedFood",x,y,ctx,"RedPellets")
	
	--if(redShitLevel ~= nil)then
		
		--set cell graphic
		
		
		--if there is no shit
		if redShitLevel == 0 then
			setTileGraphic("RedPellets",0,x,y,ctx)
		end
		--if shit is at level 1
		
		--if shit is at level 2
		
		--if shit is at level 3
	end -- end update-red-shit
	
	--update yellow shit
	if(color == "yellow") then
	--get current shit level
	local redShitLevel = getTileProperty("YellowFood",x,y,ctx,"YellowPellets")
	
	--if(yellowShitLevel ~= nil)then
		
		--set cell graphic
		
		
		--if there is no shit
		if yellowShitLevel == 0 then		
			setTileGraphic("YellowPellets",0,x,y,ctx)
		end
		--if shit is at level 1
		
		--if shit is at level 2
		
		--if shit is at level 3
	end -- end update-yellow-shit
	
	--update purple shit
	if(color == "purple") then
	--get current shit level
	local purpleShitLevel = getTileProperty("PurpleFood",x,y,ctx,"PurplePellets")
	
	--if(purpleShitLevel ~= nil)then
		
		--set cell graphic
		
		
		--if there is no shit
		if purpleShitLevel == 0 then
			setTileGraphic("PurplePellets",0,x,y,ctx)
		end
		--if shit is at level 1
		
		--if shit is at level 2
		
		--if shit is at level 3
	end -- end update-purple-shit
end

--------------------------------------------------------------------------------
-- Gate Related Methods
--------------------------------------------------------------------------------
function Tractor:ToggleGate(dt,oldstate,ctx)
	gate = self:FindNearestGate(dt,oldstate,ctx)
	gate:Toggle()
end

function Tractor:FindNearestGate(dt,oldstate,ctx)
	-- drop some food in this cell
	print("Not Implemented: ".. " Tractor:FindNearestGate(dt,oldstate,ctx))" .. "!!!!!")


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



