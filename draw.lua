require("load.lua")



function love.draw()
	if ctx.draw then
		ctx:draw()
	end 
	
end


function drawlist (list) --add a camera parameter


	for k, c in ipairs(list) do 
		love.graphics.draw(ctx.name(c.name), c.x, c.y, c.a, c.sx, c.sy, c.cx, c.cy)



	end

end