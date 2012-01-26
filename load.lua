function pickmode () 
    modes = love.graphics.getModes()
    lowest = reduce(function (a,b) if math.abs((a.width/a.height)-1.5)<math.abs((b.width/b.height)-1.5) then return a else return b end end,modes)
    love.graphics.setMode(960,640)

end


lowbuffer = love.graphics.newFramebuffer(240,160)
scale = 240/800
pixelsize = 4
clock = 0;


function love.load()



	


	ctx=makeTestCTX(love)
	
	--love.audio.play(music, 0)
	pickmode()
	
end



function makeTestCTX (love)
	local ctx= {}

	ctx.joysticks = love.joystick.getNumJoysticks( )

	function ctx.name (name, character) 
		--replacable with proper cache lookup later
		return ctx[name]
	end
	ctx.ph = Playhead.create()
	ctx.love=love
	-- The amazing music.
	--music = love.audio.newSource("mav-alon.it")
	-- The various images used.
	ctx.body   	= love.graphics.newImage(db.name( "body"   	))
	ctx.ear    	= love.graphics.newImage(db.name( "ear"    	))
	ctx.face   	= love.graphics.newImage(db.name( "face"   	))
	ctx.logo   	= love.graphics.newImage(db.name( "logo"   	))
	ctx.cloud  	= love.graphics.newImage(db.name( "cloud"  	))
	ctx.selfmag	= love.graphics.newImage(db.name( "selfmag"	))

	ctx.nekochan = Nekochan.create()
	print(ctx.nekochan)
	-- Set the background color to soothing pink.
	ctx.love.graphics.setBackgroundColor(0xff, 0xf1, 0xf7)
	ctx.clouds=Clouds.create();
		-- Spawn some clouds.
	for i=1,5 do
		ctx.clouds:spawn_cloud(math.random(-100, 900), math.random(-100, 700), 80 + math.random(0, 50))
	end
	ctx.love.graphics.setColor(255, 255, 255, 200)
	return ctx

end 