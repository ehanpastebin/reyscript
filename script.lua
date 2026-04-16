--// FPS BOOST SYSTEM (by Rey)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "FPSBoostLoader"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

---------------------------------------------------
-- 🌑 BACKGROUND LOADING SCREEN
---------------------------------------------------
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(10,10,10)
bg.BorderSizePixel = 0
bg.Parent = gui

---------------------------------------------------
-- ✨ TITLE TEXT
---------------------------------------------------
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1,0,0,80)
text.Position = UDim2.new(0,0,0.45,0)
text.BackgroundTransparency = 1
text.Text = "FPS Boost made by Rey"
text.TextColor3 = Color3.fromRGB(180,180,180)
text.Font = Enum.Font.FredokaOne
text.TextSize = 32
text.Parent = bg

-- 🎨 Gradient
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(80,80,80)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(20,20,20))
}
grad.Rotation = 0
grad.Parent = text

-- 🖤 Stroke
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0,0,0)
stroke.Thickness = 2
stroke.Parent = text

---------------------------------------------------
-- 🎬 LOADING ANIMATION
---------------------------------------------------
for i = 1, 20 do
	text.TextTransparency = 1 - (i * 0.05)
	task.wait(0.03)
end

task.wait(1)

---------------------------------------------------
-- ⚡ FPS BOOST CORE
---------------------------------------------------

-- 🌫 Lighting optimize
Lighting.GlobalShadows = false
Lighting.FogEnd = 1e10
Lighting.Brightness = 1
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0

-- 🧹 Remove textures / effects
for _, v in pairs(workspace:GetDescendants()) do
	if v:IsA("Decal") or v:IsA("Texture") then
		v:Destroy()
	end

	if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
		v.Enabled = false
	end

	if v:IsA("BasePart") then
		v.Material = Enum.Material.Plastic
		v.CastShadow = false
	end
end

-- 🔁 Anti-lag for new objects
workspace.DescendantAdded:Connect(function(v)
	task.wait()

	if v:IsA("Decal") or v:IsA("Texture") then
		v:Destroy()
	end

	if v:IsA("ParticleEmitter") or v:IsA("Trail") then
		v.Enabled = false
	end

	if v:IsA("BasePart") then
		v.CastShadow = false
		v.Material = Enum.Material.Plastic
	end
end)

---------------------------------------------------
-- 🎬 EXIT TRANSITION
---------------------------------------------------
task.wait(1)

for i = 1, 20 do
	bg.BackgroundTransparency = i * 0.05
	text.TextTransparency = i * 0.05
	task.wait(0.02)
end

gui:Destroy()
