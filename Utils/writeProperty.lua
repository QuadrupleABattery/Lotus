local warnMsg = require("./warn.lua")

local function writeProperty(instance : Instance, property : string, value : any) : ()
	instance[property] = value; return
end

local function writePropertySafe(instance : Instance, property : string, value : any) : ()
	local success, msg = pcall(writeProperty, instance, property, value)
	
	if not success then
		warnMsg(msg)
	end
	
	return
end

return writePropertySafe
