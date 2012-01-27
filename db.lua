db = {
	body   	= "gfx/body.png"               	,
	ear    	= "gfx/ear.png"                	,
	face   	= "gfx/face.png"               	,
	logo   	= "gfx/love.png"               	,
	cloud  	= "gfx/cloud_plain.png"        	,
	selfmag	= "gfx/Self_magazine_cover.png"	,
}
function db.name(name)
	return 	db[name]
end
