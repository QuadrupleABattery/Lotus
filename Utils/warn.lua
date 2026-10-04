--!strict

local Config = require("./Config")

local function warnMsg(msg : string) : ()
	warn(`[{Config.Source}] {msg}`)
	warn(debug.traceback())
end

return warnMsg
