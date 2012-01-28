require("MiddleClass.lua")
require("wendy_useful.lua")
-- See https://love2d.org/forums/viewtopic.php?f=5&t=1053

-- Singleton -- 

local private = {}

Singleton = {
  included=function(class)
  ("In Singleton included... class is: " .. tostring(class) )
    _table(class)
    private[class] = { instance = class:new() }
--	private[class] = { instance = "fred" }       
    ("private[class]: " .. tostring(private[class]))
    ("_table(private[class]): ")
    _table(private[class])
--    (private[class])
  end
}

function Singleton:getInstance()
    ("_table(private[self]):")
    _table(private[self])
  return private[self].instance
end

--function Singleton:new()
--	("wsl todo: fix this nasty hack!")
----  error("Object creation is forbidden on singletons") --wsl todo: fix this nasty hack!
--end

