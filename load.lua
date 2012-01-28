require("camera.lua")
require("planet.lua")
require("flufft.lua")
require("dumpfile.lua")
require("printmap.lua")
require("Creature.lua")
require("rainbowfluff.lua")
Planet:load()

global = {}
global.limitDrawing = false		-- If true then the drawing range example is shown
global.benchmark = false   		-- If true the map is drawn 20 times instead of 1
global.useBatch = false    			-- If true then the layers are rendered with sprite batches
global.tx = 0              					-- X translation of the screen
global.ty = 0              					-- Y translation of the screen
global.scale = 1           	


ctx = {} 

function love.load()



	--ctx=makeTestCTX(love)
	ctx = rainbowFluff(love)


	-- Setup

	--displayTime = 0 


	printmap("obstacle",ctx)
	--love.audio.play(music, 0)
	pickmode()
	
end

