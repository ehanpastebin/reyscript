local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 🌐 Window
local Window = Rayfield:CreateWindow({
   Name = "ReyScript Hub",
   LoadingTitle = "ReyScript Loading...",
   LoadingSubtitle = "Cyber UI System",
   ShowText = "ReyScript",
   ToggleUIKeybind = "K",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ReyScript",
      FileName = "config"
   }
})

---------------------------------------------------
-- 📂 MAIN TAB
---------------------------------------------------
local MainTab = Window:CreateTab("Main", 4483362458)

local MainSection = MainTab:CreateSection("Main Features")
MainSection:Set("Main Control Panel")

MainTab:CreateButton({
   Name = "Print Hello",
   Callback = function()
      print("Hello from Main Tab")
   end
})

MainTab:CreateDivider()

---------------------------------------------------
-- 📂 SECOND TAB
---------------------------------------------------
local SecondTab = Window:CreateTab("Second", 4483362458)

local SecondSection = SecondTab:CreateSection("Utilities")
SecondSection:Set("Utility Panel")

SecondTab:CreateButton({
   Name = "Test Action",
   Callback = function()
      print("Second Tab Active")
   end
})

local Divider2 = SecondTab:CreateDivider()

---------------------------------------------------
-- ⚙️ SETTINGS TAB
---------------------------------------------------
local SettingsTab = Window:CreateTab("Settings", 4483362458)

local SettingsSection = SettingsTab:CreateSection("UI Settings")
SettingsSection:Set("Interface Control")

SettingsTab:CreateButton({
   Name = "Hide UI",
   Callback = function()
      Rayfield:SetVisibility(false)
   end
})

SettingsTab:CreateButton({
   Name = "Show UI State",
   Callback = function()
      print("Visible:", Rayfield:isVisible())
   end
})

SettingsTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      Rayfield:Destroy()
   end
})

---------------------------------------------------
-- ℹ️ ABOUT TAB
---------------------------------------------------
local AboutTab = Window:CreateTab("About", 4483362458)

local AboutSection = AboutTab:CreateSection("About This Hub")
AboutSection:Set("ReyScript Information")

AboutTab:CreateLabel("ReyScript Hub v1.0")
AboutTab:CreateLabel("Made with Rayfield UI")
AboutTab:CreateLabel("Cyber Futuristic Interface")

AboutTab:CreateDivider()

AboutTab:CreateButton({
   Name = "Check UI Status",
   Callback = function()
      print("Rayfield Active:", Rayfield:isVisible())
   end
})
