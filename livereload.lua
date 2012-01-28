oldmod=0

function livereload(file)
	local ok, chunk, result
	local modtime, errormsg

	modtime, errormsg = love.filesystem.getLastModified(file )
	if(modtime>oldmod) then 

		ok, chunk = pcall( love.filesystem.load, file ) -- load the chunk safely
		if not ok then
		  print('The following error happend: ' .. tostring(chunk))
		else
		  print("try execute")

		  ok, result = pcall(chunk) -- execute the chunk safely
			
		  if not ok then -- will be false if there is an error
			print("not okay")
		    print('The following error happened: ' .. tostring(result))
		  else

			print("executed with no error")
		    print('The result of loading is: ' .. tostring(result))
		  end

		end	
		oldmod=modtime 
	end

end 

