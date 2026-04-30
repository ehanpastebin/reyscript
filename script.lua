if getgenv().VeyHubExecuted then
game:GetService("Players").LocalPlayer.PlayerGui.Global.Messages.Use:Fire("Script Is Already Loaded, rejoin of you want to re-execute", "Error")
 return
end
getgenv().VeyHubExecuted = true
--[[-------------------------------------------------------
 CONTROLLING THE UI EXAMPLE 
-----------------------------------------------------------

_G.VeyHubLibBtn.{Flag}.Visible = true
_G.VeyHubLibBtn.{Flag}:Set(true)
_G.VeyHubLibBtn.{Flag}:Destroy()
_G.VeyHubLibBtn.{Flag}:Destroy()


local ButtonLib = loadstring(game:HttpGet("https://VEY HUB.vercel.app/Module/Button-lib.lua"))()

-- 1. Create a Button that starts INVISIBLE
ButtonLib.Create:Button({
Text = "SECRET BUTTON",
Flag = "SecretBtn",
Visible = false, -- Starts hidden
Callback = function() print("You found me!") end
}).Position = UDim2.new(0.5, -125, 0.2, 0)

-- 2. Create a Toggle
ButtonLib.Create:Toggle({
Text = "AUTO CARRY",
Flag = "CarryToggle",
Default = false,
Visible = true,
Callback = function(s) print("Carry is:", s) end
}).Position = UDim2.new(0.5, -125, 0.4, 0)

]]
-- load shit button
local ButtonLib = loadstring(game:HttpGet("https://VEY HUB.vercel.app/Module/Button-lib.lua"))()
-- shit leaderboard exit
coroutine.wrap(function() task.wait(3) while true do local success, err = pcall(function() local leaderboard = game:GetService("Players").LocalPlayer.PlayerGui.Global.Leaderboard if leaderboard then local exitButton = leaderboard.Center.XboxExit if exitButton then exitButton.Visible = true exitButton.Exit.MouseButton1Click:Connect(function() leaderboard.Visible = false end) end end end) if not success then warn("Leaderboard exit button setup failed:", err) end task.wait(5) end end)()
--macro command gui
Players = game:GetService("Players")
UserInputService = game:GetService("UserInputService")
RunService = game:GetService("RunService")
ReplicatedStorage = game:GetService("ReplicatedStorage")
HttpService = game:GetService("HttpService")
Player = Players.LocalPlayer
PlayerGui = Player:WaitForChild("PlayerGui")
CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
task.wait(5) -- add little delay prevent vip command not loading
if not (player:GetAttribute("VIPCommandsAccess") == true) then
else
function getDpiScale()
 local Players = game:GetService("Players")
 local player = Players.LocalPlayer
 local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
 local frame = Instance.new("Frame", gui)
 frame.Size = UDim2.new(0, 100, 0, 100)
  task.wait()
  local scale = frame.AbsoluteSize.X / 100
  gui:Destroy()
  return math.clamp(math.round(scale * 10) / 10, 1, 3)
end
local DPI = getDpiScale()
local FILLED = "●"
local OPEN = "○"

function safeReadFile(path)
if not readfile then return nil end
local success, content = pcall(readfile, path)
return success and content or nil
end

function safeWriteFile(path, data)
if not writefile then return false end
local success, _ = pcall(writefile, path, data)
return success
end

local CONFIG_DIR = "VeyHub"
local CONFIG_FILE = CONFIG_DIR .. "/EvadeMacroVipCMD.json"
if isfolder and not isfolder(CONFIG_DIR) then makefolder(CONFIG_DIR) end

local Presets = {}

function serializeMacro(macro)
local ser = table.clone(macro)
ser.keybind = macro.keybind.Name
if macro.startCondition then
ser.startCondition = macro.startCondition
ser.startRoundType = macro.startRoundType
ser.startTimeType = macro.startTimeType
ser.startTimeValue = macro.startTimeValue
ser.startTimeUnit = macro.startTimeUnit
ser.startRoundsCompleted = macro.startRoundsCompleted
end
return ser
end

