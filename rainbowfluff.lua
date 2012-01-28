function rainbowFluff(love)
	local ctx={}
	ctx.map=maploader.load("testmap.tmx")

	function ctx.name (name, character) 
		--replacable with proper cache lookup later
		return ctx[name]
	end
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
	ctx.creatures = {}
	ctx.creatures[1] = Creature:new(1,1,1,1)

	function ctx:update (dt)
	
		local space = love.keyboard.isDown(" ")
		ctx=self
		ctx.mouse={x=love.mouse.getX()*ctx.camera.scale, y=love.mouse.getY()*ctx.camera.scale}
		ctx.flufft = ctx.flufft:newState(dt,ctx.flufft,{mouse=ctx.mouse,tiles=layer.tileData,map=map, key=space, mapproperties=ctx.mapproperties })
		--print("object")
		--print(DumpObject(ctx.mapproperties))
		ctx.creatures[1]:update(dt, ctx.creatures[1], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })

	end
	function ctx:draw ()
		map:setDrawRange(0, 0, ctx.camera.width, ctx.camera.height)
		map.drawList={map.drawList[1]}
		map:draw()
		drawlist( ctx.camera:newDrawable( ctx.creatures[1]:newDrawable()) )
		drawlist( ctx.camera:newDrawable( ctx.flufft:newDrawable()) )


	end

	return ctx
end
