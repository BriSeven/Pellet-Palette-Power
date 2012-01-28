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
--    
 

    
--	--the current location 
--	self.NewLocation = Vector:new(x,y)
--	
--	--the old location 
--	self.OldLocation = Vector:new(x,y)
	

	
	--return constructed instance
	return self
end


function Tractor:newState(dt,oldstate,ctx)
	-- Use newState in places where you might normally use something like an 'update()' method. 
	-- It does what an update() method would do, except that onstea of mutating the values on the original 
	-- instance, it actually returns an entire new instance ... The role of this method is really very 
	-- similar to the role of update() type methods, except that, by returning a new instance,  newState provides
	-- some useful capabilities which could be used for things like playhead etc...


--    local newx = math.floor(ctx.mouse.x/32)
--	local newy =  math.floor(ctx.mouse.y/32)

    local newx = self.x
	local newy = self.y

	vecNewPos = Vector:new(newx, newy)
	self:ApplyNewPosition(vecNewPos)
	
	return self
end

function Tractor:ApplyNewPosition(vecNewPosition)

	--apply new position to creature
--	self.OldLocation.x = self.NewLocation.x
--	self.OldLocation.y = self.NewLocation.y
	
--	self.x =  self.NewLocation.x + vecMoveDirectionVector.x
--	self.NewLocation.y =  self.NewLocation.y + vecMoveDirectionVector.y
	
	newx = vecNewPosition.x
	newy = vecNewPosition.y
	local isobstacle = getTileProperty("obstacle",newx,newy,ctx)
	local iscreature = 	getTileProperty("HasCreature", newx, newy,ctx,"Creatures")
	if(ctx.key) then
		setTileProperty("obstacle",false,newx,newy,ctx)
	end
	print("isobstacle")
	print(isobstacle)
	if(isobstacle ~= 1) and (iscreature ~=1) then	
		-- clean-up: we set the 'HasTractor' property to 'false' for the current tile we are about to leave.
	    setTileProperty("HasTractor", false, newx, newy, ctx, "Creatures")
		self.x = newx
		self.y = newy
		-- preparation: we set the 'HasTractor' property to 'true' for the new tile we are about to enter.
		setTileProperty("HasTractor", 1, newx, newy, ctx, "Creatures")
	end
end



-- move North
function Tractor:KeyboardMoveNorth()

    vecNewPos = Vector:new(self.x + self.UpMoveVec.x, self.y + self.UpMoveVec.y) 
	self:ApplyNewPosition(vecNewPos)	
end

-- move East
function Tractor:KeyboardMoveEast()
    vecNewPos = Vector:new(self.x + self.RightMoveVec.x, self.y + self.RightMoveVec.y) 
	self:ApplyNewPosition(vecNewPos)
end

-- move South
function Tractor:KeyboardMoveSouth()
    vecNewPos = Vector:new(self.x + self.DownMoveVec.x, self.y + self.DownMoveVec.y) 
	self:ApplyNewPosition(vecNewPos)
end

-- move West
function Tractor:KeyboardMoveWest()
    vecNewPos = Vector:new(self.x + self.LeftMoveVec.x, self.y + self.LeftMoveVec.y) 
	self:ApplyNewPosition(vecNewPos)
end




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

function Tractor:DropFoodFood(dt,oldstate,ctx)
	-- drop some food in this cell
    print("Not Implemented: ".. "Creature:DropFoodFood(dt,oldstate,ctx)" .. "!!!!!")
end


function Tractor:ToggleGate(dt,oldstate,ctx)
	-- drop some food in this cell
    print("Not Implemented: ".. " Tractor:ToggleGate(dt,oldstate,ctx))" .. "!!!!!")
end

function Tractor:FindNearestGate(dt,oldstate,ctx)
	-- drop some food in this cell
    print("Not Implemented: ".. " Tractor:FindNearestGate(dt,oldstate,ctx))" .. "!!!!!")
    return nearest_gate
end

function Tractor:FindNearestGate(dt,oldstate,ctx)
	-- drop some food in this cell
    print("Not Implemented: ".. " Tractor:FindNearestGate(dt,oldstate,ctx))" .. "!!!!!")
    return nearest_gate
end
-------------------------------------------------------------------------



