


function love.draw()
	if ctx.draw then
		ctx:draw()
	end 
	
end
function drawmap(mapobj,mapref) 
	 --map.useSpriteBatch = true
	 --map:setDrawRange(0, 0, global.camera.width/0.5, global.camera.height/0.5)
		--map.drawList={map.drawList[1]}
	mapref:draw()
	-- -- Scale and translate the game screen for map drawing
	-- local ftx, fty = math.floor(global.tx), math.floor(global.ty)
	-- love.graphics.push()
	-- love.graphics.scale(global.scale)
	-- love.graphics.translate(ftx, fty)
	
	-- -- Limit the draw range 
	-- if global.limitDrawing then 
	--	map:autoDrawRange(ftx, fty, global.scale, -100) 
	-- else 
	--	map:autoDrawRange(ftx, fty, global.scale, 50) 
	-- end
	
	-- -- Queue our guy to be drawn after the tile he's on and then draw the map.
	-- local maxDraw = global.benchmark and 20 or 1
	-- for i=1,maxDraw do 
	--	map:draw() 
	-- end
	-- love.graphics.rectangle("line", map:getDrawRange())
	
	-- -- Reset the scale and translation.
	-- love.graphics.pop()
	
end

function drawlist (list) --add a camera parameter
     love.graphics.push()
	 love.graphics.scale(global.camera.zoom)
	 love.graphics.translate(-global.camera.x, -global.camera.y)

	for k, c in ipairs(list) do 
		if c.type=="map" then 
			local mapref = ctx.name(c.name)
			drawmap(c,mapref)
		else  
			love.graphics.draw(ctx.name(c.name), c.x, c.y, c.a, c.sx, c.sy, c.cx, c.cy)
		end
	end
	love.graphics.pop()


end