
require( "middleclass.lua" );

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
function getTileProperty(name, x, y, ctx, lr ) 
	local r
	local layer = (ctx.map.tl[lr] or {} ).tileData or {}

	if	ctx.mapproperties and 
	  	ctx.mapproperties[x] and
	  	ctx.mapproperties[x][y] and 
	  	ctx.mapproperties[x][y][lr] ~= nil
	then 
		r= ctx.mapproperties[x][y][lr][name]
    else 
		
		r= layer and layer[y+1] and 
		layer[y+1][x+1] and 
		ctx.map.tiles[layer[y+1][x+1]] and  
		ctx.map.tiles[layer[y+1][x+1]].properties[name];
	end
	return r
end

function setTileGraphic(LayerName,GraphicCode,x,y,ctx)
	local layer = (ctx.map.tl[LayerName] or {} ).tileData or {}
	
	if  layer and layer[y+1] and 
		layer[y+1][x+1]
	then 
		layer[y+1][x+1] = GraphicCode
	end
end
function getTileIndex(LayerName,x,y,ctx)
	local layer = (ctx.map.tl[LayerName] or {} ).tileData or {}
	
	if  layer and layer[y+1] and 
		layer[y+1][x+1]
	then 
		return layer[y+1][x+1]
	end
end

function setTileProperty(name, value, x,y,ctx,lr)
	
	local layer = (ctx.map.tl[lr] or {} ).tileData or {}
	
	if  layer and layer[y+1] and 
		layer[y+1][x+1] ~= nil
	then 
		
		
		ctx.mapproperties[x]=ctx.mapproperties[x] or {}
		ctx.mapproperties[x][y]=ctx.mapproperties[x][y] or {}
		ctx.mapproperties[x][y][lr]=ctx.mapproperties[x][y][lr] or {}
		ctx.mapproperties[x][y][lr][name]=value

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

















