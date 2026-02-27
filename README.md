# Neverlose UI Library — Documentation

### Overview
This documentation explains how to use the **Neverlose UI Library**, including how to create a window, add tabs, organize sections, and use features such as toggles, sliders, dropdowns, color pickers, and saved configurations.

---

## 1. Loader Setup
Load the library from your desired source:
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/NEVERLOSE/refs/heads/main/NEVERLOSE-CS2-NEW-SOURCE.lua"))()
```

---

## 2. Create a Window
```lua
local Window = Library:AddWindow("Neverlose", "rbxassetid://118608145176297", "Counter Strike 2")
```
- First parameter → Window title  
- Second parameter → Icon (image asset ID)  
- Third parameter → Subtitle

---

## 3. Add Tabs
```lua
local RageTab = Window:AddTab("Rage", "crosshair")
```
- Organizes features into categories.  
- Second parameter sets the tab icon.

---

## 4. Add Sections
```lua
local MainSection = RageTab:AddSection("MAIN", "left")
```
- Sections divide your tab into left or right sides.  
- First parameter → section name  
- Second parameter → position (`"left"` or `"right"`)

---

## 5. Add Features

### Toggle
```lua
MainSection:AddToggle("Enabled", true, function(value)
    print("Enabled:", value)
end)
```

## Toggle with Colorpicker
```lua
MainSection:AddToggleColorpicker("Toggle with Color", true, Color3.fromRGB(26, 123, 255), function(color, enabled)
end)
```

### Slider
```lua
MainSection:AddSlider("Field of View", 1, 180, 74.8, function(v)
    print("FOV:", v)
end, "°")
```

### Dropdown
```lua
SelectionSection:AddDropdown("Target", {"Highest Damage", "Closest", "Random"}, function(v)
    print("Target:", v)
end)
```

### Colorpicker
```lua
local color = SelectionSection:AddColorpicker("Bruh", Color3.fromRGB(255,255,255), function(val)
    print("Color:", val)
end)

color:Get()
color:Set(Color3.fromRGB(255,255,255))
```

---

## 6. Add Settings to Elements
```lua
local toggle = MainSection:AddToggle("Silent Aim", true, function(v)
    print("Silent Aim:", v)
end)

local settings = toggle:AddSettings()

settings:AddToggle("Automatic Fire", true, function(v)
    print("Automatic Fire:", v)
end)
```

---

## 7. Accordions
```lua
local acc = MainSection:AddAccordion("Hatdogs")
acc:AddToggle("Option A", false, function(v) print(v) end)
acc:AddSlider("Speed", 0, 100, 50, function(v) print(v) end, "%")
acc:AddDropdown("Mode", {"A", "B", "C"}, function(v) print(v) end)
acc:AddColorpicker("Color", Color3.fromRGB(255, 0, 0), function(c) print(c) end)
```

## 8. Load Saved Config
```lua
Window:LoadSavedConfig()
```
Restores the user’s last saved state (toggles, sliders, colors, etc.).

---

## 8. Full Example
```lua

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/NEVERLOSE/refs/heads/main/NEVERLOSE-CS2-NEW-SOURCE.lua"))()

local Window = Library:AddWindow("Neverlose", "rbxassetid://118608145176297", "Counter Strike 2")

Window:AddTabLabel("Aimbot")
local RageTab = Window:AddTab("Rage", "crosshair")

local MainSection = RageTab:AddSection("MAIN", "left")

local toggleEnabled = MainSection:AddToggle("Enabled", true, function(v)
	print("Enabled:", v)
end)

local grr = toggleEnabled:AddSettings()
grr:AddToggle("Force Shoot", false, function(val)
end)

local toggleSilentAim = MainSection:AddToggle("Silent Aim", true, function(v)
	print("Silent Aim:", v)
end)
local silentAimSettings = toggleSilentAim:AddSettings()
silentAimSettings:AddToggle("Perfect Silent Aim", false, function(val)
end)

MainSection:AddToggle("Automatic Fire", true, function(v)
	print("Automatic Fire:", v)
end)
MainSection:AddToggle("Aim Through Walls", true, function(v)
	print("Aim Through Walls:", v)
end)

