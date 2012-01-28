require("middleclass.lua")
require ("Vector.lua")

Creature = class("Creature")


function Creature:initialize(x,y,BigUpdatRate,Type)
	--the current location of the creature
	self.NewLocation = Vector:new(x,y)
	
	--the old location of the creature
	self.OldLocation = Vector:new(x,y)
	
	--smoothed position of the creature
	self.SmoothedLocation = Vector:new(x,y)
	
	--the time between big updates
	self.TimeBetweenBigUpdates = BigUpdatRate
	
	--the time since the last big update
	self.TimeSinceLastBigUpdate = 1
	
	--the type of creature this creature is
	self.CreatureType = Type
	
	--retuen constructed creature
	return self
end

function Creature:update(dt,oldstate,ctx)
	--perform small update
	self:SmallUpdate()
	
	--check if big update is needed
	
	--update time since last big update
	print("hello i do cocane")
	
	self.TimeSinceLastBigUpdate = self.TimeSinceLastBigUpdate + dt
	
	if self.TimeBetweenBigUpdates < self.TimeSinceLastBigUpdate then
		self.TimeSinceLastBigUpdate = self.TimeSinceLastBigUpdate - self.TimeBetweenBigUpdates;
		
		--perform big update
		self:BigUpdate(dt,oldstate,ctx)
		
	end
end


function Creature:newDrawable(state)
	local d = {}
	state = self
	table.insert(d, {
		 name="body",  --center and scale should be camera and db responsibilities
		 character="ballochan",
		 x=self.SmoothedLocation.x*32,
		 y=self.SmoothedLocation.y*32,     --x and y assuming 800x600 screen
		 a=0,
		 sx=0.25,
		 sy=0.25,
		 cx=0,
		 cy=0
	})

	return d
end

function Creature:SmallUpdate()
	--get the percent of time untill the next update
	local BigUpdatePercent = self.TimeSinceLastBigUpdate/ self.TimeBetweenBigUpdates
	
	self.SmoothedLocation.x = (self.NewLocation.x * BigUpdatePercent) + (self.OldLocation.x * (1- BigUpdatePercent))
	self.SmoothedLocation.y = (self.NewLocation.y * BigUpdatePercent) + (self.OldLocation.y * (1- BigUpdatePercent))
	
end

function Creature:BigUpdate(dt,oldstate,ctx)
	print("hello i do cocane")
	
	--get grazing direction
	local vecGrazing = self:Grazing(dt,oldstate,ctx)
	
	--apply it to character
	self.OldLocation.x = self.NewLocation.x
	self.OldLocation.y = self.NewLocation.y
	
	self.NewLocation.x =  self.NewLocation.x + 1
	
	
end

function Creature:EatFood(dt,oldstate,ctx)
	--get the food levels in this cell
	local Food = getTileProperty("food", newx,newy,ctx)
	
	--if this creature is a red creature
	if self.CreatureType == "Red" then 
		
		--eat the correct food
		
		--deposite the correct food
		
	--else
	end
	--if this creature is a green creature
	--if then 
	
	--else
	
	--if this creature is a blue creature
	--if then 
	
	--else
	
	--subtract a grazing amount from the cell
	--setTileProperty("food",{greenfood=20, redfood=30}, self.NewLocation.x,self.NewLocation.y,ctx)
end

function Creature:GetFoodLevelForThisCreature(food)
	
	--check if there is food in this square
	
	--if this creature is a red creature
	if self.CreatureType == "Red" then
		if food.RedFood ~= nil then
			return food.RedFood
		end
	end
	
	--if this creature is a green creature
	if self.CreatureType == "Green" then 
		if food.RedFood ~= nil then
			return food.GreenFood
		end
	end
	
	--if this creature is a blue creature
	if self.CreatureType == "Blue" then 
		if food.RedFood ~= nil then
			return food.BlueFood
		end
	end
	
	return 0
	
end

-- get the direction the character wants to go to group better
-- this function returns flock gathering
function Creature:Grouping()

	--loop through the cells surounding the creature
	
	--the distance above and below the player to scan
	local ScanSize = 3
	
	local xOffset = 0
	local yOffset = 0
	
	local CellScanCount = 0
	
	--while yOffset <  
end

--Work out what direction the creature has decided to go in and move there
function Creature:Move(dt,oldstate,ctx,vecMoveDirectionVector)

--project movement vector onto each direction

--initalise all variables
	local IsUpAvailable	= true
	local IsUpLeftAvailable = true
	local IsLeftAvailable = true
	local IsDownLeftAvailable = true
	local IsDownAvailable = true
	local IsDownRighAvailable = true
	local IsRightAvailable = true 
	local IsUpRightAvailable = true

	--check availability of squares
	if(getTileProperty("obstacle", self.NewLocation.x,self.NewLocation.y -1,ctx) ~= 1 and getTileProperty("HasCreature", self.NewLocation.x,self.NewLocation.y -1,ctx) ~= 1) then
		IsUpAvailable	= false
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x -1,self.NewLocation.y -1,ctx) ~= 1 and getTileProperty("HasCreature", self.NewLocation.x -1,self.NewLocation.y -1,ctx) ~= 1) then
		IsUpLeftAvailable	= false
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x -1,self.NewLocation.y,ctx) ~= 1 and getTileProperty("HasCreature", self.NewLocation.x -1,self.NewLocation.y ,ctx) ~= 1) then
		IsLeftAvailable	= false
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x -1,self.NewLocation.y + 1,ctx) ~= 1 and getTileProperty("HasCreature", self.NewLocation.x -1,self.NewLocation.y +1,ctx) ~= 1) then
		IsDownLeftAvailable	= false
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x ,self.NewLocation.y + 1,ctx) ~= 1 and getTileProperty("HasCreature", self.NewLocation.x ,self.NewLocation.y +1,ctx) ~= 1) then
		IsDownAvailable	= false
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x +1,self.NewLocation.y + 1,ctx) ~= 1 and getTileProperty("HasCreature", self.NewLocation.x + 1,self.NewLocation.y +1,ctx) ~= 1) then
		IsDownRighAvailable	= false
	end
	
		if(getTileProperty("obstacle", self.NewLocation.x +1,self.NewLocation.y + 1,ctx) ~= 1 and getTileProperty("HasCreature", self.NewLocation.x + 1,self.NewLocation.y +1,ctx) ~= 1) then
		IsDownRighAvailable	= false
	end


