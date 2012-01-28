require("middleclass.lua")
require ("Vector.lua")
require("dumpfile")
require("wendy_useful")
--require("debugger")() wsl:todo clean up!


Tractor = class("Tractor")


function Tractor:initialize(x,y,ctx, BigUpdatRate)
    -- wsl:todo ctx not actually used as a member variable on this class (unlike on the 
    -- Creature class upon which this class is based.) Instead it is just poassed in when
    -- needed. Consider getting rid of the member variable.
    
    
    --	local NoMoveVec = self.Lazyness

	self.UpMoveVec        = Vector:new(0,-1)
	self.UpLeftMoveVec    = Vector:new(-0.52,-0.52)
	self.LeftMoveVec      =  Vector:new(-1,0)
	self.DownLeftMoveVec  = Vector:new(-0.52,0.52)
	self.DownMoveVec      =  Vector:new(0,1)
	self.DownRightMoveVec = Vector:new(0.52,0.52)
	self.RightMoveVec     =  Vector:new(1,0)
	self.UpRightMoveVec   =  Vector:new(0.52,-0.52)
    
 
    
    
	--the current location 
	self.NewLocation = Vector:new(x,y)
	
	--the old location 
	self.OldLocation = Vector:new(x,y)
	
	--smoothed position 
	self.SmoothedLocation = Vector:new(x,y)
	
	--the time between big updates
	self.TimeBetweenBigUpdates = BigUpdatRate
	
	
  	--the time since the last big update
	self.TimeSinceLastBigUpdate = math.random(0,BigUpdatRate)
	
	--return constructed instance
	return self
end


function Tractor:newState(dt,oldstate,ctx)
	-- Use newState in places where you might normally use something like an 'update()' method. 
	-- It does what an update() method would do, except that onstea of mutating the values on the original 
	-- instance, it actually returns an entire new instance ... The role of this method is really very 
	-- similar to the role of update() type methods, except that, by returning a new instance,  newState provides
	-- some useful capabilities which could be used for things like playhead etc...


	
	
	self.TimeSinceLastBigUpdate = self.TimeSinceLastBigUpdate + dt
	
		if self.TimeBetweenBigUpdates < self.TimeSinceLastBigUpdate then
			self.TimeSinceLastBigUpdate = self.TimeSinceLastBigUpdate - self.TimeBetweenBigUpdates;
			
			--perform big update
			self:BigUpdate(dt,oldstate,ctx)
			
		end
	

	return self
end


-- wsl:todo May not need any smoothing for the tractor; we shall see...
function Tractor:BigUpdate(dt,oldstate,ctx)
	print("Tractor:BigUpdate(dt,oldstate,ctx).............")
	
	vecPlayerWantsToGo = self:GetVecPlayerWantsToGo()
	

	print("vecPlayerWantsToGo.x")
	print(vecPlayerWantsToGo.x)
	print("vecPlayerWantsToGo.y")
	print(vecPlayerWantsToGo.y)
	
	--turn planned direction to grid locked direction
	local vecGridDirection = self:FinalMoveDirection(dt,oldstate,ctx,vecPlayerWantsToGo)
	
	print("vecGridDirection.x")
	print(vecGridDirection.x)
	print("vecGridDirection.y")
	print(vecGridDirection.y)
	
	--apply it to character
	self:Move(ctx,vecGridDirection)
		
end

	

-- move North
function Tractor:KeyboardMoveNorth()
	self:ApplyNewPosition(self.UpMoveVec)	
end

-- move East
function Tractor:KeyboardMoveEast()
	self:ApplyNewPosition(self.LeftMoveVec)	
end

-- move South
function Tractor:KeyboardMoveSouth()
	self:ApplyNewPosition(self.DownMoveVec)	
end

-- move West
function Tractor:KeyboardMoveWest()
	self:ApplyNewPosition(self.RightMoveVec)	
end