function deserializeMacro(ser)
local macro = table.clone(ser)
macro.keybind = ser.keybind and Enum.KeyCode[ser.keybind] or Enum.KeyCode.F
if ser.startCondition then
macro.startCondition = ser.startCondition
macro.startRoundType = ser.startRoundType
macro.startTimeType = ser.startTimeType
macro.startTimeValue = ser.startTimeValue
macro.startTimeUnit = ser.startTimeUnit
macro.startRoundsCompleted = ser.startRoundsCompleted
end
return macro
end

function loadPresets()
local data = safeReadFile(CONFIG_FILE)
if data then
local success, decoded = pcall(HttpService.JSONDecode, HttpService, data)
if success and typeof(decoded) == "table" then
Presets = {}
for name, arr in pairs(decoded) do
Presets[name] = {}
for i, ser in ipairs(arr) do
Presets[name][i] = deserializeMacro(ser)
end
end
end
end
end

function savePresets()
local toSave = {}
for name, macros in pairs(Presets) do
toSave[name] = {}
for i, macro in ipairs(macros) do
toSave[name][i] = serializeMacro(macro)
end
end
local json = HttpService:JSONEncode(toSave)
safeWriteFile(CONFIG_FILE, json)
end

loadPresets()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MacroManagerGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Enabled = false
ScreenGui.Parent = CoreGui
ScreenGui.ScreenInsets = Enum.ScreenInsets.None
ScreenGui.DisplayOrder = 6
local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Size = UDim2.new(0,420*DPI,0,520*DPI)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = Color3.fromRGB(18,18,28)
Main.ClipsDescendants = true
Main.Active = true
Main.Parent = ScreenGui
Instance.new("UICorner",Main).CornerRadius = UDim.new(0,12)

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1,0,0,36*DPI)
TitleBar.BackgroundColor3 = Color3.fromRGB(28,18,45)
TitleBar.Parent = Main
TitleBar.Active = true
local Title = Instance.new("TextLabel")
Title.Name = "TitleLabel"
Title.Size = UDim2.new(1,-84,1,0)
Title.Position = UDim2.new(0,8,0,0)
Title.BackgroundTransparency = 1
Title.Text = "VEY HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16*DPI
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local ConfigBtn = Instance.new("TextButton")
ConfigBtn.Name = "ConfigButton"
ConfigBtn.Size = UDim2.new(0,28,0,28)
ConfigBtn.Position = UDim2.new(1,-68,0,4)
ConfigBtn.BackgroundColor3 = Color3.fromRGB(170,85,255)
ConfigBtn.Text = "🗂️"
ConfigBtn.TextColor3 = Color3.new(1,1,1)
ConfigBtn.Font = Enum.Font.GothamBold
ConfigBtn.TextSize = 16*DPI
ConfigBtn.Parent = TitleBar
Instance.new("UICorner",ConfigBtn).CornerRadius = UDim.new(0,6)

local Close = Instance.new("TextButton")
Close.Name = "CloseButton"
Close.Size = UDim2.new(0,28,0,28)
Close.Position = UDim2.new(1,-32,0,4)
Close.BackgroundColor3 = Color3.fromRGB(255,85,170)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14*DPI
Close.Parent = TitleBar
Instance.new("UICorner",Close).CornerRadius = UDim.new(0,6)

Close.MouseButton1Click:Connect(function()
ScreenGui.Enabled = false
end)

local Scroll = Instance.new("ScrollingFrame")
Scroll.Name = "MacroScroll"
Scroll.Size = UDim2.new(1,-16,1,-128)
Scroll.Position = UDim2.new(0,8,0,44)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 5
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.Parent = Main

