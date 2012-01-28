require("camera.lua")
require("planet.lua")
require("flufft.lua")
require("dumpfile.lua")
require("printmap.lua")
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

function rainbowFluff(love)
	local ctx={}
	ctx.map=maploader.load("desert.tmx")

	function ctx.name (name, character) 
		--replacable with proper cache lookup later
		return ctx[name]
	end
	ctx.map=maploader.load("desert.tmx")
	layer = ctx.map.tl["Ground"] or {}
	ctx.tiles = layer.tileData or {}


	love.graphics.setColor(255, 255, 255, 200)


	ctx.love=love
	ctx.mapproperties={}
	ctx.body   	= love.graphics.newImage(db.name( "body"   	))
	ctx.ear    	= love.graphics.newImage(db.name( "ear"    	))
	ctx.face   	= love.graphics.newImage(db.name( "face"   	))
	ctx.logo   	= love.graphics.newImage(db.name( "logo"   	))
	ctx.cloud  	= love.graphics.newImage(db.name( "cloud"  	))
	ctx.selfmag	= love.graphics.newImage(db.name( "selfmag"	))

	ctx.flufft = Flufft:new()
	ctx.planet = Planet:new()
	ctx.camera= Camera:new(ctx)
	

	function ctx:update (dt)
		local space = love.keyboard.isDown(" ")
		ctx=self
		ctx.mouse={x=love.mouse.getX()*ctx.camera.scale, y=love.mouse.getY()*ctx.camera.scale}
		ctx.flufft = ctx.flufft:newState(dt,ctx.flufft,{mouse=ctx.mouse,tiles=layer.tileData,map=map, key=space, mapproperties=ctx.mapproperties })
		print("object")
		print(DumpObject(ctx.mapproperties))

	end
	function ctx:draw ()
		map:setDrawRange(0, 0, ctx.camera.width, ctx.camera.height)
		map.drawList={map.drawList[1]}
		map:draw()
		drawlist( ctx.camera:newDrawable( ctx.flufft:newDrawable() ) )

	end

	return ctx
end
