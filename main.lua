-------------------------------------------------
-- LOVE: Passing Clouds Demo           								
-- Website: http://love.sourceforge.net			
-- Licence: ZLIB/libpng                									
-- Copyright (c) 2006-2009 LOVE Development Team
-------------------------------------------------
require("wendy_useful.lua")

-- --------------------
--functional utilities 
require("functional.lua")
--parametric animations
require("playhead.lua")
--initialise program
require("camera.lua")
require("planet.lua")
require("flufft.lua")
require("Gate.lua")
require("Tractor.lua")
require("dumpobject.lua")
require("printmap.lua")
require("Creature.lua")
require("rainbowfluff.lua")
--livecoding
require("livereload.lua")
--update loop
require("update.lua")
--draw loop
require("draw.lua")
--resourcedb
require("db.lua")
require("keyboard.lua")


Planet:load()

global = {}
global.limitDrawing = false		-- If true then the drawing range example is shown
global.benchmark = false   		-- If true the map is drawn 20 times instead of 1
global.useBatch = true     			-- If true then the layers are rendered with sprite batches
                           	
global.camera=Camera:new()


ctx = {} 

function love.load()



	--ctx=makeTestCTX(love)
	ctx = rainbowFluff(love,1)


	-- Setup

	--displayTime = 0 

	printmap("obstacle",ctx)
	--love.audio.play(music, 0)
	global.camera:pickmode()
	
end











