require("middleclass.lua")
require ("Vector.lua")
require("functional.lua")
Creature = class("Creature")


function Creature:initialize(x,y,ctx,BigUpdatRate,Type,Lazyness,GrazingForceMultiplyer,RandomMovementMultiplyer,RedGroupingForce,YellowGroupingForce,PurpleGroupingForce,GroupForceMultiplyer)
	--the current location of the creature
	self.NewLocation = Vector:new(x,y)
	
	--the old location of the creature
	self.OldLocation = Vector:new(x,y)
	
	--smoothed position of the creature
	self.SmoothedLocation = Vector:new(x,y)
	
	--the time between big updates
	self.TimeBetweenBigUpdates = BigUpdatRate
	
	--the time since the last big update
	self.TimeSinceLastBigUpdate = math.random(0,BigUpdatRate)
	
	--the type of creature this creature is
	self.CreatureType = Type
	
	--this is how much the creature needs to move before it moves
	self.Lazyness = Lazyness
	--retuen constructed creature
	
	--occupy cell
	self:Move(ctx,Vector:new(0,0))
	
	--the forces that pull other creatures to this creature
	self.grazingForceMultiplyer = GrazingForceMultiplyer
	
	self.randomMovementMultiplyer = RandomMovementMultiplyer
	
	self.redGroupingForce = RedGroupingForce
	
	self.yellowGroupingForce = YellowGroupingForce
	
	self.purpleGroupingForce = PurpleGroupingForce
	
	self.groupForceMultiplyer = GroupForceMultiplyer
	
	return self
end

function Creature:update(dt,oldstate,ctx)
	--perform small update
	self:SmallUpdate()
	
	--check if big update is needed
	
	--update time since last big update
	
	
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
	local BigUpdatePercent = self.TimeSinceLastBigUpdate / self.TimeBetweenBigUpdates
	
	--cap update size
	if BigUpdatePercent > 1 then
		BigUpdatePercent = 1
	end
	
	self.SmoothedLocation.x = (self.NewLocation.x * BigUpdatePercent) + (self.OldLocation.x * (1- BigUpdatePercent))
	self.SmoothedLocation.y = (self.NewLocation.y * BigUpdatePercent) + (self.OldLocation.y * (1- BigUpdatePercent))
	
		--print("Im the rock and roll cloooooowwwwwnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn")
		--print(self.SmoothedLocation.x)
		--print(self.SmoothedLocation.y)
	
end

function Creature:BigUpdate(dt,oldstate,ctx)

	
	--get grazing direction
	local vecGrazing = self:Grazing(dt,oldstate,ctx)
	
	--get grouping direction
	local vecFlockingDirection = self:Grouping(ctx)
	
	--add some random movement 
	local vecRandomMovement = Vector:new(math.random(-1,1),math.random(-1,1))
	
	--compiled movement direction
	local vecPreGridAllineDirection = Vector:new(0,0)
	

	
	vecPreGridAllineDirection.x = vecPreGridAllineDirection.x + vecGrazing.x * self.grazingForceMultiplyer
	vecPreGridAllineDirection.y = vecPreGridAllineDirection.y + vecGrazing.y * self.grazingForceMultiplyer
	
	vecPreGridAllineDirection.x = vecPreGridAllineDirection.x + vecRandomMovement.x * self.randomMovementMultiplyer
	vecPreGridAllineDirection.y = vecPreGridAllineDirection.y + vecRandomMovement.y * self.randomMovementMultiplyer
	
	vecPreGridAllineDirection.x = vecPreGridAllineDirection.x + vecFlockingDirection.x * self.groupForceMultiplyer
	vecPreGridAllineDirection.y = vecPreGridAllineDirection.y + vecFlockingDirection.y  * self.groupForceMultiplyer
	
	--turn planed direction to grid locked direction
	local vecGridDirection = self:FinalMoveDirection(dt,oldstate,ctx,vecPreGridAllineDirection)
	
	--apply it to character
	self:Move(ctx,vecGridDirection)
	
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

--get the food level for this creature at this point
function Creature:GetFoodLevelForThisCreature(x,y,ctx)
	
	--check if there is food in this square
	
	--if this creature is a red creature
	if self.CreatureType == "Red" then
		if getTileProperty("RedFood",x,y,ctx,"RedPellets") ~= nil then
			
			return getTileProperty("RedFood",x,y,ctx,"RedPellets")
		end
	end
	
	--if this creature is a green creature
	--if self.CreatureType == "green" then 

	--end
	
	--if this creature is a blue creature
	--if self.CreatureType == "blue" then 

	--end
	
	return 0
	
