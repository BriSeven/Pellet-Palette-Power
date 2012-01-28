function love.keypressed(k)


	-- wsl:todo disable developer keys in release version?
	-- developer keys --
	
	-- reload
	if k == "r" then
		love.filesystem.load("flufft.lua")()
		love.filesystem.load("Creature.lua")
		love.filesystem.load("rainbowfluff.lua")()

		ctx:stop()

		ctx=rainbowFluff(love,1)
	end

    -- ???
	if k =="l" then
		ctx:stop()
		ctx={}
		function ctx:update()
		
		end 
		function ctx:draw()

		end 
		function ctx:stop()
		end 
	end
	
	-- ???
	if k == "k" then 
		ctx:stop()

		ctx=rainbowFluff(love,1)
	end 

	
	-- player keys --
	
	-- pause
	if k =="p" then 
		if ctx.paused then 
			ctx:resume()
		else
			ctx:stop()
	    end 
	end 
	
	
	-- move North
	if k =="w" then 
		ctx.tractor:KeyboardMoveNorth()
	end
	
	-- move East
	if k =="d" then 
		ctx.tractor:KeyboardMoveEast()
	end
	
	-- move South
	if k =="s" then 
		ctx.tractor:KeyboardMoveSouth()
	end
	
	-- move West
	if k =="a" then
		ctx.tractor:KeyboardMoveWest()
	end
	
end

