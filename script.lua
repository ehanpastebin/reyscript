--// Minimal Premium Community UI
--// By Rey

local linkToCopy = "https://your-link-here.com" -- ganti sendiri

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "CommunityUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 380, 0, 170)
frame.Position = UDim2.new(0.5, -190, 0.5, -85)
frame.BackgroundColor3 = Color3.fromRGB(18,18,18)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255,0,0)
stroke.Thickness = 1.5
stroke.Transparency = 0.2

-- Shadow Feel
local glow = Instance.new("ImageLabel")
glow.Parent = frame
glow.BackgroundTransparency = 1
glow.Size = UDim2.new(1, 30, 1, 30)
glow.Position = UDim2.new(0, -15, 0, -15)
glow.Image = "rbxassetid://5028857084"
glow.ImageTransparency = 0.75
glow.ScaleType = Enum.ScaleType.Slice
glow.SliceCenter = Rect.new(24,24,276,276)
glow.ZIndex = 0

-- Title
local title = Instance.new("TextLabel")
title.Parent = frame
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -20, 0, 70)
title.Position = UDim2.new(0, 10, 0, 15)
title.Text = " You have been detected as not joining a community.!!"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextWrapped = true

-- Button
local button = Instance.new("TextButton")
button.Parent = frame
button.Size = UDim2.new(0.82, 0, 0, 45)
button.Position = UDim2.new(0.09, 0, 1, -60)
button.BackgroundColor3 = Color3.fromRGB(255,40,40)
button.Text = "COPY LINK"
button.TextColor3 = Color3.fromRGB(255,255,255)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.AutoButtonColor = true

local bcorner = Instance.new("UICorner", button)
bcorner.CornerRadius = UDim.new(0, 10)

-- Copy System
button.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(linkToCopy)
		button.Text = "COPIED!"
		wait(1.2)
		button.Text = "COPY LINK"
	else
		button.Text = "UNSUPPORTED"
		wait(1.2)
		button.Text = "COPY LINK"
	end
end)

-- Smooth Intro
frame.Size = UDim2.new(0,0,0,0)
game:GetService("TweenService"):Create(
	frame,
	TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
	{Size = UDim2.new(0,380,0,170)}
):Play()
