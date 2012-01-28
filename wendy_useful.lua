-- See http://www.lua.org/pil/19.3.html

function pairsByKeys (t, f)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a, f)
  local i = 0      -- iterator variable
  local iter = function ()   -- iterator function
    i = i + 1
    if a[i] == nil then return nil
    else return a[i], t[a[i]]
    end
  end
  return iter
end

function print_table(some_table)
	for name, line in pairsByKeys(some_table) do
	      print(name, line)
	end
end

function wendyprint(stuff)
   -- print(stuff)
end
function jackprint(stuff)
   print(stuff)
end