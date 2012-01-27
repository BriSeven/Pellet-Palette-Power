
function love.update(dt)

     	livereload("draw.lua")
     	livereload("flufft.lua")
     	collectgarbage("collect")
     	
-- --	ctx.physics:updateWorld(dt) --this puts the world into motion
--   	g_physics:updateWorld(dt) --this puts the world into motion
     	
-- --todo: Make this not care about which context we're updating. 
-- --context should have its own update function called from here.
	local tiles = {
		map.tiles[layer.tileData[ctx.flufft.y-1][ctx.flufft.x-1]],
		map.tiles[layer.tileData[ctx.flufft.y-1][ctx.flufft.x]],  		
		map.tiles[layer.tileData[ctx.flufft.y-1][ctx.flufft.x+1]],		
		map.tiles[layer.tileData[ctx.flufft.y][ctx.flufft.x-1]],
		map.tiles[layer.tileData[ctx.flufft.y][ctx.flufft.x]],
		map.tiles[layer.tileData[ctx.flufft.y][ctx.flufft.x+1]],
		map.tiles[layer.tileData[ctx.flufft.y+1][ctx.flufft.x-1]],
		map.tiles[layer.tileData[ctx.flufft.y+1][ctx.flufft.x]],
		map.tiles[layer.tileData[ctx.flufft.y+1][ctx.flufft.x+1]],
	}

  	ctx.mouse={x=love.mouse.getX()/ctx.camera.scale, y=love.mouse.getY()/ctx.camera.scale}
  	ctx.tiles=tiles
  	
--	clock=clock+dt

ctx.flufft = ctx.flufft:newState(dt,ctx.flufft,{mouse=ctx.mouse})
--	ctx.ballochan = ctx.ballochan:newState(dt,ctx.nekochan,{mouse=ctx.mouse})
  	--ctx.camera = ctx.camera:newState(dt)
  	--mag:update(dt)
  	-- if  clock%0.2 == 0.1  then
  	--	if ph._started then 
  	--		ph:stop()
  	--		print("stop")

	--	end
	-- else 
	--	if(not ph._started) then 
	--		ph:start()
	--		print("start")
	--	end 
	-- end
	--t=ph:time()
	--print(t)

	--mag.a=t*0.003;
	-- Update clouds.
	-- ctx.clouds:try_spawn_cloud(dt)

	-- ctx.clouds=ctx.clouds:newState(dt,ctx.clouds)



	
end