end


--get the direction the character wants to go for more food
function Creature:Grazing(dt,oldstate,ctx)
	
	--create a movement vector
	local vecGrazingDirection = Vector:new(0,0)
	
	--get the food in the cells around the creature
	local CurrentFood = self:GetFoodLevelForThisCreature(getTileProperty("food", self.NewLocation.x,self.NewLocation.y,ctx))
	local UpFood = self:GetFoodLevelForThisCreature(getTileProperty("food", self.NewLocation.x,self.NewLocation.y -1,ctx))
	local UpLeftFood = self:GetFoodLevelForThisCreature(getTileProperty("food", self.NewLocation.x -1,self.NewLocation.y -1,ctx))
	local LeftFood = self:GetFoodLevelForThisCreature(getTileProperty("food", self.NewLocation.x -1,self.NewLocation.y,ctx))
	local DownLeftFood = self:GetFoodLevelForThisCreature(getTileProperty("food", self.NewLocation.x -1,self.NewLocation.y + 1,ctx))
	local DownFood = self:GetFoodLevelForThisCreature(getTileProperty("food", self.NewLocation.x ,self.NewLocation.y + 1,ctx))
	local DownRightFood = self:GetFoodLevelForThisCreature(getTileProperty("food", self.NewLocation.x + 1,self.NewLocation.y + 1,ctx))
	local RightFood = self:GetFoodLevelForThisCreature(getTileProperty("food", self.NewLocation.x + 1,self.NewLocation.y,ctx))
	local UpRightFood = self:GetFoodLevelForThisCreature(getTileProperty("food", self.NewLocation.x + 1,self.NewLocation.y -1,ctx))
		

	--compair the cells grazing amount to the current cels grazing amount
	if CurrentFood > UpFood and 
		CurrentFood > UpLeftFood and 
		CurrentFood > LeftFood and
		CurrentFood > DownLeftFood and 
		CurrentFood > DownFood and 
		CurrentFood > DownRightFood and 
		CurrentFood > RightFood and 
		CurrentFood > UpRightFood then
		
		return Vector:new(0,0)
	
	end
	
	if UpFood > CurrentFood and 
		UpFood > UpLeftFood and 
		UpFood > LeftFood and 
		UpFood > DownLeftFood and 
		UpFood > DownFood and 
		UpFood > DownRightFood and 
		UpFood > RightFood and 
		UpFood > UpRightFood then
		
		return Vector:new(0,-1)
	
	end
	
	if UpLeftFood > CurrentFood and 
		UpLeftFood > UpFood and 
		UpLeftFood > LeftFood and 
		UpLeftFood > DownLeftFood and 
		UpLeftFood > DownFood and 
		UpLeftFood > DownRightFood and 
		UpLeftFood > RightFood and 
		UpLeftFood > UpRightFood then
		
		return Vector:new(-1,-1)
	
	end
	
	if LeftFood > CurrentFood and 
		LeftFood > UpFood and 
		LeftFood > UpLeftFood and 
		LeftFood > DownLeftFood and 
		LeftFood > DownFood and 
		LeftFood > DownRightFood and 
		LeftFood > RightFood and 
		LeftFood > UpRightFood then
		
		return Vector:new(-1,0)
	
	end
	
	if DownLeftFood > CurrentFood and 
		DownLeftFood > UpFood and 
		DownLeftFood > UpLeftFood and 
		DownLeftFood > LeftFood and 
		DownLeftFood > DownFood and 
		DownLeftFood > DownRightFood and 
		DownLeftFood > RightFood and 
		DownLeftFood > UpRightFood then
		
		return Vector:new(-1,1)
	
	end
	
	if DownFood > CurrentFood and 
		DownFood > UpFood and 
		DownFood > UpLeftFood and 
		DownFood > LeftFood and 
		DownFood > DownLeftFood and 
		DownFood > DownRightFood and 
		DownFood > RightFood and 
		DownFood > UpRightFood then
		
		return Vector:new(0,1)
	
	end
	
	if DownRightFood > CurrentFood and 
		DownLeftFood > UpFood and 
		DownLeftFood > UpLeftFood and 
		DownLeftFood > LeftFood and 
		DownLeftFood > DownLeftFood and 
		DownLeftFood > DownFood and 
		DownLeftFood > RightFood and 
		DownLeftFood > UpRightFood then
		
		return Vector:new(1,1)
	
	end
	
	if RightFood > CurrentFood and 
		RightFood > UpFood and 
		RightFood > UpLeftFood and 
		RightFood > LeftFood and 
		RightFood > DownLeftFood and 
		RightFood > DownFood and 
		RightFood > DownLeftFood and 
		RightFood > UpRightFood then
		
		return Vector:new(1,0)
	
	end
	
	if UpRightFood > CurrentFood and 
		UpRightFood > UpFood and 
		UpRightFood > UpLeftFood and 
		UpRightFood > LeftFood and 
		UpRightFood > DownLeftFood and 
		UpRightFood > DownFood and 
		UpRightFood > DownLeftFood and 
		UpRightFood > RightFood then
		
		return Vector:new(1,-1)
	
	end

end