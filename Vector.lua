Vector = {}
Vector_mt = { __index = Vector }

Vector.Zero = setmetatable( {x=0, y=0}, Vector_mt);
Vector.unitHor = setmetatable( {x=1, y=0}, Vector_mt);
Vector.unitVer = setmetatable( {x=0, y=1}, Vector_mt);

function Vector:new(x,y)

	return setmetatable( {x=x, y=y}, Vector_mt);
	
end
 
function Vector:mag()

	return math.sqrt( self:dot( self ) );
	
end

function Vector:dot(v)

	return ( self.x * v.x ) + ( self.y * v.y );
	
end

function Vector:normalise()

	local len = self:mag();
	
	if( len == 0 ) then
		return;
	end
	
	self.x = self.x / len;
	self.y = self.y / len;
	
end

function Vector:set(x,y)
	
	self.x = x;
	self.y = y;
	
end

function Vector:setV(v)
	
	self.x = v.x;
	self.y = v.y;
	
end

function Vector.copy(v)

	return Vector:new( v.x, v.y );
	
end

function Vector.add(v1,v2)

	return Vector:new( v1.x+v2.x, v1.y+v2.y );
	
end

function Vector.sub(v1,v2)

	return Vector:new( v1.x-v2.x, v1.y-v2.y );
	
end

function Vector.mult(v,m)

	return Vector:new( v.x*m, v.y*m );
	
end

function Vector.equal(v1,v2)

	if( v1.x ~= v2.x or v1.y ~= v2.y ) then
		return false;
	else
		return true;
	end
	
end

function Vector.angleNorm(v1, v2)

	return ( math.atan2(v2.y,v2.x) - math.atan2(v1.y,v1.x) );

end