end

-- get the direction the character wants to go to group better
-- this function returns flock gathering
function Creature:Grouping(ctx)
	
	--the vector to travle towards
	local vecGrouping = Vector:new(0,0)
	local vecFleeing = Vector:new(0,0)
	
	--number of objects to group with and to flee from
	local vecGroupCount = 0
	local vecFleeCount = 0
	
	--loop through the cells surounding the creature
	
	--the distance above and below the player to scan
	local ScanSize = 2
	
	local xOffset = 0
	local yOffset = 0
	
	local CellScanCount = 0
	
	--scann through cells
	yOffset = -ScanSize
	while yOffset < ScanSize +1 do
		xOffset = -ScanSize
		while xOffset < ScanSize +1 do
			
			--check if there is something to group towards
			if(getTileProperty("RedGroupForce", self.NewLocation.x + xOffset,self.NewLocation.y + yOffset,ctx,"Creatures") ~= nil) and 
				(getTileProperty("RedGroupForce", self.NewLocation.x + xOffset,self.NewLocation.y + yOffset,ctx,"Creatures") ~= 0)then
				
				--generate vector
				local vecGroupTargetVec = Vector:new(xOffset,yOffset)
				
				--get grouping force
				local fGroupingForce = getTileProperty("RedGroupForce", self.NewLocation.x + xOffset,self.NewLocation.y + yOffset,ctx,"Creatures")
				
				--include grouping force
				vecGroupTargetVec.x = vecGroupTargetVec.x * fGroupingForce
				vecGroupTargetVec.y = vecGroupTargetVec.y * fGroupingForce
				
				--add it to the grouping vector
				vecGrouping.x = vecGrouping.x + vecGroupTargetVec.x 
				vecGrouping.y = vecGrouping.y + vecGroupTargetVec.y
				
				--update the number of things to follow
				vecGroupCount = vecGroupCount + 1
				
			end
			--check if there is something to flee from
			
			--move on to next collumb
			xOffset = xOffset +1
		end
		
		--move on to next row
		yOffset = yOffset +1
	end
	
	if vecGroupCount == 0 then
		return vecGrouping
	end
	
	--calculate the final vector
	vecGrouping.x = vecGrouping.x / vecGroupCount
	vecGrouping.y = vecGrouping.y / vecGroupCount
	
	return vecGrouping
	
end

--this calculates the direction to flee
function Creature:FleeCalculations(ctx,vecFleeing)

end

function Creature:GatherCalculations(ctx,vecFleeing)

end

--Work out what direction the creature has decided to go in
function Creature:FinalMoveDirection(dt,oldstate,ctx,vecMoveDirectionVector)

--project movement vector onto each direction

