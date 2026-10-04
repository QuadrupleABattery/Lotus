--!strict

local Players = game:GetService("Players")

local Object = require("@self/Object")
local Native = require("@self/Native")
local Tween = require("@self/Tween")
local ObjectTypes = require("@self/Utils/ObjectTypes")

local player = Players.LocalPlayer; assert(player)
local playerGui = player.PlayerGui

local Module = {}

type AnyTable = {[any] : any}
type PropertyType<T1, T2, T3> = T1 & {Children : T2, Values : T3} & AnyTable

export type LotusTween<T1 = {[string] : any}> = Tween.LotusTween<T1>

Module.Objects = ObjectTypes

local function instantialize<T1, T2, T3, T4, T5>(objectType : ObjectTypes.GenericClass<T1, T2, T3>, properties : any, children : T4, values : T5)
	local object = Object.new(objectType, children, values)
	local gui = object.Gui :: Instance
	local propertyTable : {Children : {[string] :  Object.LotusObject | Instance}?, Values : {[string] : any}?, [string] : any} = properties
	
	if propertyTable.Children ~= nil then
		for name, child in propertyTable.Children do
			if typeof(child) == "Instance" then
				child.Name = name
				child.Parent = object.Gui
			else
				child:SetProperty("Name", name)
				child:SetParent(object)
			end
		end
	end
	
	propertyTable.Values = nil
	propertyTable.Children = nil
	
	object:SetProperties(propertyTable)
	
	gui.Destroying:Connect(function()
		object:Destroy()
	end)
	
	return object
end

function Module.create<T1, T2, T3>(objectType : ObjectTypes.GenericClass<T1, T2, T3>)
	return function<T4, T5>(properties : PropertyType<T2, T4, T5>) : Object.LotusObject<T1, T2, T3, T4, T5>
		return instantialize(objectType, properties, properties.Children :: {}, properties.Values :: {})
	end
end

function Module.native<T1, T2, T3>(objectType : ObjectTypes.GenericClass<T1, T2, T3>)
	return function<T4>(properties : T2 & {Children : T4} & AnyTable) :  T1 & T4
		return Native.new(objectType, properties)
	end
end

function Module.scene(name : string)
	local scene = Module.create(ObjectTypes.ScreenGui) {
		Name = name,
		
		Children = {},
		Values = {},
	}
	
	scene:SetParent(playerGui)
	
	return scene
end

return Module
