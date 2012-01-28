function love.keypressed(k)
	if k == "r" then

		love.filesystem.load("rainbowfluff.lua")()
		love.filesystem.load("flufft.lua")()
		love.filesystem.load("Creature.lua")

		ctx:stop()

		ctx=rainbowFluff(love,1)
		--love.audio.play(music, 0)

	end
end