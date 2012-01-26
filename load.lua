

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



	--ctx=makeTestCTX(love)
	ctx = makeTestPhysicsCTX(love)
	--love.audio.play(music, 0)
	pickmode()
	
end



function makeTestPhysicsCTX (love)

--    	-- wsl: Physics stuff

	
--  
	objects = {} -- table to hold all our physical objects (for now!)
      
    world = g_physics:getWorld()
    world_h = g_physics:getWorldHeight()
    world_w = g_physics:getWorldWidth()  
    
	--let's create the ground
	objects.ground = {}
	--we need to give the ground a mass of zero so that the ground won't move

	objects.ground.body = love.physics.newBody(g_physics:getWorld(), g_physics:getWorldWidth()/2, g_physics:getWorldHeight()-25, 0, 0) --remember, the body anchors from the center of the shape
	objects.ground.shape = love.physics.newRectangleShape(objects.ground.body, 0, 0, g_physics:getWorldWidth(), 50, 0) --anchor the shape to the body, and make it a width the same as the world and a height of 50

--    -- many physics objects wil have related drawables 
--    g_physics.objects.drawables = {}
--	--let's create a ball
--	g_physics.objects.drawables.ball = {}
--	g_physics.objects.drawables.ball.body = love.physics.newBody(world, world_w/2, world_h/2, 15, 0) --place the body in the center of the world, with a mass of 15
--	g_physics.objects.drawables.ball.shape = love.physics.newCircleShape(g_physics.objects.drawables.ball.body, 0, 0, 20) --the ball's shape has no offset from it's body and has a radius of 20
   
--	-- wsl: End Physics stuff
	local ctx= {}

    ctx.physics = g_physics
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
	
--	ctx.ballochan = Ballochan.create()
	ctx.ballochan = Ballochan:new()
	print(ctx.ballchan)
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

