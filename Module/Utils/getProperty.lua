local warnMsg = require("./warn.lua")

local function getProperty(instance : Instance, property : string) : any
	return instance[property]
end

local function getPropertySafe(instance : Instance, property : string) : any
	local success, result = pcall(getProperty, instance, property)
	
	if not success then
		warnMsg(result)
	end
	
	return result
end

return getPropertySafe