local Layout = Instance.new("UIListLayout",Scroll)
Layout.Name = "MacroListLayout"
Layout.Padding = UDim.new(0,6)

local NoMacrosLabel = Instance.new("TextLabel")
NoMacrosLabel.Name = "NoMacrosLabel"
NoMacrosLabel.Size = UDim2.new(1,-32,1,-100)
NoMacrosLabel.Position = UDim2.new(0,16,0,50)
NoMacrosLabel.BackgroundTransparency = 1
NoMacrosLabel.Text = "No VIP Command macros available"
NoMacrosLabel.TextColor3 = Color3.fromRGB(150,150,150)
NoMacrosLabel.Font = Enum.Font.Gotham
NoMacrosLabel.TextSize = 16*DPI
NoMacrosLabel.TextWrapped = true
NoMacrosLabel.Visible = true
NoMacrosLabel.Parent = Main

local CreateBtn = Instance.new("TextButton")
CreateBtn.Name = "CreateButton"
CreateBtn.Size = UDim2.new(1,-16,0,36)
CreateBtn.Position = UDim2.new(0,8,1,-44)
CreateBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
CreateBtn.Text = "+ New Macro"
CreateBtn.TextColor3 = Color3.new(1,1,1)
CreateBtn.Font = Enum.Font.GothamBold
CreateBtn.TextSize = 15*DPI
CreateBtn.Parent = Main
Instance.new("UICorner",CreateBtn).CornerRadius = UDim.new(0,8)

local DelayUnits = {"Ms","Sec","Minute","Hour","Day","Week","Year"}

function toMs(v,u)
local m = {Ms=1,Sec=1000,Minute=60000,Hour=3600000,Day=86400000,Week=604800000,Year=31536000000}
return (v or 0) * (m[u] or 1)
end

local TimeUnits = {"Ms","Second","Minute","Hour","Day","Week","Month","Year"}

function toSeconds(v,u)
local m = {Ms=0.001,Second=1,Minute=60,Hour=3600,Day=86400,Week=604800,Month=2629800,Year=31557600}
return (v or 0) * (m[u] or 1)
end

function formatTimeRemaining(seconds)
if seconds <= 0 then return "Done" end
local years = math.floor(seconds/31557600); seconds %= 31557600
local months = math.floor(seconds/2629800); seconds %= 2629800
local weeks = math.floor(seconds/604800); seconds %= 604800
local days = math.floor(seconds/86400); seconds %= 86400
local hours = math.floor(seconds/3600); seconds %= 3600
local mins = math.floor(seconds/60); seconds %= 60
local parts = {}
if years>0 then table.insert(parts,years.."y") end
if months>0 then table.insert(parts,months.."mo") end
if weeks>0 then table.insert(parts,weeks.."w") end
if days>0 then table.insert(parts,days.."d") end
if hours>0 then table.insert(parts,hours.."h") end
if mins>0 then table.insert(parts,mins.."m") end
if seconds > 0 and (#parts > 0 and seconds >= 1 or #parts == 0) then
local sec_str = seconds < 1 and string.format("%.1fs", seconds) or math.floor(seconds) .. "s"
table.insert(parts, sec_str)
end
return table.concat(parts," ")
end

local RoundTypes = {"Any","Round Start","Intermission"}
local TimeConditions = {"Any Time","Below","Above","At Certain Time"}
local RoundsCompletedOptions = {"1", "2", "3"}
local Macros = {}

function getRoundState()
local gameFolder = workspace:FindFirstChild("Game")
if gameFolder then
local stats = gameFolder:FindFirstChild("Stats")
if stats then
local roundStarted = stats:GetAttribute("RoundStarted")
if roundStarted ~= nil then
return roundStarted and "Round Start" or "Intermission"
end
end
end
return nil
end

function getRoundsCompleted()
local gameFolder = workspace:FindFirstChild("Game")
if gameFolder then
local stats = gameFolder:FindFirstChild("Stats")
if stats then
local rounds = stats:GetAttribute("RoundsCompleted")
return typeof(rounds) == "number" and rounds or 0
end
end
return 0
end

function updateNoMacrosLabel()
NoMacrosLabel.Visible = #Macros == 0
end

function updateCanvas()
task.defer(function()
Scroll.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y+10)
end)
end

