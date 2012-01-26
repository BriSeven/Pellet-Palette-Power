function love.keypressed(k)
	if k == "r" then

		love.filesystem.load("main.lua")()
		--love.audio.play(music, 0)

	end
end