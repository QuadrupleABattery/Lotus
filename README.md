# Lotus
A full intellisense and --!strict compatible declarative UI Module designed for Roblox  
  
I was getting into declarative UI and wanted to try ReactLua but it killed the studio intellisense. Then I tried to use Fusion but it was weird and I was using it wrong but I liked the syntax so I just took it and made my own.  
  

## Setup
The hierarchy mostly follows the "Module" directory of this repository.  
  
Directories that contain a init.luau file means that the directory exists as a ModuleScript with init.luau being its source  
  
I purposefully omitted adding file extension names to files to make the names of every file more clear as I like appending .lua to the end of helper function ModuleScripts, but it does make the source code a bit more annoying to read.  
  
Have fun copying every construct type lol.  
  
Maybe I'll upload a version on Roblox sometime but I don't feel like it right now.  
  
## Constructors
### .create(objectType : ObjectType)  
Takes in a constructor object and returns a constructor function for a LotusObject of that class.  
  
### .native(objectType : ObjectType)  
Takes in a constructor object and returns a constructor function for a native Roblox Gui Instance of that class.  
Intended for when the additional wrapper functionality isn't necessary (such as for Gui Modifier Instances like layouts & constraints)
  
### .scene(name : string)  
Takes in a string and returns a LotusObject of class ScreenGui with that name parented to PlayerGui  
Equivalent to  
Lotus.create(Lotus.Objects.ScreenGui) {  
  Name = name,  
  Parent = Player.PlayerGui,  
}  
  
### Constructor Function  
Returned by .create() and .native()  
  
Takes in a properties table to instantialize the UI instance with in the form of {PropertyName = PropertyValue} :: {[string] : any}  
Contains 2 required special keys of "Children" and "Values"  
Key Children should be in the form of {ChildName = Child} :: {[string] : LotusObject | GuiBase}  
Key Values should be in the form of {ValueName = Value} :: {[string] : any}  
  
*The .native() constructor function can only contain native children, the .create() constructor function contain either

Returns either LotusObject or Native Gui Instance depending on if .create() or .native() was called.  


## LotusObject
The primary class of this module.  
I really don't feel like documenting every method and property but it's all intellisense compatible so I'm sure you can figure it out...  
  
## LotusTween
A helper class for making tweening easier.  
Figure it out, I believe in you!  
