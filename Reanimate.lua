-------------------------------------------------------------------------------------------------------------

if game:GetService("Players").LocalPlayer.Character:FindFirstChild("NAP Client Reanim V2") then
	game:GetService("StarterGui"):SetCore("SendNotification",{Title="NAP Client Reanimate V2",Text='Already Reanimated',Duration=5})
	return
end

game:GetService("StarterGui"):SetCore("SendNotification",{Title="NAP Client Reanimate V2",Text='Loading Reanimate...',Duration=5})
local p = game:GetService("Players").LocalPlayer
local char = p.Character
local UserInputService = game:GetService("UserInputService")
local NC

game:GetService("Players").LocalPlayer.Character.Archivable = true

local temp = Instance.new("Model", workspace)
Instance.new("Humanoid",temp)
temp.Name = "Fred"
p.Character = temp
if char:FindFirstChildOfClass("Humanoid"):FindFirstChild("Animator") then
	char:FindFirstChildOfClass("Humanoid").Animator.Parent = temp.Humanoid
end
local rig
if char:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
	rig = "R15"
else
	rig = "R6"
end
wait()
local Reset = Instance.new("BindableEvent")
Reset.Event:Connect(function()
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
	Reset:Destroy()
	local m = Instance.new("Model", workspace)
	m.Name = "UwU"
	local h = Instance.new("Humanoid", m)
	char.Dummy:Destroy()
	p.Character = char
	p.Character:Destroy()
	wait()
	p.Character = m
	wait()
	h.Health = 0
	p.ChildAdded:Wait()
	m:Destroy()
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", Reset)
char.Humanoid:Destroy()
local humanoid = Instance.new("Humanoid", char)
humanoid.RequiresNeck = false
humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
humanoid.HealthDisplayDistance = Enum.HumanoidHealthDisplayType.AlwaysOff
if rig == "R15" then
	humanoid.RigType = Enum.HumanoidRigType.R15
	humanoid.HipHeight = 2.19
else
	humanoid.RigType = Enum.HumanoidRigType.R6
end
p.Character = char
workspace.CurrentCamera.CameraSubject = char
local BaseChar = char:Clone()
wait(0.5)
if char:FindFirstChild("Animate") then
	char.Animate:Destroy()
end
if humanoid:FindFirstChild("Animator") then
	humanoid:FindFirstChild("Animator"):Destroy()
end
wait()
temp:Destroy()

for i,v in pairs(BaseChar:GetChildren()) do
	if v:IsA("Accessory") then 
		v:Destroy() 
	end
	if v:IsA("BasePart") then
		v.Transparency = 1
	end
	if v:IsA("ForceField") then
		v:Destroy()
	end
end 

-----------------------------------------------------------------------

NC = game:GetService('RunService').Stepped:Connect(function()
	if p.Character ~= nil then
		for _, child in pairs(char:GetDescendants()) do
			if child:IsA("BasePart") then
				child.CanCollide = false
			end
		end
		for _, child in pairs(BaseChar:GetDescendants()) do
			if child:IsA("BasePart") then
				child.CanCollide = false
			end
		end
	end
end)

spawn(function()
	p.CharacterAdded:Wait()
	NC:Disconnect()
end)

-----------------------------------------------------------------------
for i,c in pairs(char:GetChildren()) do
	if c:IsA("BasePart") then
		local att0 = Instance.new("Attachment",c)
		att0.Orientation = Vector3.new(0, 0, 0)
		att0.Position = Vector3.new(0, 0, 0)
		att0.Name = c.Name

		local att1 = Instance.new("Attachment",BaseChar[c.Name])

		local ap = Instance.new("AlignPosition",c)
		ap.Attachment0 = att0
		ap.Attachment1 = att1
		ap.RigidityEnabled = true 


		local ao = Instance.new("AlignOrientation",c) 
		ao.Attachment0 = att0
		ao.Attachment1 = att1
		ao.RigidityEnabled = true
	end
end
-------------------------------------------------------------------------

Instance.new("BoolValue", BaseChar).Name = "NAP Client Reanim V2"

-------------------------------------------------------------------------

for i,v in pairs(char:GetDescendants()) do
	if v:IsA("Motor6D") and v.Name ~= "Neck" then
		v:Destroy()
	end
end

BaseChar.Parent = char
p.Character = BaseChar
BaseChar.Name = "Dummy"
workspace.CurrentCamera.CameraSubject = BaseChar
BaseChar.Head.face:Destroy()

game:GetService("StarterGui"):SetCore("SendNotification",{Title="NAP Client Reanimate V2",Text='Reanimated',Duration=5})

----------------------------------------------------------------------------------
