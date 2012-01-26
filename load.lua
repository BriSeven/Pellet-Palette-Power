require("physicsworld.lua")

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
      
	--let's create the ground
	objects.ground = {}
	--we need to give the ground a mass of zero so that the ground wont move
--	world = PhysicsWorld:getInstance():getWorld()
	pw = PhysicsWorld.getInstance()
--	objects.ground.body = love.physics.newBody(world, 650/2, 625, 0, 0) --remember, the body anchors from the center of the shape
--	objects.ground.shape = love.physics.newRectangleShape(objects.ground.body, 0, 0, 650, 50, 0) --anchor the shape to the body, and make it a width of 650 and a height of 50
--      
--	--let's create a ball
--	objects.ball = {}
--	objects.ball.body = love.physics.newBody(world, 650/2, 650/2, 15, 0) --place the body in the center of the world, with a mass of 15
--	objects.ball.shape = love.physics.newCircleShape(objects.ball.body, 0, 0, 20) --the ball's shape has no offset from it's body and has a radius of 20


--     
--	-- wsl: End Physics stuff
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

