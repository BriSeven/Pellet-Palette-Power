function love.keypressed(k)
	if k == "r" then
		love.filesystem.load("flufft.lua")()
		love.filesystem.load("Creature.lua")
		love.filesystem.load("rainbowfluff.lua")()




		ctx:stop()

		ctx=rainbowFluff(love,1)

	end

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
	if k == "k" then 
		ctx:stop()

		ctx=rainbowFluff(love,1)
	end 
	if k =="p" then 
		if ctx.paused then 
			ctx:resume()
		else
			ctx:stop()
	    end 
	end 
end