local ConfirmPopup = nil

function showDeleteConfirm(data,idx,entryFrame)
if ConfirmPopup then ConfirmPopup:Destroy() end
ConfirmPopup = Instance.new("Frame")
ConfirmPopup.Name = "DeleteConfirmPopup"
ConfirmPopup.Size = UDim2.new(0,260*DPI,0,130*DPI)
ConfirmPopup.Position = UDim2.new(0.5,0,0.5,0)
ConfirmPopup.AnchorPoint = Vector2.new(0.5,0.5)
ConfirmPopup.BackgroundColor3 = Color3.fromRGB(30,30,40)
ConfirmPopup.ZIndex = 20
ConfirmPopup.Parent = ScreenGui
Instance.new("UICorner",ConfirmPopup).CornerRadius = UDim.new(0,12)
local msg = Instance.new("TextLabel")
msg.Text = "Delete this macro?"
msg.Size = UDim2.new(1,-20,0,50)
msg.Position = UDim2.new(0,10,0,10)
msg.BackgroundTransparency = 1
msg.TextColor3 = Color3.new(1,1,1)
msg.Font = Enum.Font.GothamBold
msg.TextSize = 15*DPI
msg.ZIndex = 21
msg.Parent = ConfirmPopup
local yes = Instance.new("TextButton")
yes.Size = UDim2.new(0.45,0,0,32)
yes.Position = UDim2.new(0.05,0,1,-40)
yes.BackgroundColor3 = Color3.fromRGB(255,85,170)
yes.Text = "Yes"
yes.TextColor3 = Color3.new(1,1,1)
yes.Font = Enum.Font.GothamBold
yes.TextSize = 13*DPI
yes.ZIndex = 21
yes.Parent = ConfirmPopup
Instance.new("UICorner",yes).CornerRadius = UDim.new(0,8)
local no = Instance.new("TextButton")
no.Size = UDim2.new(0.45,0,0,32)
no.Position = UDim2.new(0.5,0,1,-40)
no.BackgroundColor3 = Color3.fromRGB(100,100,100)
no.Text = "No"
no.TextColor3 = Color3.new(1,1,1)
no.Font = Enum.Font.GothamBold
no.TextSize = 13*DPI
no.ZIndex = 21
no.Parent = ConfirmPopup
Instance.new("UICorner",no).CornerRadius = UDim.new(0,8)
no.MouseButton1Click:Connect(function()
ConfirmPopup:Destroy(); ConfirmPopup=nil
end)
yes.MouseButton1Click:Connect(function()
if data.running and data.stopMacro then 
data.stopMacro() 
end
entryFrame:Destroy()
table.remove(Macros,idx)
updateNoMacrosLabel()
updateCanvas()
ConfirmPopup:Destroy(); ConfirmPopup=nil
end)
end

local MacroManager = {}
MacroManager.__index = MacroManager

function MacroManager.new(data)
local self = setmetatable({}, MacroManager)

self.data = data
self.running = false
self.pausedByCondition = false
self.connections = {}
self.startTime = nil
self.cycleCount = nil
self.maxCycles = nil
self.nextRun = nil

return self
end

function MacroManager:cleanupConnections()
for i, conn in ipairs(self.connections) do
if conn and conn.Connected then
pcall(function() conn:Disconnect() end)
end
self.connections[i] = nil
end
self.connections = {}
end

