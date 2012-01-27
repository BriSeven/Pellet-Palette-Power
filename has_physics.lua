require( "globals.lua" );
require( "MiddleClass" );


HasPhysics = { -- HasPhysics is a module, not a class. It can be "included" into classes
  fly = function(self)
    print('flap flap flap I am a ' .. self.class.name .. ' and I can fly!')
  end, 
  createBody = function(self, game_actor)
--    wendyprint("In HasPhysics createBody...self is:")
--	  wendyprint(self)
--	  wendyprint("In HasPhysics createBody...self.ctx is:")
--	  wendyprint(self.ctx)
	  wendyprint("In HasPhysics createBody...game_actor is:")
	  wendyprint(game_actor)
--      self.ctx.physics:newBody(game_actor)
	  g_physics:newBody(game_actor)
  end 


}