function Tractor:GetVecPlayerWantsToGo()

	-- wsl: taken directly from the newState method Bret used in Flufft. Will probably tweak later to get exact
	-- most funnest movement&control mechanism for the tractor, but this will do while prototyping!
	-- wsl: todo neaten code below, regardless of whether it is changed or not...
	local newx = math.floor(ctx.mouse.x/32)
	local newy =  math.floor(ctx.mouse.y/32)
	local isobstacle = getTileProperty("obstacle",newx,newy,ctx)
	if(ctx.key) then
		setTileProperty("obstacle",false,newx,newy,ctx)
	end
	print(isobstacle)
	if(isobstacle ~= 1) then
	self.x = newx
	self.y = newy--	-- wsl: taken directly from the newState method Bret used in Flufft. Will probably tweak later to get exact
--	-- most funnest movement&control mechanism for the tractor, but this will do while prototyping!
--	-- wsl: todo neaten code below, regardless of whether it is changed or not...
	else 
		self.x=0
		self.y=0
	end
	
	PlayerVec = Vector:new(self.x, self.y)
	
	print("PlayerVec.x")
	print(PlayerVec.x)
	print("PlayerVec.y")
	print(PlayerVec.y)
	
--	PlayerVec.x = self.x
--	PlayerVec.y = self.y
--	
--	self.SmoothedLocation = Vector:new(x,y)
	return PlayerVec
end

-- Now that we have decided where to move to, actually do the move
function Tractor:Move(ctx,vecMoveDirectionVector)
	-- this method is for stuff we should do just prior to leaving a square. See also
	-- the related method Tractor:ApplyNewPosition
	--unmark current cell as ocupied
	--setTileProperty("HasCreature",0, self.NewLocation.x,self.NewLocation.y ,ctx,"Creatures")
	setTileProperty("obstacle",false,self.NewLocation.x + vecMoveDirectionVector.x,self.NewLocation.y + vecMoveDirectionVector.y,ctx)
   

	--mark future cell as occupied
	--setTileProperty("HasCreature",1, self.NewLocation.x + vecMoveDirectionVector.x,self.NewLocation.y + vecMoveDirectionVector.y,ctx,"Creatures")
 	setTileProperty("obstacle",true,self.NewLocation.x + vecMoveDirectionVector.x,self.NewLocation.y + vecMoveDirectionVector.y,ctx)
end	
	
