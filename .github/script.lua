--// ReyScriptPastebin UI (Clean Version)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 🧱 GUI
local gui = Instance.new("ScreenGui")
gui.Name = "ReyScriptPastebinUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- 📦 Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 180)
frame.Position = UDim2.new(0.5, -160, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.BorderSizePixel = 0
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- 🌈 Top Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BackgroundColor3 = Color3.fromRGB(120, 60, 255)
topBar.BorderSizePixel = 0
topBar.Parent = frame

Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 12)

-- 🏷️ Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "ReyScriptPastebin"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = topBar

-- 📄 Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -20, 0, 60)
subtitle.Position = UDim2.new(0, 10, 0, 55)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Script Hub • UI System • Roblox Tools"
subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.TextWrapped = true
subtitle.Parent = frame

-- 🟢 Badge
local badge = Instance.new("TextLabel")
badge.Size = UDim2.new(0, 120, 0, 25)
badge.Position = UDim2.new(0, 10, 1, -35)
badge.BackgroundColor3 = Color3.fromRGB(40, 200, 120)
badge.Text = "ACTIVE"
badge.TextColor3 = Color3.fromRGB(255, 255, 255)
badge.Font = Enum.Font.GothamBold
badge.TextSize = 12
badge.Parent = frame

Instance.new("UICorner", badge).CornerRadius = UDim.new(0, 8)

-- ❌ Close Button
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 80, 0, 25)
close.Position = UDim2.new(1, -90, 1, -35)
close.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
close.Text = "CLOSE"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.GothamBold
close.TextSize = 12
close.Parent = frame

Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- ✨ Simple animation masuk
frame.BackgroundTransparency = 1
frame:TweenSizeAndPosition(
	UDim2.new(0, 320, 0, 180),
	UDim2.new(0.5, -160, 0.5, -90),
	Enum.EasingDirection.Out,
	Enum.EasingStyle.Quad,
	0.4,
	true
)

for i = 1, 10 do
	frame.BackgroundTransparency -= 0.1
	task.wait(0.03)
end