function MacroManager:checkTimeCondition()
if not self.data.startTimeType or self.data.startTimeType == "Any Time" then
return true
end
local gameFolder = workspace:FindFirstChild("Game")
if not gameFolder then return false end
local stats = gameFolder:FindFirstChild("Stats")
if not stats then return false end
local timerValue = stats:GetAttribute("Timer")
if not timerValue then return false end
local targetTime = toSeconds(self.data.startTimeValue or 0, self.data.startTimeUnit or "Second")
if self.data.startTimeType == "Below" then
return timerValue < targetTime
elseif self.data.startTimeType == "Above" then
return timerValue > targetTime
elseif self.data.startTimeType == "At Certain Time" then
return math.abs(timerValue - targetTime) < 0.5
end
return false
end

function MacroManager:checkRoundCondition()
if not self.data.startRoundType or self.data.startRoundType == "Any" then
return true
end
local currentRoundState = getRoundState()
return currentRoundState == self.data.startRoundType
end

function MacroManager:checkRoundsCompletedCondition()
if not self.data.startRoundsCompleted or self.data.startRoundsCompleted == "Any" then
return true
end
local required = tonumber(self.data.startRoundsCompleted)
local actual = getRoundsCompleted()
return actual >= required
end

function MacroManager:resumeFromPause()
if self.pausedByCondition and self:checkRoundCondition() and self:checkTimeCondition() and self:checkRoundsCompletedCondition() then
self.pausedByCondition = false
if self.status then
self.status.Text = "ON"
self.status.TextColor3 = Color3.fromRGB(0,255,0)
end
if self.updateCountdown then self:updateCountdown() end
end
end

function MacroManager:pauseDueToCondition()
if self.running and not self.pausedByCondition then
self.pausedByCondition = true
if self.status then
self.status.Text = "PAUSED"
self.status.TextColor3 = Color3.fromRGB(255,150,50)
end
if self.updateCountdown then self:updateCountdown() end
end
end

function MacroManager:monitorConditions()
if not self.running then return end
if self:checkRoundCondition() and self:checkTimeCondition() and self:checkRoundsCompletedCondition() then
self:resumeFromPause()
else
self:pauseDueToCondition()
end
end

function MacroManager:startCountdownUpdate()
if self.countdownConn and self.countdownConn.Connected then 
self.countdownConn:Disconnect() 
end

self.countdownConn = RunService.Heartbeat:Connect(function()
if not self.running or not self.countdown then return end

if not self.running then
self.countdown.Text = "Ready"
self.countdown.TextColor3 = Color3.fromRGB(255,200,100)
if self.countdownConn and self.countdownConn.Connected then 
self.countdownConn:Disconnect() 
end
return
end

local elapsed = tick() - self.startTime
local delayMs = toMs(self.data.delayValue, self.data.delayUnit)
local delaySec = delayMs / 1000
local nextInSec = delaySec - ((tick() - self.startTime) % delaySec)

if self.data.stopMode == "time" then
local remaining = math.max(0, self.data.stopTime - elapsed)
self.countdown.Text = self.pausedByCondition and "PAUSED (cond)" or formatTimeRemaining(remaining)
self.countdown.TextColor3 = remaining<=0 and Color3.fromRGB(255,100,100) or (self.pausedByCondition and Color3.fromRGB(255,150,50) or Color3.fromRGB(100,255,100))
elseif self.data.stopMode == "cycles" then
local left = math.max(0, (self.maxCycles or 0) - self.cycleCount)
self.countdown.Text = self.pausedByCondition and "PAUSED (cond)" or left.." cycle"..(left==1 and "" or "s").." left | "..formatTimeRemaining(nextInSec)
self.countdown.TextColor3 = self.pausedByCondition and Color3.fromRGB(255,150,50) or Color3.fromRGB(100,255,100)
else
self.countdown.Text = self.pausedByCondition and "PAUSED (cond)" or formatTimeRemaining(nextInSec)
self.countdown.TextColor3 = self.pausedByCondition and Color3.fromRGB(255,150,50) or Color3.fromRGB(100,255,100)
end
end)

