mag=mag or {
	a=0,
	x=120,
	y=220,
	vx=0,
	vy=0,
	ax=0,
	ay=1
}
function mag:update (dt,ctx)
	if ctx.keyboard[" "] then 
		self.ay=-200
	else
		self.ay=50
		if(self.y>500) then 
		self.y=500
		self.vy=0
		end	
	end
	if ctx.keyboard["left"] then 
		mag.vx=-scale*dt*50000
	elseif ctx.keyboard["right"] then 
		mag.vx=scale*dt*50000
	else 
		mag.vx=0
	end
	self.vx=self.vx+self.ax
	self.vy=self.vy+self.ay
	self.x=self.x+self.vx*dt
	self.y=self.y+self.vy*dt


end