function Tractor:ApplyNewPosition(vecMoveDirectionVector)	
--	-- this method is where we actually leave a square. See also the related 
--	-- method Tractor:Move
--	self.OldLocation.x = self.NewLocation.x
--	self.OldLocation.y = self.NewLocation.y
--	
--	self.NewLocation.x =  self.NewLocation.x + vecMoveDirectionVector.x
--	self.NewLocation.y =  self.NewLocation.y + vecMoveDirectionVector.y
--	
--end
---------------------------------------------------------------------------
----Work out what direction the creature has decided to go in
--function Tractor:FinalMoveDirection(dt,oldstate,ctx,vecMoveDirectionVector)
--
----error ("Not Implemented!")
--
--
--
----project movement vector onto each direction
--
----initalise all variables
----	local IsUpAvailable	= false       	|1|
----	local IsUpLeftAvailable = false		|1|	
----	local IsLeftAvailable = false		|1|
----	local IsDownLeftAvailable = false	|1|
----	local IsDownAvailable = false		|1|
----	local IsDownRighAvailable = false	|1|
----	local IsRightAvailable = false 		|1|
----	local IsUpRightAvailable = false	|1|
--
--	availableDirections ={
--		IsUpLeftAvailable = {-1, -1},
--		IsUpAvailable = {0 , -1},
--		IsUpRightAvailable = {1 , -1},
--		IsLeftAvailable = {-1, 0},
--		--{0 , 0}
--		IsRightAvailable = {1 , 0},
--		IsDownLeftAvailable = {-1, 1},
--		IsDownAvailable = {0 , 1},
--		IsDownRightAvailable = {1 , 1}
--	}
--	
--	available = f_map(
--	function(d)
--
--		
--	--	if d and d[0] and d[1] and self.NewLocation.x and self.NewLocation.y then
--			if(
--			getTileProperty("obstacle", 
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
--		print("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu")
--		
--		return false
--		
--		
--	end,
--	availableDirections)
--	


	--evaluate game moves
	-- wsl:todo write comments for this next bit!
--	moves = {{},{},{},{},{},{},{},{},{}}
--	print(DumpObject(available))
--	if available.IsUpAvailable then
--		--project move vector onto move direction
----		UpMoveWorthVal = vecMoveDirectionVector:dot(UpMoveVec)
--		moves[1]={}
--		moves[1].val = vecMoveDirectionVector:dot(self.UpMoveVec)
--		moves[1].vec = self.UpMoveVec
--	end
--	
--	if available.IsUpLeftAvailable then
--	
--		--project move vector onto move direction
----		UpLeftMoveWorthVal = vecMoveDirectionVector:dot(UpLeftMoveVec)
--		moves[2]={}
--		moves[2].val = vecMoveDirectionVector:dot(self.UpLeftMoveVec)
--		moves[2].vec = self.UpLeftMoveVec
--	end
--	
--	if available.IsLeftAvailable then
--		--project move vector onto move direction
----		LeftMoveWorthVal = vecMoveDirectionVector:dot(LeftMoveVec)
--		moves[3]={}
--		moves[3].val = vecMoveDirectionVector:dot(self.LeftMoveVec)
--		moves[3].vec = self.LeftMoveVec
--	end
--	
--	if available.IsDownLeftAvailable then
--		--project move vector onto move direction
----		DownLeftMoveWorthVal = vecMoveDirectionVector:dot(DownLeftMoveVec)
--		moves[4]={}
--		moves[4].val = vecMoveDirectionVector:dot(self.DownLeftMoveVec)
--		moves[4].vec = self.DownLeftMoveVec
--	end
--	
--	if available.IsDownAvailable then
--		--project move vector onto move direction
----		DownMoveWorthVal = vecMoveDirectionVector:dot(DownMoveVec)
--		moves[5]={}
--		moves[5].val = vecMoveDirectionVector:dot(self.DownMoveVec)
--		moves[5].vec = self.DownMoveVec
--	end
--	
--	if available.IsDownRightAvailable then
--		--project move vector onto move direction
----		DownRightMoveWorthVal = vecMoveDirectionVector:dot(DownRightMoveVec)
--		moves[6]={}
--		moves[6].val = vecMoveDirectionVector:dot(self.DownRightMoveVec)
--		moves[6].vec = self.DownRightMoveVec
--	end
--	
--	if available.IsRightAvailable then
--		--project move vector onto move direction
----		RightMoveWorthVal = vecMoveDirectionVector:dot(RightMoveVec)
--		moves[7]={}
--		moves[7].val = vecMoveDirectionVector:dot(self.RightMoveVec)
--		moves[7].vec = self.RightMoveVec
--	end
--	
--	if available.IsUpRightAvailable then
--		--project move vector onto move direction
----		UpRightMoveWorthVal = vecMoveDirectionVector:dot(UpRightMoveVec)
--		moves[8]={}
--		moves[8].val = vecMoveDirectionVector:dot(self.UpRightMoveVec)
--		moves[8].vec = self.UpRightMoveVec
--	end
--	--[[
	print(DumpObject(moves))
	--nothing to see here \/
    local the_move = moves[1]
    for index, move in ipairs(moves) do
    	if  move.val > the_move.val then
    		the_move = move
    	end 
    end
    
    
    print(the_move.val)
    print(the_move.vec)
    ]]--
    --return the_move.vec
	return Vector:new(0,0)
end



--wsl:todo cleanup internet files from deranged tractor...
function Tractor:newDrawable(state)
	local d = {}
	state = self
	
	table.insert(d, {
		 name="body",  --center and scale should be camera and db responsibilities
		 character="ballochan",
		 x=self.NewLocation.x*32,
		 y=self.NewLocation.y*32,     --x and y assuming 800x600 screen
		 a=0,
		 sx=0.25,
		 sy=0.25,
		 cx=0,
		 cy=0
	})
	
	table.insert(d, {
		 name="face",  --center and scale should be camera and db responsibilities
		 character="ballochan",
		 x=self.NewLocation.x*32,
		 y=self.NewLocation.y*32,     --x and y assuming 800x600 screen
		 a=0,
		 sx=0.25,
		 sy=0.25,
		 cx=0,
		 cy=0
	})


	return d
end

function Tractor:DropFoodFood(dt,oldstate,ctx)
	-- drop some food in this cell
    print("Not Implemented: ".. "Creature:DropFoodFood(dt,oldstate,ctx)" .. "!!!!!")
end
-------------------------------------------------------------------------



