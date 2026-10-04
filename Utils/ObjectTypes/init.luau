--!strict
export type GenericClass<gui, properties, signals> = {
	Gui : gui,
	Properties : properties,
	Signals : signals,
}

local Module = {
	BillboardGui = require(script.BillboardGui),
	CanvasGroup = require(script.CanvasGroup),
	Frame = require(script.Frame),
	ImageLabel = require(script.ImageLabel),
	ScreenGui = require(script.ScreenGui),
	ScrollingFrame = require(script.ScrollingFrame),
	TextBox = require(script.TextBox),
	TextButton = require(script.TextButton),
	TextLabel = require(script.TextLabel),
	UIAspectRatioConstraint = require(script.UIAspectRatioConstraint),
	UICorner = require(script.UICorner),
	UIFlexItem = require(script.UIFlexItem),
	UIGradient = require(script.UIGradient),
	UIGridLayout = require(script.UIGridLayout),
	UIListLayout = require(script.UIListLayout),
	UIPadding = require(script.UIPadding),
	UIShadow = require(script.UIShadow),
	UISizeConstraint = require(script.UISizeConstraint),
	UIStroke = require(script.UIStroke),
	UITextSizeConstraint = require(script.UITextSizeConstraint),
	ViewportFrame = require(script.ViewportFrame)
}

return Module
