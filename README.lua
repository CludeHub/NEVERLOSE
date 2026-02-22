```lua

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/NEVERLOSE/refs/heads/main/NEVERLOSE-CS2-NEW-SOURCE.lua"))()

local Window = Library:AddWindow("Neverlose", "rbxassetid://0", "Counter Strike 2")
local RageTab = Window:AddTab("Rage", "rbxassetid://123456")

-- MAIN
local MainSection = RageTab:AddSection("MAIN", "left")

local b = MainSection:AddToggle("Enabled", true, function(v) print("Enabled:", v) end)

local b = MainSection:AddToggle("Silent Aim", true, function(v) print("Silent Aim:", v) end)

local a = b:AddSettings()
local c = a:AddColorpicker("Bruh", Color3.fromRGB(255,255,255), function(val)
end)
c:Get()
c:Set(Color3.fromRGB(255,255,255))

a:AddToggle("Automatic Fire", true, function(v) print("Automatic Fire:", v) end)

MainSection:AddSlider("Field of View", 1, 180, 74.8, function(v) print("FOV:", v) end, "°")


SelectionSection:AddDropdown("Multipoint", {"Arms, Legs, Extremities"}, function(v) print("Multipoint:", v) end)

Window:LoadSavedConfig()
```