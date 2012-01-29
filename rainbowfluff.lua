function rainbowFluff(love,level)
	level = level or 1
	levels = {
		"PPPLevel2.tmx"
	}
	local ctx={}
	ctx.map=maploader.load(levels[level])

	
	--function SpawnScan(ctx)
	--	
	--	print("11111111111111111111111ffffffffffffff")
	--	
	--	--return
	--			
	--	ctx.creatures = {}   
	--	
	--	local CreatureNumber = 0
	--	
	--	local MaxX = 50 --ctx.map.tileWidth
	--	local Maxy = 50 --ctx.map.tileHeight
	--	
	--	local x = 0
	--	local y = 0
	--	
	--	local CellScanCount = 0
	--	
	--	--scann through cells
	--	
	--	while y < Maxy  do
	--	
	--		x = 0
	--		while x < MaxX  do
	--	
	--			--get this cells spawn code
	--			local SpawnCode = getTileProperty("SpawnCode",x,y,ctx,"Creatures") 
	--			
	--			if SpawnCode ~= 0 then
	--				
	--				--get rid of spawn icon
	--				--setTileGraphic("Creatures",0,x,y,ctx)
	--				
	--				if(SpawnCode == 1) then
	--				
	--					CreatureNumber = CreatureNumber + 1
	--					
	--					
	--					
	--					ctx.creatures[CreatureNumber] =  Creature:new(x + 1,y + 1,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)
 	--				
	--				end
	--				
	--				if(SpawnCode == 2) then
	--					
	--					CreatureNumber = CreatureNumber + 1
	--					print("rrrrrrrrrrreeeeddddddsd sssssssssssssssssssssspawwwnnnnnnnnnnn", x,y)
	--					ctx.creatures[CreatureNumber] = Creature:new(x + 1,y + 1,ctx,0.3,"Purple",-0.1,1,3,1,-10,1,-10,2)
	--					
	--				end
	--				
	--				if(SpawnCode == 3) then
	--				
	--					CreatureNumber = CreatureNumber + 1
    --
	--					ctx.creatures[CreatureNumber] =  Creature:new(x + 1,y + 1,ctx,0.3,"Yellow",-0.1,1,3,1,-10,-10,1,2)
	--					
	--				end
	--				
	--			end
    --
	--			--move on to next collumb
	--			x = x +1
	--		end
	--		
	--		--move on to next row
	--		y = y +1
	--	end
	--		
	--end
	--
	--function UpdateScan(ctx,layer,map,dt)
	--
	--	print("222222222222222222222222fffffffffffff")
	--	--return
	--	
	--	--ctx.creatures = {}   
	--	
	--	local CreatureNumber = 0
	--	
	--	local MaxX = 50 --ctx.map.tileWidth
	--	local Maxy = 50 --ctx.map.tileHeight
	--	
	--	local x = 0
	--	local y = 0
	--	
	--	local CellScanCount = 0
	--	
	--	--scann through cells
	--	
	--	while y < Maxy  do
	--	
	--		x = 0
	--		while x < MaxX  do
	--	
	--			--get this cells spawn code
	--			local SpawnCode = getTileProperty("SpawnCode",x,y,ctx,"Creatures") 
	--			
	--			if SpawnCode ~= 0 then
	--				
	--				--get rid of spawn icon
	--				--setTileGraphic("Creatures",0,x,y,ctx)
	--				
	--				if(SpawnCode == 1) then
	--				
	--					CreatureNumber = CreatureNumber + 1
	--					
	--					ctx.creatures[CreatureNumber]:update(dt, ctx.creatures[CreatureNumber], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
 	--				
	--				end
	--				
	--				if(SpawnCode == 2) then
	--					
	--					CreatureNumber = CreatureNumber + 1
    --
	--					ctx.creatures[CreatureNumber]:update(dt, ctx.creatures[CreatureNumber], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
	--					
	--				end
	--				
	--				if(SpawnCode == 3) then
	--				
	--					CreatureNumber = CreatureNumber + 1
    --
	--					ctx.creatures[CreatureNumber]:update(dt, ctx.creatures[CreatureNumber], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
	--					
	--				end
	--				
	--			end
	--			
	--			
	--			
	--			--move on to next collumb
	--			x = x +1
	--		end
	--		
	--		--move on to next row
	--		y = y +1
	--	end
	--	
	--end
	--
	--function DrawScan(drawlist,ctx)
	--
	--	print("3333333333333333333333333333ffff")
	--	
	--	--return
	--	
	--	--ctx.creatures = {}   
	--	
	--	local CreatureNumber = 0
	--	
	--	local MaxX = 50 --ctx.map.tileWidth
	--	local Maxy = 50 --ctx.map.tileHeight
	--	
	--	local x = 0
	--	local y = 0
	--	
	--	local CellScanCount = 0
	--	
	--	--scann through cells
	--	
	--	while y < Maxy  do
	--	
	--		x = 0
	--		while x < MaxX  do
	--	
	--			--get this cells spawn code
	--			local SpawnCode = getTileProperty("SpawnCode",x,y,ctx,"Creatures") 
	--			
	--			if SpawnCode ~= 0 then
	--				
	--				--get rid of spawn icon
	--				setTileGraphic("Creatures",0,x + 0,y + 0,ctx)
	--				
	--				if(SpawnCode == 1) then
	--				
	--					CreatureNumber = CreatureNumber + 1
    --
	--					drawlist( ctx.creatures[CreatureNumber]:newDrawable()) 
 	--				
	--				end
	--				
	--				if(SpawnCode == 2) then
	--					
	--					CreatureNumber = CreatureNumber + 1
    --
	--					drawlist( ctx.creatures[CreatureNumber]:newDrawable()) 
	--					
	--				end
	--				
	--				if(SpawnCode == 3) then
	--				
	--					CreatureNumber = CreatureNumber + 1
    --
	--					drawlist( ctx.creatures[CreatureNumber]:newDrawable()) 
	--					
	--				end
	--				
	--			end
	--			
	--			
	--			
	--			--move on to next collumb
	--			x = x +1
	--		end
	--		
	--		--move on to next row
	--		y = y +1
	--	end
	--
	--end
	
	function ctx.name (name, character) 
		if character == "Yellow" or character == "Red" or character == "Purple" then 
			return ctx[character]
		else 
		--replacable with proper cache lookup later
		return ctx[name]
	    end
	end
	layer = ctx.map.tl["Ground"] or {}
	ctx.tiles = layer.tileData or {}

	print(DumpObject(ctx.map.tilesets))
	function ctx.quad(name, character) 
		return ctx.quads[name]
	end
	

	love.graphics.setColor(255, 255, 255, 200)


	ctx.love=love
	ctx.mapproperties={}
	ctx.body 	= love.graphics.newImage(db.name( "body" 	))
	ctx.ear  	= love.graphics.newImage(db.name( "ear"  	))
	ctx.face 	= love.graphics.newImage(db.name( "face" 	))
	ctx.logo 	= love.graphics.newImage(db.name( "logo" 	))
	ctx.cloud	= love.graphics.newImage(db.name( "cloud"	))
	         	ctx.background                           	= love.graphics.newImage(db.name( "background"	))

	ctx.map1    = ctx.map --change this somehow according to what level I've loaded
	
	ctx.Yellow =  love.graphics.newImage(db.name("yellow").image )
	ctx.Purple =  love.graphics.newImage(db.name("purple").image )
	ctx.Red =  love.graphics.newImage(db.name("red").image )
	ctx.quads = {
		walk1 = love.graphics.newQuad(0,0,32,32,128,32),
		walk2 = love.graphics.newQuad(32,0,32,32,128,32),
		walk3 = love.graphics.newQuad(64,0,32,32,128,32),
		walk4 = love.graphics.newQuad(96,0,32,32,128,32),
	}


	ctx.flufft = Flufft:new()
	ctx.planet = Planet:new()
	ctx.camera= Camera:new(ctx)
	-- start out in mouse-mode. Can switch between mouse and keyboard controls using the 'm' and 'k' keys. 
	ctx.use_mouse = true 
	
	
	ctx.creatures = {}                                                 
	ctx.creatures[1] =  Creature:new(15,15,ctx,0.60,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[2] =  Creature:new(15,15,ctx,0.61,"Red",0.1,1,3,1,1,-10,-10,2) 
	ctx.creatures[3] =  Creature:new(15,15,ctx,0.62,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[4] =  Creature:new(15,15,ctx,0.63,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[5] =  Creature:new(15,15,ctx,0.64,"Red",0.1,1,3,1,1,-10,-10,2)
                                                 
	ctx.creatures[6] =  Creature:new(15,15,ctx,0.66,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[7] =  Creature:new(15,15,ctx,0.67,"Red",0.1,1,3,1,1,-10,-10,2) 
	ctx.creatures[8] =  Creature:new(15,15,ctx,0.68,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[9] =  Creature:new(15,15,ctx,0.69,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[10] = Creature:new(15,15,ctx,0.60,"Red",0.1,1,3,1,1,-10,-10,2)	

	ctx.creatures[11] = Creature:new(35,15,ctx,0.60,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[12] = Creature:new(35,15,ctx,0.61,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[13] = Creature:new(35,15,ctx,0.62,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[14] = Creature:new(35,15,ctx,0.63,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[15] = Creature:new(35,15,ctx,0.64,"Purple",0.1,1,3,1,-10,-10,1,2)

	ctx.creatures[16] = Creature:new(35,15,ctx,0.66,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[17] = Creature:new(35,15,ctx,0.67,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[18] = Creature:new(35,15,ctx,0.68,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[19] = Creature:new(35,15,ctx,0.69,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[20] = Creature:new(35,15,ctx,0.60,"Purple",0.1,1,3,1,-10,-10,1,2)
	
	
	ctx.creatures[21] = Creature:new(25,35,ctx,0.60,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[22] = Creature:new(25,35,ctx,0.61,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[23] = Creature:new(25,35,ctx,0.62,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[24] = Creature:new(25,35,ctx,0.63,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[25] = Creature:new(25,35,ctx,0.64,"Yellow",0.1,1,3,1,-10,1,-10,2)
	                            
	ctx.creatures[26] = Creature:new(25,35,ctx,0.66,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[27] = Creature:new(25,35,ctx,0.67,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[28] = Creature:new(25,35,ctx,0.68,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[29] = Creature:new(25,35,ctx,0.69,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[30] = Creature:new(25,35,ctx,0.60,"Yellow",0.1,1,3,1,-10,1,-10,2)
	                                            
	ctx.creatures[31] = Creature:new(15,15,ctx,0.60,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[32] = Creature:new(15,15,ctx,0.61,"Red",0.1,1,3,1,1,-10,-10,2) 
	ctx.creatures[33] = Creature:new(15,15,ctx,0.62,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[34] = Creature:new(15,15,ctx,0.63,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[35] = Creature:new(15,15,ctx,0.64,"Red",0.1,1,3,1,1,-10,-10,2)
                                                 
	ctx.creatures[36] = Creature:new(15,15,ctx,0.66,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[37] = Creature:new(15,15,ctx,0.67,"Red",0.1,1,3,1,1,-10,-10,2) 
	ctx.creatures[38] = Creature:new(15,15,ctx,0.68,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[39] = Creature:new(15,15,ctx,0.69,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[40] = Creature:new(15,15,ctx,0.50,"Red",0.1,1,3,1,1,-10,-10,2)	
	
	
	ctx.creatures[41] = Creature:new(35,15,ctx,0.60,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[42] = Creature:new(35,15,ctx,0.61,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[43] = Creature:new(35,15,ctx,0.62,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[44] = Creature:new(35,15,ctx,0.63,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[45] = Creature:new(35,15,ctx,0.64,"Purple",0.1,1,3,1,-10,-10,1,2)
	                                             
	ctx.creatures[46] = Creature:new(35,15,ctx,0.66,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[47] = Creature:new(35,15,ctx,0.67,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[48] = Creature:new(35,15,ctx,0.68,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[49] = Creature:new(35,15,ctx,0.69,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[50] = Creature:new(35,15,ctx,0.60,"Purple",0.1,1,3,1,-10,-10,1,2)

	ctx.creatures[51] = Creature:new(25,35,ctx,0.60,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[52] = Creature:new(25,35,ctx,0.61,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[53] = Creature:new(25,35,ctx,0.62,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[54] = Creature:new(25,35,ctx,0.63,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[55] = Creature:new(25,35,ctx,0.64,"Yellow",0.1,1,3,1,-10,1,-10,2)
	                                             
	ctx.creatures[56] = Creature:new(25,35,ctx,0.66,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[57] = Creature:new(25,35,ctx,0.67,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[58] = Creature:new(25,35,ctx,0.68,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[59] = Creature:new(25,35,ctx,0.69,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[60] = Creature:new(25,35,ctx,0.60,"Yellow",0.1,1,3,1,-10,1,-10,2)
	   ctx.gates = {}
   ctx.gates[1] = Gate:new(true, 6,6,ctx)
   ctx.gates[2] = Gate:new(true, 16,6,ctx)
   
   ctx.tractor = Tractor:new(12,16,ctx)     
	                                                             

	use_music=true
	local auBGM

	if use_music == true then
	--	auBGM = love.audio.newSource("sfx/bgm.wav")
	--	auBGM:setLooping(true)
	--	auBGM:setVolume(0.6)
	end
	
	-- start out in mouse-mode. Can switch between mouse and keyboard controls using the 'm' and 'k' keys. 
	ctx.use_mouse = true 

	function ctx:update (dt,ctx)

		
		
		local space = love.keyboard.isDown(" ")
		ctx=self
		ctx.mouse={x=love.mouse.getX()/global.camera.zoom, y=love.mouse.getY()/global.camera.zoom}
		ctx.keyboard={up=love.keyboard.isDown("w"), left=love.keyboard.isDown("a"), down=love.keyboard.isDown("s"), right=love.keyboard.isDown("d")}
		ctx.flufft = ctx.flufft:newState(dt,ctx.flufft,{mouse=ctx.mouse,tiles=layer.tileData,map=map, key=space, mapproperties=ctx.mapproperties })

		ctx.creatures[1]:update(dt, ctx.creatures[1], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[2]:update(dt, ctx.creatures[2], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[3]:update(dt, ctx.creatures[3], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[4]:update(dt, ctx.creatures[4], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[5]:update(dt, ctx.creatures[5], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[6]:update(dt, ctx.creatures[6], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[7]:update(dt, ctx.creatures[7], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[8]:update(dt, ctx.creatures[8], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[9]:update(dt, ctx.creatures[9], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[10]:update(dt, ctx.creatures[10], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[11]:update(dt, ctx.creatures[11], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[12]:update(dt, ctx.creatures[12], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[13]:update(dt, ctx.creatures[13], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[14]:update(dt, ctx.creatures[14], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[15]:update(dt, ctx.creatures[15], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[16]:update(dt, ctx.creatures[16], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[17]:update(dt, ctx.creatures[17], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[18]:update(dt, ctx.creatures[18], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[19]:update(dt, ctx.creatures[19], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[20]:update(dt, ctx.creatures[20], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[21]:update(dt, ctx.creatures[21], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[22]:update(dt, ctx.creatures[22], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[23]:update(dt, ctx.creatures[23], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[24]:update(dt, ctx.creatures[24], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[25]:update(dt, ctx.creatures[25], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[26]:update(dt, ctx.creatures[26], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[27]:update(dt, ctx.creatures[27], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[28]:update(dt, ctx.creatures[28], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[29]:update(dt, ctx.creatures[29], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[30]:update(dt, ctx.creatures[30], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[31]:update(dt, ctx.creatures[31], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[32]:update(dt, ctx.creatures[32], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[33]:update(dt, ctx.creatures[33], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[34]:update(dt, ctx.creatures[34], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[35]:update(dt, ctx.creatures[35], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[36]:update(dt, ctx.creatures[36], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[37]:update(dt, ctx.creatures[37], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[38]:update(dt, ctx.creatures[38], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[39]:update(dt, ctx.creatures[39], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[40]:update(dt, ctx.creatures[40], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[41]:update(dt, ctx.creatures[41], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[42]:update(dt, ctx.creatures[42], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[43]:update(dt, ctx.creatures[43], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[44]:update(dt, ctx.creatures[44], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[45]:update(dt, ctx.creatures[45], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[46]:update(dt, ctx.creatures[46], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[47]:update(dt, ctx.creatures[47], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[48]:update(dt, ctx.creatures[48], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[49]:update(dt, ctx.creatures[49], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[50]:update(dt, ctx.creatures[50], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[51]:update(dt, ctx.creatures[51], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[52]:update(dt, ctx.creatures[52], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[53]:update(dt, ctx.creatures[53], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[54]:update(dt, ctx.creatures[54], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[55]:update(dt, ctx.creatures[55], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[56]:update(dt, ctx.creatures[56], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[57]:update(dt, ctx.creatures[57], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[58]:update(dt, ctx.creatures[58], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[59]:update(dt, ctx.creatures[59], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[60]:update(dt, ctx.creatures[60], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })




		ctx.tractor:newState(dt, ctx.tractor, {use_mouse=ctx.use_mouse, keyboard=ctx.keyboard, mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		
	end
	
	
	
	
	
	
	
	function ctx:draw ()
		ctx=self
				drawlist({{ name="background", character="background",x=0,y=0,sx=1,yx=1,cx=0,cy=0,a=0 }})


		drawlist({ {type="map", ref=map}})
		
		
		--DrawScan(drawlist,ctx)
		drawlist( ctx.creatures[1]:newDrawable()) 
		drawlist( ctx.creatures[2]:newDrawable()) 
		drawlist( ctx.creatures[3]:newDrawable()) 
		drawlist( ctx.creatures[4]:newDrawable()) 
		drawlist( ctx.creatures[5]:newDrawable()) 
		drawlist( ctx.creatures[6]:newDrawable()) 
		drawlist( ctx.creatures[7]:newDrawable())
		drawlist( ctx.creatures[8]:newDrawable())
		drawlist( ctx.creatures[9]:newDrawable())
		drawlist( ctx.creatures[10]:newDrawable())
		drawlist( ctx.creatures[11]:newDrawable()) 
		drawlist( ctx.creatures[12]:newDrawable())
		drawlist( ctx.creatures[13]:newDrawable())
		drawlist( ctx.creatures[14]:newDrawable())
		drawlist( ctx.creatures[15]:newDrawable())
		drawlist( ctx.creatures[16]:newDrawable()) 
		drawlist( ctx.creatures[17]:newDrawable()) 
		drawlist( ctx.creatures[18]:newDrawable()) 
		drawlist( ctx.creatures[19]:newDrawable()) 
		drawlist( ctx.creatures[20]:newDrawable()) 
		drawlist( ctx.creatures[21]:newDrawable()) 
		drawlist( ctx.creatures[22]:newDrawable())
		drawlist( ctx.creatures[23]:newDrawable())
		drawlist( ctx.creatures[24]:newDrawable())
		drawlist( ctx.creatures[25]:newDrawable())
		drawlist( ctx.creatures[26]:newDrawable()) 
		drawlist( ctx.creatures[27]:newDrawable())
		drawlist( ctx.creatures[28]:newDrawable())
		drawlist( ctx.creatures[29]:newDrawable())
		drawlist( ctx.creatures[30]:newDrawable())
		drawlist( ctx.creatures[31]:newDrawable()) 
		drawlist( ctx.creatures[32]:newDrawable()) 
		drawlist( ctx.creatures[33]:newDrawable()) 
		drawlist( ctx.creatures[34]:newDrawable()) 
		drawlist( ctx.creatures[35]:newDrawable()) 
		drawlist( ctx.creatures[36]:newDrawable()) 
		drawlist( ctx.creatures[37]:newDrawable())
		drawlist( ctx.creatures[38]:newDrawable())
		drawlist( ctx.creatures[39]:newDrawable())
		drawlist( ctx.creatures[40]:newDrawable())
		drawlist( ctx.creatures[41]:newDrawable()) 
		drawlist( ctx.creatures[42]:newDrawable())
		drawlist( ctx.creatures[43]:newDrawable())
		drawlist( ctx.creatures[44]:newDrawable())
		drawlist( ctx.creatures[45]:newDrawable())
		drawlist( ctx.creatures[46]:newDrawable()) 
		drawlist( ctx.creatures[47]:newDrawable()) 
		drawlist( ctx.creatures[48]:newDrawable()) 
		drawlist( ctx.creatures[49]:newDrawable()) 
		drawlist( ctx.creatures[50]:newDrawable()) 
		drawlist( ctx.creatures[51]:newDrawable()) 
		drawlist( ctx.creatures[52]:newDrawable())
		drawlist( ctx.creatures[53]:newDrawable())
		drawlist( ctx.creatures[54]:newDrawable())
		drawlist( ctx.creatures[55]:newDrawable())
		drawlist( ctx.creatures[56]:newDrawable()) 
		drawlist( ctx.creatures[57]:newDrawable())
		drawlist( ctx.creatures[58]:newDrawable())
		drawlist( ctx.creatures[59]:newDrawable())
		drawlist( ctx.creatures[60]:newDrawable())


		drawlist( ctx.tractor:newDrawable() )


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