--initalise all variables
--	local IsUpAvailable	= false       	|1|
--	local IsUpLeftAvailable = false		|1|	
--	local IsLeftAvailable = false		|1|
--	local IsDownLeftAvailable = false	|1|
--	local IsDownAvailable = false		|1|
--	local IsDownRighAvailable = false	|1|
--	local IsRightAvailable = false 		|1|
--	local IsUpRightAvailable = false	|1|

	availableDirections ={
		IsUpLeftAvailable = {-1, -1},
		IsUpAvailable = {0 , -1},
		IsUpRightAvailable = {1 , -1},
		IsLeftAvailable = {-1, 0},
		--{0 , 0}
		IsRightAvailable = {1 , 0},
		IsDownLeftAvailable = {-1, 1},
		IsDownAvailable = {0 , 1},
		IsDownRightAvailable = {1 , 1}
	}
	
	available = f_map(
	function(d)

		
	--	if d and d[0] and d[1] and self.NewLocation.x and self.NewLocation.y then
			if(
			getTileProperty("Obstacle", 
			self.NewLocation.x+d[1],
			self.NewLocation.y+d[2],
			ctx,"Ground") ~= 1 and 
			getTileProperty("HasCreature",
			self.NewLocation.x+d[1],
			self.NewLocation.y+d[2],
			ctx,"Creatures") ~= 1) then

			return true
			end
		--end
		print("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu")
		
		return false
		
		
	end,
	availableDirections)


	--get prefered game move
	
	local NoMoveWorth = self.Lazyness
	local UpMoveWorth = -9000
	local UpLeftMoveWorth = -9000
	local LeftMoveWorth = -9000
	local DownLeftMoveWorth = -9000
	local DownMoveWorth = -9000
	local DownRightMoveWorth = -9000
	local RightMoveWorth = -9000
	local UpRightMoveWorth = -9000
	
	--evaluate game moves
	
	if available.IsUpAvailable then
		--project move vector onto move direction
		UpMoveWorth = vecMoveDirectionVector:dot( Vector:new(0,-1))
	end
	
	if available.IsUpLeftAvailable then
	
		--project move vector onto move direction
		UpLeftMoveWorth = vecMoveDirectionVector:dot( Vector:new(-0.52,-0.52))
		
	end
	
	if available.IsLeftAvailable then
		--project move vector onto move direction
		LeftMoveWorth = vecMoveDirectionVector:dot( Vector:new(-1,0))
	end
	
	if available.IsDownLeftAvailable then
		--project move vector onto move direction
		DownLeftMoveWorth = vecMoveDirectionVector:dot( Vector:new(-0.52,0.52))

	end
	
	if available.IsDownAvailable then
		--project move vector onto move direction
		DownMoveWorth = vecMoveDirectionVector:dot( Vector:new(0,1))
		--print(DownMoveWorth)
	end
	
	if available.IsDownRightAvailable then
		--project move vector onto move direction
		DownRightMoveWorth = vecMoveDirectionVector:dot( Vector:new(0.52,0.52))
	end
	
	if available.IsRightAvailable then
		--project move vector onto move direction
		RightMoveWorth = vecMoveDirectionVector:dot( Vector:new(1,0))
	end
	
	if available.IsUpRightAvailable then
		--project move vector onto move direction
		UpRightMoveWorth = vecMoveDirectionVector:dot( Vector:new(0.52,-0.52))
	end
	
	--get best move
		--compair the cells grazing amount to the current cels grazing amount
	if NoMoveWorth >= UpMoveWorth and 
		NoMoveWorth >= UpLeftMoveWorth and 
		NoMoveWorth >= LeftMoveWorth and
		NoMoveWorth >= DownLeftMoveWorth and 
		NoMoveWorth >= DownMoveWorth and 
		NoMoveWorth >= DownRightMoveWorth and 
		NoMoveWorth >= RightMoveWorth and 
		NoMoveWorth >= UpRightMoveWorth then

		
		return Vector:new(0,0)
	
	end
	
	if UpMoveWorth >= NoMoveWorth and 
		UpMoveWorth >= UpLeftMoveWorth and 
		UpMoveWorth >= LeftMoveWorth and
		UpMoveWorth >= DownLeftMoveWorth and 
		UpMoveWorth >= DownMoveWorth and 
		UpMoveWorth >= DownRightMoveWorth and 
		UpMoveWorth >= RightMoveWorth and 
		UpMoveWorth >= UpRightMoveWorth then
		
				

		return Vector:new(0,-1)
	
	end
	
	if UpLeftMoveWorth >= NoMoveWorth and 
		UpLeftMoveWorth >= UpMoveWorth and 
		UpLeftMoveWorth >= LeftMoveWorth and
		UpLeftMoveWorth >= DownLeftMoveWorth and 
		UpLeftMoveWorth >= DownMoveWorth and 
		UpLeftMoveWorth >= DownRightMoveWorth and 
		UpLeftMoveWorth >= RightMoveWorth and 
		UpLeftMoveWorth >= UpRightMoveWorth then
		
		return Vector:new(-1,-1)
	
	end
	
	if LeftMoveWorth >= NoMoveWorth and 
		LeftMoveWorth >= UpMoveWorth and 
		LeftMoveWorth >= UpLeftMoveWorth and
		LeftMoveWorth >= DownLeftMoveWorth and 
		LeftMoveWorth >= DownMoveWorth and 
		LeftMoveWorth >= DownRightMoveWorth and 
		LeftMoveWorth >= RightMoveWorth and 
		LeftMoveWorth >= UpRightMoveWorth then
		
		return Vector:new(-1,0)
	
	end
	
	if DownLeftMoveWorth >= NoMoveWorth and 
		DownLeftMoveWorth >= UpMoveWorth and 
		DownLeftMoveWorth >= UpLeftMoveWorth and
		DownLeftMoveWorth >= LeftMoveWorth and 
		DownLeftMoveWorth >= DownMoveWorth and 
		DownLeftMoveWorth >= DownRightMoveWorth and 
		DownLeftMoveWorth >= RightMoveWorth and 
		DownLeftMoveWorth >= UpRightMoveWorth then
		
		return Vector:new(-1,1)
	
	end
	
	if DownMoveWorth >= NoMoveWorth and 
		DownMoveWorth >= UpMoveWorth and 
		DownMoveWorth >= UpLeftMoveWorth and
		DownMoveWorth >= LeftMoveWorth and 
		DownMoveWorth >= DownLeftMoveWorth and 
		DownMoveWorth >= DownRightMoveWorth and 
		DownMoveWorth >= RightMoveWorth and 
		DownMoveWorth >= UpRightMoveWorth then
		
		return Vector:new(0,1)
	
	end
	
	if DownRightMoveWorth >= NoMoveWorth and 
		DownRightMoveWorth >= UpMoveWorth and 
		DownRightMoveWorth >= UpLeftMoveWorth and
		DownRightMoveWorth >= LeftMoveWorth and 
		DownRightMoveWorth >= DownLeftMoveWorth and 
		DownRightMoveWorth >= DownMoveWorth and 
		DownRightMoveWorth >= RightMoveWorth and 
		DownRightMoveWorth >= UpRightMoveWorth then
		
		return Vector:new(1,1)
	
	end
	
	if RightMoveWorth >= NoMoveWorth and 
		RightMoveWorth >= UpMoveWorth and 
		RightMoveWorth >= UpLeftMoveWorth and
		RightMoveWorth >= LeftMoveWorth and 
		RightMoveWorth >= DownLeftMoveWorth and 
		RightMoveWorth >= DownMoveWorth and 
		RightMoveWorth >= DownRightMoveWorth and 
		RightMoveWorth >= UpRightMoveWorth then
		
		return Vector:new(1,0)
	
	end
	
	if UpRightMoveWorth >= NoMoveWorth and 
		UpRightMoveWorth >= UpMoveWorth and 
		UpRightMoveWorth >= UpLeftMoveWorth and
		UpRightMoveWorth >= LeftMoveWorth and 
		UpRightMoveWorth >= DownLeftMoveWorth and 
		UpRightMoveWorth >= DownMoveWorth and 
		UpRightMoveWorth >= DownRightMoveWorth and 
		UpRightMoveWorth >= RightMoveWorth then
		
		return Vector:new(1,-1)
	
	end
	
	return Vector:new(0,0)

