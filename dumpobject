--[[
String dump of any Lua object.

by Philippe Lhoste <PhiLho(a)GMX.net> http://Phi.Lho.free.fr
File/Project history:
 1.02 -- 2007/03/15 (PL) -- Special, compact handling of empty tables.
         Also corrected a bug in quotes around tostring result ("foo')
 1.01 -- 2006/11/07 (PL) -- Exclude keywords from "naked" string keys.
 1.00 -- 2006/07/13 (PL) -- Creation of this version.
 0.01 -- 2003/??/?? (PL) -- First version?
]]
--[[ Copyright notice: See the PhiLhoSoftLicence.txt file for details.
This file is distributed under the zlib/libpng license.
Copyright (c) 2006 Philippe Lhoste / PhiLhoSoft
]]

--[[
Returns a textual representation of "any" Lua object,
including tables (and nested tables).
Functions are not decompiled (of course).
It sticks strictly to the real table constructor syntax,
so the result can be reparsed by Lua to recreate the object,
at least if there are NO complex objects (functions, userdata...).
It handles references correctly, except for cycles (a ref. b which ref. a).

Example of use:
For an indented dump:
  (DumpObject(tableName))
For an inline dump:
  (DumpObject(t, '', ' '))
]]
function DumpObject(objectToDump, indentUnit, newline)
	local keywords =
	{
		["and"] = true, ["break"] = true, ["do"] = true, ["else"] = true, ["elseif"] = true, ["end"] = true,
		["false"] = true, ["for"] = true, ["function"] = true, ["if"] = true, ["in"] = true, ["local"] = true,
		["nil"] = true, ["not"] = true, ["or"] = true, ["repeat"] = true, ["return"] = true, ["then"] = true,
		["true"] = true, ["until"] = true, ["while"] = true
	}
	-- The string used to indent
	-- Give an empty string for no indentation
	if indentUnit == nil then
		indentUnit = "  " -- 2 spaces
	end
	-- Give an empty string to put all the dump in one line
	if newline == nil then
		newline = "\n"
	end

	-- Current indent level/string
	local indent = ""
	-- Table of visited tables, to handle cross-references
	local visited = {}
	-- Number of the currently visited table
	local tableIndex = 0
	-- We put the dump string fragments here, to concatenate them later
	local dump = {}
	-- Half backed tentative to handle cyclic references...
	local dumpAfter, daIndex = {}, 0

	-- In the following functions, the  bOnLeft parameter
	-- is true if we are on the left side of an assignment (=), false on the right side

	-- If on left of assignment, add brackets around the string,
	-- otherwise, leave it as is.
	local function GetLeftOrRight(str, bOnLeft)
		if bOnLeft then
			-- Index syntax
			return '[' .. str .. ']'
		else
			-- Plain object
			return str
		end
	end

	-- Add the right quotes around the string, depending on what we
	-- find in it, and if we are on left or on right of assignment.
	local function QuoteString(str, bOnLeft)
		if bOnLeft and string.find(str, '[^%w_]') == nil and not keywords[str] then
			-- String with variable syntax on the left side of '=': can be left unquoted
			return str
		end
		local qs
		if string.find(str, '[\\\r\n"]') == nil then
			-- No special chars, can just use double quotes
			qs = '"' .. str .. '"'
		elseif string.find(str, "[\\\r\n']") == nil then
			-- No special chars, can just use single quotes
			qs = "'" .. str .. "'"
		else
			-- Backslash or newline or double quotes in string, must use literal string
			if bOnLeft then
				-- We have to write [ [[...]] ] to avoid ambiguity
				qs = ' [[' .. str .. ']] '
			else
				qs = '[[' .. str .. ']]'
			end
		end
		return GetLeftOrRight(qs, bOnLeft)
	end

	-- Return a correctly quoted (or not) string representation
	-- of the given object.
	-- Must not be called with a table, which is processed separately.
	local function DumpItem(object, bOnLeft)
		local di = "UH?"
		local to = type(object)
		if to == "string" then
			di = QuoteString(object, bOnLeft)
		elseif to == "number" or to == "boolean" then
			di = GetLeftOrRight(tostring(object), bOnLeft)
		elseif to  == "nil" then -- If the first object is nil itself...
			return 'nil' -- Cannot happen on left, can't it?
		elseif to  == "table" then
			di = "TABLE!" -- Should be tested before...
		else
			-- function, userdata, thread, ...
			-- Put the tostring result between double quotes
			-- It won't be restored correctly, but it won't give a syntax error...
			di = GetLeftOrRight('"' .. tostring(object) .. '"', bOnLeft)
		end
		return di
	end

	-- Walk the object (if it is a table) and build
	-- a string representation of the found objects.
	-- bForce bypasses the reference mechanism,
	-- forcing to dump the table (for referenced tables).
	local function DumpRecursively(object, bOnLeft, bForce)
		if type(object) == "table" then
			if visited[object].visits > 1 and not bForce then
				-- Cross-reference
				if object == objectToDump then
					-- Don't reference the root table! (trying to handle cycles)
					return nil
				else
					-- We have a referenced table, return its variable name
					return GetLeftOrRight("T" .. visited[object].idx, bOnLeft)
				end
			end

			local openBrace, closeBrace
			if bOnLeft then
				-- Using a raw table constructor as key!
				-- Only accessible by iteration...
				if next(object) == nil then	-- Empty table
					-- Use a lighter traditional representation
					openBrace = "[ {"; closeBrace = "} ]"
				else
					openBrace = "[ {" .. newline
					closeBrace = newline .. indent .. "} ]"
				end
			else
				if next(object) == nil then	-- Empty table
					-- Use a lighter traditional representation
					openBrace = "{"; closeBrace = "}"
				else
					openBrace = newline .. indent .. "{" .. newline
					closeBrace = newline .. indent .. "}"
				end
			end
			-- Start of table dump
			local td = { openBrace }
			local tdi = 1
			-- Indent more
			indent = indent .. indentUnit
			-- Walk the table
			local k, v = nil, nil
			repeat
				k, v = next(object, k)
				if k ~= nil then
					if tdi ~= 1 then
						-- Add field separator
						tdi = tdi + 1
						td[tdi] = "," .. newline
					end
					-- Walk the key and the value
					local left = DumpRecursively(k, true, false)
					local right = DumpRecursively(v, false, false)
					if right == nil then
						-- Tentative to handle cycles
						daIndex = daIndex + 1
						-- Incorrect, it must not be 'left' but the full path!
						dumpAfter[daIndex] = left .. " = T" .. visited[v].idx
					else
						-- Add this field
						tdi = tdi + 1
						td[tdi] = indent .. left .. " = " .. right
					end
				end
			until k == nil
			-- Deindent
			indent = string.sub(indent, string.len(indentUnit) + 1)
			-- End of table
			tdi = tdi + 1
			td[tdi] = closeBrace
			return table.concat(td)
		else -- Not a table
			-- Return a string equivalence
			return DumpItem(object, bOnLeft)
		end
	end

	-- List cross references of the given object (must be a table).
	local function ListCrossReferences(object)
		if type(object) == "table" then
			if visited[object] ~= nil then
				-- Already seen, cross-reference
				visited[object].visits = visited[object].visits + 1
				return
			end
			-- First seen, number it
			tableIndex = tableIndex + 1
			visited[object] = { visits = 1, idx = tableIndex }

			-- Walk this table and see if it has other tables inside
			local k, v = nil, nil
			repeat
				k, v = next(object, k)
				if k ~= nil then
					ListCrossReferences(k)
					ListCrossReferences(v)
				end
			until k == nil
		end
	end

	-- Dump the tables referenced more than once,
	-- so they make easy to reference variables.
	local function DumpCrossReferences()
		local k, v = nil, nil
		repeat
			k, v = next(visited, k)
			if k ~= nil and v.visits > 1 and k ~= objectToDump then
				dump[v.idx] = "\nlocal T" .. v.idx .. " = " .. DumpRecursively(k, false, true)
			end
		until k == nil
	end

	-- List all cross-references of the (possibly) table
	ListCrossReferences(objectToDump)
	-- Dump the tables used in cross-references
	DumpCrossReferences()
	-- Add the main table
	dump[tableIndex + 1] = "\nlocal T = " .. DumpRecursively(objectToDump, false, true)
	-- Fill in the gaps, so concat could work
	for i = 1, tableIndex do
		if dump[i] == nil then
			dump[i] = ''
		end
	end
	return table.concat(dump) .. "\n" .. table.concat(dumpAfter)
end

--[[
Write a dump of the object (likely to be a table...)
to the given file.
It can be used with:
  table = dofile("DumpedTable.lua")
]]
function DumpObjectToFile(object, fileName)
	local fh = io.open(fileName, "w")
	fh:write("do\n" .. DumpObject(object) .. "\nreturn T\n\nend\n")
	fh:close()
end

--[[
For a quick in-line dump of a simple table (no cross-references)
without the initialization stuff.
]]
function FormatSimpleTable(t)
	return (string.gsub(string.gsub(DumpObject(t, '', ' '), "^\nlocal T = ", ""), "\n$", ""))
end