
function love.draw()



	-- love.graphics.draw(logo, 400*scale, 380*scale, 0, scale, scale, 128, 64)

	love.graphics.setColor(255, 255, 255, 200)

	love.graphics.setRenderTarget(lowbuffer)
		

	drawlist(ctx.nekochan:newDrawable())
	drawlist(ctx.clouds:newDrawable())


	love.graphics.setRenderTarget()

	-- love.graphics.draw(selfmag, mag.x*scale,mag.y*scale, mag.a, scale, scale, 100, 200)
	-- love.graphics.setColor(255, 255, 255, 200)

	-- love.graphics.setColor(0, 0, 0, 200)
	-- love.graphics.setColor(255, 255, 255, 255)
	lowbuffer:setFilter("nearest","nearest")


    love.graphics.draw(lowbuffer, 0,0,0,pixelsize,pixelsize,0,0)

	love.graphics.setColor(0, 0, 0, 255)

	love.graphics.setColor(255, 255, 255, 200)
end


function drawlist (list) --add a camera parameter


	for k, c in ipairs(list) do 
		love.graphics.draw(ctx.name(c.name), c.x*scale, c.y*scale, c.a, c.sx*scale, c.sy*scale, c.cx, c.cy)



	end

end