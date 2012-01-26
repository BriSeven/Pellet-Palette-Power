require("MiddleClass.lua")
require("wendy_useful.lua")
-- See https://love2d.org/forums/viewtopic.php?f=5&t=1053

-- Singleton -- 

local private = {}

Singleton = {
  included=function(class)
  print("In Singleton included... class is: " .. tostring(class) )
    print_table(class)
    private[class] = { instance = class:new() }
--	private[class] = { instance = "fred" }       
    print("private[class]: " .. tostring(private[class]))
    print("print_table(private[class]): ")
    print_table(private[class])
--    print(private[class])
  end
}

function Singleton:getInstance()
    print("print_table(private[self]):")
    print_table(private[self])
  return private[self].instance
end

--function Singleton:new()
--	print("wsl todo: fix this nasty hack!")
----  error("Object creation is forbidden on singletons") --wsl todo: fix this nasty hack!
--end

