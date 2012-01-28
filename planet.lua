require( "MiddleClass.lua" );


-- possibly things like ballochain should also be a singleton, and 
-- it is only the _state_ which should be recreated each time, not 
-- the whole thing (would solve most of my physics-related inelegancies) 
-- ie 'have a state' rather than 'be a state'


--stepwise animation

Planet = class("Planet");

function Planet:load ()
	maploader = require("AdvTiledLoader/Loader")
	maploader.path = "maps/"


end

--set a variable on a tile
function getTileProperty(name, x, y, ctx) 
	local r
	if	ctx.mapproperties and 
	  	ctx.mapproperties[x] and
	  	ctx.mapproperties[x][y] ~= nil
	then 
		print("custom")
		r= ctx.mapproperties[x][y]
    else 
		
		r= ctx.tiles and ctx.tiles[y+1] and 
		ctx.tiles[y+1][x+1] and 
		ctx.map.tiles[ctx.tiles[y+1][x+1]] and  
		ctx.map.tiles[ctx.tiles[y+1][x+1]].properties[name];
	end
	print("getTile",r)
	return r
end

function setTileProperty(name, value, x,y,ctx)
	
	if  ctx.tiles and ctx.tiles[y+1] and 
		ctx.tiles[y+1][x+1] and 
		ctx.map.tiles[ctx.tiles[y+1][x+1]] 
	then 
		print("upsetting", value)

		ctx.mapproperties = ctx.mapproperties or {}
		ctx.mapproperties[x]=ctx.mapproperties[x] or {}
		ctx.mapproperties[x][y]=value
		print("set",ctx.mapproperties[x][y])
		return true 
	else
		return false
	end 
		 
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

















