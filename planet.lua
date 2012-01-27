require( "MiddleClass.lua" );


-- possibly things like ballochain should also be a singleton, and 
-- it is only the _state_ which should be recreated each time, not 
-- the whole thing (would solve most of my physics-related inelegancies) 
-- ie 'have a state' rather than 'be a state'


--stepwise animation

Planet = class("Planet");
function getTileProperty(name, x, y, ctx) 

	return ctx.tiles[x] and 
	ctx.tiles[x][y] and 
	ctx.map.tiles[ctx.tiles[x][y]] and  
	ctx.map.tiles[ctx.tiles[x][y]].properties[name];
end

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

















