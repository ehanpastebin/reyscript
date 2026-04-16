--// REYSCRIPT CYBER FUTURE UI v2

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- 🌌 ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "ReyCyberUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- 🌑 Background blur layer (fake cyber depth)
local blurFrame = Instance.new("Frame")
blurFrame.Size = UDim2.new(1,0,1,0)
blurFrame.BackgroundColor3 = Color3.fromRGB(10,10,15)
blurFrame.BackgroundTransparency = 0.35
blurFrame.Parent = gui

-- 📦 Main Container
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 360, 0, 200)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
frame.BorderSizePixel = 0
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

-- 🌈 Neon stroke
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(140, 90, 255)
stroke.Thickness = 1.5
stroke.Transparency = 0.2
stroke.Parent = frame

-- ✨ Top glow bar
local top = Instance.new("Frame")
top.Size = UDim2.new(1,0,0,42)
top.BackgroundColor3 = Color3.fromRGB(130, 70, 255)
top.BorderSizePixel = 0
top.Parent = frame

Instance.new("UICorner", top).CornerRadius = UDim.new(0,14)

-- 🔮 Gradient effect
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(120,60,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,200,255))
}
grad.Rotation = 45
grad.Parent = top

-- 🏷️ Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "REYSCRIPT // CYBER HUB"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = top

-- 📄 Description
local desc = Instance.new("TextLabel")
desc.Size = UDim2.new(1,-20,0,60)
desc.Position = UDim2.new(0,10,0,55)
desc.BackgroundTransparency = 1
desc.Text = "Futuristic Script Interface • Optimized UI Core • Neon System"
desc.TextColor3 = Color3.fromRGB(180,180,190)
desc.Font = Enum.Font.Gotham
desc.TextSize = 13
desc.TextWrapped = true
desc.TextXAlignment = Enum.TextXAlignment.Left
desc.Parent = frame

-- 🟣 Status pill
local pill = Instance.new("Frame")
pill.Size = UDim2.new(0,120,0,28)
pill.Position = UDim2.new(0,10,1,-40)
pill.BackgroundColor3 = Color3.fromRGB(40, 220, 160)
pill.BorderSizePixel = 0
pill.Parent = frame

Instance.new("UICorner", pill).CornerRadius = UDim.new(1,0)

local pillText = Instance.new("TextLabel")
pillText.Size = UDim2.new(1,0,1,0)
pillText.BackgroundTransparency = 1
pillText.Text = "ONLINE"
pillText.TextColor3 = Color3.fromRGB(0,0,0)
pillText.Font = Enum.Font.GothamBold
pillText.TextSize = 12
pillText.Parent = pill

-- ❌ Close button
local close = Instance.new("TextButton")
close.Size = UDim2.new(0,90,0,28)
close.Position = UDim2.new(1,-100,1,-40)
close.BackgroundColor3 = Color3.fromRGB(255,70,90)
close.Text = "CLOSE"
close.TextColor3 = Color3.fromRGB(255,255,255)
close.Font = Enum.Font.GothamBold
close.TextSize = 12
close.Parent = frame

Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

-- 🎬 Smooth intro animation
frame.Position = UDim2.new(0.5, 0, 0.55, 0)
frame.BackgroundTransparency = 1
top.BackgroundTransparency = 1

TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	Position = UDim2.new(0.5,0,0.5,0),
	BackgroundTransparency = 0
}):Play()

TweenService:Create(top, TweenInfo.new(0.6), {
	BackgroundTransparency = 0
}):Play()

-- ❌ Close animation
close.MouseButton1Click:Connect(function()
	local tween = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
		Size = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1
	})
	tween:Play()
	tween.Completed:Wait()
	gui:Destroy()
end)
