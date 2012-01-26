if( not _G.LUA_PATH) then 
  print ("LUA_PATH is empty. Will add something to it.")
  _G.LUA_PATH="/home/wendy/Documents/src/Eclipse/Workspace/LoveBallTentacles/?.lua"
  print("Now LUA_PATH is: " .. _G.LUA_PATH)
else  
  print("LUA_PATH is: " .. _G.LUA_PATH)
end
  
  
require( "MiddleClass" );
HasWings = { -- HasWings is a module, not a class. It can be "included" into classes
  fly = function(self)
    print('flap flap flap I am a ' .. self.class.name)
  end
}

Animal = class('Animal')

Insect = class('Insect', Animal) -- or Animal:subclass('Insect')

Worm = class('Worm', Insect) -- worms don't have wings

Bee = class('Bee', Insect)
Bee:include(HasWings) --Bees have wings. This adds fly() to Bee

Mammal = class('Mammal', Animal)

Fox = class('Fox', Mammal) -- foxes don't have wings, but are mammals

Bat = class('Bat', Mammal)
Bat:include(HasWings) --Bats have wings, too.

--[[
local bee = Bee() -- or Bee:new()
local bat = Bat() -- or Bat:new()
]]--

local bee = Bee:new()
local bat = Bat:new()

bee:fly()
bat:fly()

DrinksCoffee = {}

-- This is another valid way of declaring functions on a mixin.
-- Note that we are using the : operator, so there's an implicit self parameter
function DrinksCoffee:drink(drinkTime)
  if(drinkTime~=self.class.coffeeTime) then
    print(self.name .. ': It is not the time to drink coffee!')
  else
    print(self.name .. ': Mmm I love coffee at ' .. drinkTime)
  end
end

-- the included method is invoked every time DrinksCoffee is included on a class
-- notice that parameters can be passed around
function DrinksCoffee:included(klass)
  print(klass.name .. ' drinks coffee at ' .. klass.coffeeTime)
end

EnglishMan = class('EnglishMan')
EnglishMan.static.coffeeTime = 5
EnglishMan:include(DrinksCoffee)
function EnglishMan:initialize(name) 
	self.name = name 
end

Spaniard = class('Spaniard')
Spaniard.static.coffeeTime = 6
Spaniard:include(DrinksCoffee)
function Spaniard:initialize(name) 
	self.name = name 
end

local tom = EnglishMan:new('tom')
local juan = Spaniard:new('juan')

tom:drink(5)
juan:drink(5)
juan:drink(6)