table.insert(self.connections, self.countdownConn)
end

function MacroManager:updateCountdown()
if not self.countdown then return end

if not self.running then
self.countdown.Text = "Ready"
self.countdown.TextColor3 = Color3.fromRGB(255,200,100)
return
end

self:startCountdownUpdate()
end

function MacroManager:startMacro()
if self.running then return end

self.running = true
self.pausedByCondition = false
self.startTime = tick()
self.cycleCount = 0
self.maxCycles = (self.data.stopMode=="cycles") and self.data.stopCycles or nil
self.nextRun = tick()

local delayMs = toMs(self.data.delayValue, self.data.delayUnit)

self:cleanupConnections()

local mainConn = RunService.Heartbeat:Connect(function()
if not self.running or self.pausedByCondition then return end

local now = tick()
if now >= self.nextRun then
pcall(function()
ReplicatedStorage.Events.Admin.VIPCommand:InvokeServer(self.data.command)
end)
self.cycleCount += 1
self.nextRun = now + delayMs / 1000
end

if self.data.stopMode=="time" and (now - self.startTime >= self.data.stopTime) then 
self:stopMacro()
return 
end
if self.data.stopMode=="cycles" and self.cycleCount >= self.maxCycles then 
self:stopMacro()
return 
end
end)

table.insert(self.connections, mainConn)

if self.data.startCondition then
local monitorConn = RunService.Heartbeat:Connect(function()
self:monitorConditions()
end)
table.insert(self.connections, monitorConn)
end

local keyConn = UserInputService.InputBegan:Connect(function(inp, gp)
if gp or inp.KeyCode ~= self.data.keybind then return end
if self.running then
self:stopMacro()
else
self:startMacro()
end
end)

table.insert(self.connections, keyConn)

if self.startBtn then
self.startBtn.Text = "STOP"
self.startBtn.BackgroundColor3 = Color3.fromRGB(255,85,170)
end
if self.status then
self.status.Text = "ON"
self.status.TextColor3 = Color3.fromRGB(0,255,0)
end

self:updateCountdown()
end

function MacroManager:stopMacro()
self.running = false
self.pausedByCondition = false

self:cleanupConnections()

if self.startBtn then
self.startBtn.Text = "START"
self.startBtn.BackgroundColor3 = Color3.fromRGB(0,200,0)
end
if self.status then
self.status.Text = "OFF"
self.status.TextColor3 = Color3.fromRGB(255,100,100)
end
if self.countdown then
self.countdown.Text = "Ready"
self.countdown.TextColor3 = Color3.fromRGB(255,200,100)
end
end

function makeEntry(data, idx)
local f = Instance.new("Frame")
f.Name = "MacroEntry_" .. idx
f.Size = UDim2.new(1, 0, 0, 180)
f.BackgroundColor3 = Color3.fromRGB(35,35,50)
f.ZIndex = 2
f.Parent = Scroll
Instance.new("UICorner", f).CornerRadius = UDim.new(0,8)

local name = Instance.new("TextLabel")
name.Name = "MacroNameLabel"
name.Size = UDim2.new(0.6,0,0,22)
name.Position = UDim2.new(0,8,0,4)
name.BackgroundTransparency = 1
name.Text = data.name~="" and data.name or ("Macro "..idx)
name.TextColor3 = Color3.new(1,1,1)
name.Font = Enum.Font.GothamBold
name.TextSize = 13*DPI
name.TextXAlignment = Enum.TextXAlignment.Left
name.ZIndex = 3
name.Parent = f

local cmd = Instance.new("TextLabel")
cmd.Name = "CommandLabel"
cmd.Size = UDim2.new(1,-16,0,18)
cmd.Position = UDim2.new(0,8,0,26)
cmd.BackgroundTransparency = 1
cmd.Text = data.command
cmd.TextColor3 = Color3.f
