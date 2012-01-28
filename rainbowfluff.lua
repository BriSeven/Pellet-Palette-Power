function rainbowFluff(love,level)
	level = level or 1
	levels = {
		"testmap4.tmx"
	}
	local ctx={}
	ctx.map=maploader.load(levels[level])

	function ctx.name (name, character) 
		--replacable with proper cache lookup later
		return ctx[name]
	end
	layer = ctx.map.tl["Ground"] or {}
	ctx.tiles = layer.tileData or {}

	
	love.graphics.setColor(255, 255, 255, 255)


	ctx.love=love
	ctx.mapproperties={}
	ctx.body 	= love.graphics.newImage(db.name( "body" 	))
	ctx.ear  	= love.graphics.newImage(db.name( "ear"  	))
	ctx.face 	= love.graphics.newImage(db.name( "face" 	))
	ctx.logo 	= love.graphics.newImage(db.name( "logo" 	))
	ctx.cloud	= love.graphics.newImage(db.name( "cloud"	))
	ctx.map1    = ctx.map --change this somehow according to what level I've loaded



	
	ctx.flufft = Flufft:new()
	ctx.planet = Planet:new()
	ctx.creatures = {}
	ctx.creatures[1] = Creature:new(6,6,ctx,0.1,"Red",-0.1,5,0.5,1,1,1,1)
	ctx.creatures[2] = Creature:new(6,8,ctx,0.14,"Red",-0.1,5,0.5,1,1,1,1)
	ctx.creatures[3] = Creature:new(6,8,ctx,0.16,"Red",-0.1,5,0.5,1,1,1,1)
	ctx.creatures[4] = Creature:new(6,8,ctx,0.12,"Red",-0.1,5,0.5,1,1,1,1)
	ctx.creatures[5] = Creature:new(6,8,ctx,0.145,"Red",-0.1,5,0.5,1,1,1,1)
	ctx.creatures[6] = Creature:new(6,8,ctx,0.15,"Red",-0.1,5,0.5,1,1,1,1)
	
--	ctx.tractor = Tractor:new(9,10,ctx,0.15)
	ctx.tractor = Tractor:new(12,16,ctx)
	
	use_music=true
	local auBGM

	if use_music == true then
	--	auBGM = love.audio.newSource("sfx/bgm.wav")
	--	auBGM:setLooping(true)
	--	auBGM:setVolume(0.6)
	--	auBGM:play()
	end

	function ctx:update (dt,ctx)

		local space = love.keyboard.isDown(" ")
		ctx=self
		global.camera:newState(dt,global.camera,ctx)

		ctx.mouse={x=love.mouse.getX()/global.camera.zoom, y=love.mouse.getY()/global.camera.zoom}
		ctx.flufft = ctx.flufft:newState(dt,ctx.flufft,{mouse=ctx.mouse,tiles=layer.tileData,map=map, key=space, mapproperties=ctx.mapproperties })
		ctx.tractor = ctx.tractor:newState(dt,ctx.flufft,{mouse=ctx.mouse,tiles=layer.tileData,map=map, key=space, mapproperties=ctx.mapproperties })
		--print("object")
		--print(DumpObject(ctx.mapproperties))
		ctx.creatures[1]:update(dt, ctx.creatures[1], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[2]:update(dt, ctx.creatures[2], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[3]:update(dt, ctx.creatures[3], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[4]:update(dt, ctx.creatures[4], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[5]:update(dt, ctx.creatures[5], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[6]:update(dt, ctx.creatures[6], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })

	end
	function ctx:draw ()
		ctx=self
		
		drawlist( { 
			
		} )
		map:setDrawRange(0, 0, global.camera.width, global.camera.height)
		--map.drawList={map.drawList[1]}
		map:draw()

		drawlist( global.camera:newDrawable( ctx.creatures[1]:newDrawable()) )
		drawlist( global.camera:newDrawable( ctx.creatures[2]:newDrawable()) )
		drawlist( global.camera:newDrawable( ctx.creatures[3]:newDrawable()) )
		drawlist( global.camera:newDrawable( ctx.creatures[4]:newDrawable()) )
		drawlist( global.camera:newDrawable( ctx.creatures[5]:newDrawable()) )
		drawlist( global.camera:newDrawable( ctx.creatures[6]:newDrawable()) )

		drawlist( global.camera:newDrawable( ctx.flufft:newDrawable()) )
		drawlist( global.camera:newDrawable( ctx.tractor:newDrawable()) )
		drawlist( {{ 
		 type="map",
		 name="map1",  --center and scale should be camera and db responsibilities
		 character="game",
		 x=0,
		 y=0,     --x and y assuming 800x600 screen
		 a=0,
		 sx=1,
		 sy=1,
		 cx=0,
		 cy=0
	
		} })


		drawlist( ctx.creatures[1]:newDrawable() )
		drawlist( ctx.creatures[2]:newDrawable() )
		drawlist( ctx.creatures[3]:newDrawable() )
		drawlist( ctx.creatures[4]:newDrawable() )
		drawlist( ctx.creatures[5]:newDrawable() )
		drawlist( ctx.creatures[6]:newDrawable() )

		drawlist( ctx.flufft:newDrawable() )


	end
	local updatef
	function ctx:stop ()
	  	self.paused = true 
	  	updatef=self.update 
	  	self.update=function () end 
	--	auBGM:stop()
	end
	function ctx:resume()
		self.paused = false 
		self.update=updatef
	end 
	return ctx
end
