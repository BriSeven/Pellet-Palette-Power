Playhead={
    _startTime = 0,
    _stopTime = 0,
    _started = false
}
Playhead.__index = Playhead


function Playhead.create () 
    local self = {}
    setmetatable(self,Playhead)
    return self
end 

function Playhead.getTime () 
    return love.timer.getMicroTime()*1000
end 


function Playhead:start () 
    self._started = true;
    self._startTime = Playhead.getTime() - self._stopTime;
    return self;
end
function Playhead:stop () 
    if self._started then
        self._started = false;
        self._stopTime = Playhead.getTime() - self._startTime;
    end
    return self;
end
function Playhead:reset () 
    if not self._started then
        self._startTime = 0;
        self._stopTime = 0;
    end
    return self;
end
function Playhead:set (x) 
    if not (x ~= x) and x >= 0 then
        if self._started then
            self._startTime = Playhead.getTime() - x;
        else
            self._stopTime = x;
        end
    end
    return self;
end
function Playhead:time () 
    if self._started then
        return Playhead.getTime() - self._startTime;
    else
        return self._stopTime;
    end
end