end

--move the creature
function Creature:Move(ctx,vecMoveDirectionVector)
	--unmark current cell as ocupied
	setTileProperty("HasCreature",0, self.OldLocation.x,self.OldLocation.y ,ctx,"Creatures")
	
	--mark future cell as ocupied
	setTileProperty("HasCreature",1, self.NewLocation.x + vecMoveDirectionVector.x,self.NewLocation.y + vecMoveDirectionVector.y,ctx,"Creatures")
	
	--remove grouping forces
	setTileProperty("RedGroupForce",0, self.NewLocation.x,self.NewLocation.y ,ctx,"Creatures")
	setTileProperty("YellowGroupForce",0, self.NewLocation.x,self.NewLocation.y ,ctx,"Creatures")
	setTileProperty("PurpleGroupForce",0, self.NewLocation.x,self.NewLocation.y ,ctx,"Creatures")
	
	--add grouping forces
	if self.CreatureType == "Red" then
		setTileProperty("RedGroupForce",redGroupingForce, self.NewLocation.x,self.NewLocation.y ,ctx,"Creatures")
	end
	if self.CreatureType == "Yellow" then
		setTileProperty("YellowGroupForce",yellowGroupingForce, self.NewLocation.x,self.NewLocation.y ,ctx,"Creatures")
	end
	
	if self.CreatureType == "Purple" then
		setTileProperty("PurpleGroupForce",purpleGroupingForce, self.NewLocation.x,self.NewLocation.y ,ctx,"Creatures")
	end
	
	
	--apply new position to creature
	self.OldLocation.x = self.NewLocation.x
	self.OldLocation.y = self.NewLocation.y
	
	self.NewLocation.x =  self.NewLocation.x + vecMoveDirectionVector.x
	self.NewLocation.y =  self.NewLocation.y + vecMoveDirectionVector.y
	
	
end