MainSection:AddSlider("Field of View", 1, 180, 180, function(v)
	print("FOV:", v)
end, "°")

local SelectionSection = RageTab:AddSection("SELECTION", "left")

SelectionSection:AddDropdown("Target", {"Highest Damage", "Closest", "Random"}, function(v)
	print("Target:", v)
end)

SelectionSection:AddDropdown("Hitboxes", {"Head, Chest, Stomach", "Arms, Legs, Extremities"}, function(v)
	print("Hitboxes:", v)
end)

local dropMultipoint = SelectionSection:AddDropdown("Multipoint", {"Head, Chest, Stomach", "Arms, Legs, Extremities"}, function(v)
	print("Multipoint:", v)
end)
local brr = dropMultipoint:AddSettings()
brr:AddSlider("Multipoint", 0,100,79, function(val)
end)

local sliderHitChance = SelectionSection:AddSlider("Hit Chance", 0, 100, 60, function(v)
	print("Hit Chance:", v)
end, "%")
sliderHitChance:AddSettings()

local sliderMinDamage = SelectionSection:AddSlider("Min Damage", 0, 100, 15, function(v)
	print("Min Damage:", v)
end)
sliderMinDamage:AddSettings()

local toggleQuickStop = SelectionSection:AddToggle("Quick Stop", true, function(v)
	print("Quick Stop:", v)
end)
local patapim = toggleQuickStop:AddSettings()
patapim:AddDropdown("Auto Stop", { "Early","In air","Between Shot","Force Accurate"}, function(val)
end)

SelectionSection:AddToggle("Quick Scope", true, function(v)
	print("Quick Scope:", v)
end)

local OtherSection = RageTab:AddSection("OTHER", "right")

OtherSection:AddDropdown("History", {"Off", "Medium", "High", "Maximum"}, function(v)
	print("History:", v)
end)

OtherSection:AddToggle("Delay Shot", true, function(v)
	print("Delay Shot:", v)
end)

OtherSection:AddToggle("Remove Recoil", true, function(v)
	print("Remove Recoil:", v)
end)

OtherSection:AddToggle("Remove Spread", true, function(v)
	print("Remove Spread:", v)
end)

OtherSection:AddToggle("Duck Peek Assist", false, function(v)
	print("Duck Peek Assist:", v)
end)

local toggleQuickPeek = OtherSection:AddToggle("Quick Peek Assist", false, function(v)
	print("Quick Peek Assist:", v)
end)
toggleQuickPeek:AddSettings()

OtherSection:AddToggle("Double Tap", false, function(v)
	print("Double Tap:", v)
end)

local AntiAimSection = RageTab:AddSection("ANTI-AIM", "right")

local toggleAntiAim = AntiAimSection:AddToggle("Enabled", true, function(v)
	print("Anti-Aim Enabled:", v)
end)
toggleAntiAim:AddSettings()

local accPitch = AntiAimSection:AddAccordion("Pitch")
accPitch:AddDropdown("Direction", {"Down", "Up", "Zero", "Random"}, function(v)
	print("Pitch:", v)
end)

local accYaw = AntiAimSection:AddAccordion("Yaw")
accYaw:AddDropdown("Direction", {"Backwards", "Forwards", "Sideways", "Random"}, function(v)
	print("Yaw:", v)
end)

local accFreestanding = AntiAimSection:AddAccordion("Freestanding")
accFreestanding:AddToggle("Enabled", false, function(v)
	print("Freestanding:", v)
end)

local accMouseOverride = AntiAimSection:AddAccordion("Mouse Override")
accMouseOverride:AddToggle("Enabled", false, function(v)
	print("Mouse Override:", v)
end)

local LegitTab = Window:AddTab("Legit", "mouse")
Window:AddTabLabel("Common")
local VisualsTab = Window:AddTab("Visuals", "camera")
local InventoryTab = Window:AddTab("Inventory", "locker")
local MiscTab = Window:AddTab("Miscellaneous", "gear")

Window:LoadSavedConfig()
```

---

## 💾 9. Manual Config Control
```lua
Window:SaveConfig("RageConfig")
Window:LoadConfig("RageConfig")
```
