require( "MiddleClass.lua" );
require("has_physics.lua");


-- possibly things like ballochain should also be a singleton, and 
-- it is only the _state_ which should be recreated each time, not 
-- the whole thing (would solve most of my physics-related inelegancies) 
-- ie 'have a state' rather than 'be a state'


--stepwise animation

Planet = class("Planet");
Planet:include(HasPhysics);


function Planet:initialize(map)
--get a map, create a dynamic instance
	
end



function Planet:newState(dt,oldstate,ctx)
--update map according to external factors from ctx


end

function Planet:newDrawable(state)
--tile library


	return d
end

















