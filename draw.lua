require("load.lua")



function love.draw()
	ctx:draw()

	
end


function drawlist (list) --add a camera parameter


	for k, c in ipairs(list) do 
		love.graphics.draw(ctx.name(c.name), c.x, c.y, c.a, c.sx, c.sy, c.cx, c.cy)



	end

end