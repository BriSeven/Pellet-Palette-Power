oldmod=0

function livereload(file)
	local ok, chunk, result
	local modtime, errormsg

	modtime, errormsg = love.filesystem.getLastModified(file )
	if(modtime>oldmod) then 

		ok, chunk = pcall( love.filesystem.load, file ) -- load the chunk safely
		if not ok then
		  wendyprint('The following error happend: ' .. tostring(chunk))
		else
		  wendyprint("try execute")

		  ok, result = pcall(chunk) -- execute the chunk safely
			
		  if not ok then -- will be false if there is an error
			wendyprint("not okay")
		    wendyprint('The following error happened: ' .. tostring(result))
		  else

			wendyprint("executed with no error")
		    wendyprint('The result of loading is: ' .. tostring(result))
		  end

		end	
		oldmod=modtime 
	end

end 

