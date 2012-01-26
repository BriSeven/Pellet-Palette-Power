
function love.update(dt)

	livereload("draw.lua")
	livereload("nekochan.lua")
	collectgarbage("collect")
	
	ctx.physics:updateWorld(dt) --this puts the world into motion


	ctx.mouse={x=love.mouse.getX()/pixelsize/scale, y=love.mouse.getY()/pixelsize/scale}
	clock=clock+dt

	ctx.nekochan = ctx.nekochan:newState(dt,ctx.nekochan,{mouse=ctx.mouse})
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
	ctx.clouds:try_spawn_cloud(dt)

	ctx.clouds=ctx.clouds:newState(dt,ctx.clouds)



	
end