--get the direction the character wants to go for more food
function Creature:Grazing(dt,oldstate,ctx)
	
	--create a movement vector
	local vecGrazingDirection = Vector:new(0,0)
	
	--get the food in the cells around the creature
	local CurrentFood = self:GetFoodLevelForThisCreature(self.NewLocation.x,self.NewLocation.y,ctx)
	local UpFood = self:GetFoodLevelForThisCreature(self.NewLocation.x,self.NewLocation.y -1,ctx)
	local UpLeftFood = self:GetFoodLevelForThisCreature(self.NewLocation.x -1,self.NewLocation.y -1,ctx)
	local LeftFood = self:GetFoodLevelForThisCreature(self.NewLocation.x -1,self.NewLocation.y,ctx)
	local DownLeftFood = self:GetFoodLevelForThisCreature(self.NewLocation.x -1,self.NewLocation.y + 1,ctx)
	local DownFood = self:GetFoodLevelForThisCreature(self.NewLocation.x ,self.NewLocation.y + 1,ctx)
	local DownRightFood = self:GetFoodLevelForThisCreature(self.NewLocation.x + 1,self.NewLocation.y + 1,ctx)
	local RightFood = self:GetFoodLevelForThisCreature(self.NewLocation.x + 1,self.NewLocation.y,ctx)
	local UpRightFood = self:GetFoodLevelForThisCreature(self.NewLocation.x + 1,self.NewLocation.y -1,ctx)
		
	print(DownLeftFood)

	--compair the cells grazing amount to the current cels grazing amount
	if CurrentFood >= UpFood and 
		CurrentFood >= UpLeftFood and 
		CurrentFood >= LeftFood and
		CurrentFood >= DownLeftFood and 
		CurrentFood >= DownFood and 
		CurrentFood >= DownRightFood and 
		CurrentFood >= RightFood and 
		CurrentFood >= UpRightFood then
		
		
		
		return Vector:new(0,0)
	
	end
	
	if UpFood >= CurrentFood and 
		UpFood >= UpLeftFood and 
		UpFood >= LeftFood and 
		UpFood >= DownLeftFood and 
		UpFood >= DownFood and 
		UpFood >= DownRightFood and 
		UpFood >= RightFood and 
		UpFood >= UpRightFood then
		
		return Vector:new(0,-1)
	
	end
	
	if UpLeftFood >= CurrentFood and 
		UpLeftFood >= UpFood and 
		UpLeftFood >= LeftFood and 
		UpLeftFood >= DownLeftFood and 
		UpLeftFood >= DownFood and 
		UpLeftFood >= DownRightFood and 
		UpLeftFood >= RightFood and 
		UpLeftFood >= UpRightFood then
		
		return Vector:new(-1,-1)
	
	end
	
	if LeftFood >= CurrentFood and 
		LeftFood >= UpFood and 
		LeftFood >= UpLeftFood and 
		LeftFood >= DownLeftFood and 
		LeftFood >= DownFood and 
		LeftFood >= DownRightFood and 
		LeftFood >= RightFood and 
		LeftFood >= UpRightFood then
		
		return Vector:new(-1,0)
	
	end
	
		
	if DownFood >= CurrentFood and 
		DownFood >= UpFood and 
		DownFood >= UpLeftFood and 
		DownFood >= LeftFood and 
		DownFood >= DownLeftFood and 
		DownFood >= DownRightFood and 
		DownFood >= RightFood and 
		DownFood >= UpRightFood then
		print("=========================================================================================================")
		return Vector:new(0,1)
	
	end
	
	if DownLeftFood >= CurrentFood and 
		DownLeftFood >= UpFood and 
		DownLeftFood >= UpLeftFood and 
		DownLeftFood >= LeftFood and 
		DownLeftFood >= DownFood and 
		DownLeftFood >= DownRightFood and 
		DownLeftFood >= RightFood and 
		DownLeftFood >= UpRightFood then
		print("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
		return Vector:new(-1,1)
	
	end

	
	if DownRightFood >= CurrentFood and 
		DownLeftFood >= UpFood and 
		DownLeftFood >= UpLeftFood and 
		DownLeftFood >= LeftFood and 
		DownLeftFood >= DownLeftFood and 
		DownLeftFood >= DownFood and 
		DownLeftFood >= RightFood and 
		DownLeftFood >= UpRightFood then
		
		return Vector:new(1,1)
	
	end
	
	if RightFood >= CurrentFood and 
		RightFood >= UpFood and 
		RightFood >= UpLeftFood and 
		RightFood >= LeftFood and 
		RightFood >= DownLeftFood and 
		RightFood >= DownFood and 
		RightFood >= DownLeftFood and 
		RightFood >= UpRightFood then
		
		return Vector:new(1,0)
	
	end
	
	if UpRightFood >= CurrentFood and 
		UpRightFood >= UpFood and 
		UpRightFood >= UpLeftFood and 
		UpRightFood >= LeftFood and 
		UpRightFood >= DownLeftFood and 
		UpRightFood >= DownFood and 
		UpRightFood >= DownLeftFood and 
		UpRightFood >= RightFood then
		
		return Vector:new(1,-1)
	
	end
	
	return Vector:new(0,0)

end