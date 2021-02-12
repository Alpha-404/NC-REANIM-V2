-------------------------------------------------------------------------------------------------------------

if game:GetService("Players").LocalPlayer.Character:FindFirstChild("NAP Client Reanim V2") then
	game:GetService("StarterGui"):SetCore("SendNotification",{Title="NAP Client Reanimate V2",Text='Already Reanimated',Duration=5})
	return
end

game:GetService("StarterGui"):SetCore("SendNotification",{Title="NAP Client Reanimate V2",Text='Loading Reanimate...',Duration=5})
local p = game:GetService("Players").LocalPlayer
local char = p.Character

function Joint(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1);
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1);
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 67752;
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1);
	local AttachmentB=Instance.new('Attachment',Part0);
	local AttachmentC=Instance.new('Attachment',Part1);
	local AttachmentD=Instance.new('Attachment',Part0);
	AttachmentC.Orientation = Angle
	AttachmentA.Position = Position
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentC;
	AlignOri.Attachment0 = AttachmentD;
end

game:GetService("Players").LocalPlayer.Character.Archivable = true 

local CloneChar = game:GetService("Players").LocalPlayer.Character:Clone()

game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 0 
game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 0 
game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate = false

local FalseChar = Instance.new("Model", workspace)
FalseChar.Name = "TempChar"
Instance.new("Part",FalseChar).Name = "Head" 
Instance.new("Part",FalseChar).Name = "Torso" 
Instance.new("Humanoid",FalseChar).Name = "Humanoid"
game:GetService("Players").LocalPlayer.Character = FalseChar
game:GetService("Players").LocalPlayer.Character.Humanoid.Name = "Fake"

local Clone = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fake"):Clone()
Clone.Parent = game:GetService("Players").LocalPlayer.Character
Clone.Name = "Humanoid"

game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fake"):Destroy() 
game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0 
game:GetService("Players").LocalPlayer.Character = workspace[game:GetService("Players").LocalPlayer.Name] 
wait(5.2) 
game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
CloneChar.Parent = workspace
CloneChar.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
wait() 
CloneChar.Humanoid.BreakJointsOnDeath = false
workspace.Camera.CameraSubject = CloneChar.Humanoid 
CloneChar.Name = "Rig" 
CloneChar.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

if CloneChar.Head:FindFirstChild("face") then 
	CloneChar.Head:FindFirstChild("face"):Destroy() 
end
if workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face") then 
	workspace[game:GetService("Players").LocalPlayer.Name].Head:FindFirstChild("face").Parent = CloneChar.Head 
end

FalseChar:Destroy()

local DeadChar = workspace[game:GetService("Players").LocalPlayer.Name]

local con
function Noclip()
	for idk,c in next, DeadChar:GetDescendants() do
		if c:IsA("BasePart") then
			c.CanCollide = false
		end 
	end
	for idk,c in next, CloneChar:GetDescendants() do
		if c:IsA("BasePart") then
			c.CanCollide = false
		end 
	end
end
con = game:GetService("RunService").Stepped:Connect(Noclip)

local Reset = Instance.new("BindableEvent")
Reset.Event:Connect(function()
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
	Reset:Destroy()
	DeadChar:Destroy()
	CloneChar:Destroy()
	local m = Instance.new("Model", workspace)
	m.Name = "UwU"
	local h = Instance.new("Humanoid", m)
	wait()
	p.Character = m
	wait()
	h.Health = 0
	p.ChildAdded:Wait()
	m:Destroy()
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", Reset)

Joint(DeadChar["Head"],CloneChar["Head"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Joint(DeadChar["Torso"],CloneChar["Torso"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Joint(DeadChar["Left Arm"],CloneChar["Left Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Joint(DeadChar["Right Arm"],CloneChar["Right Arm"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Joint(DeadChar["Left Leg"],CloneChar["Left Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Joint(DeadChar["Right Leg"],CloneChar["Right Leg"],Vector3.new(0,0,0),Vector3.new(0,0,0))
Joint(DeadChar["HumanoidRootPart"],CloneChar["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))

for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		Joint(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
	end
end

for _,Bodyps in next, CloneChar:GetDescendants() do
	if Bodyps:IsA("BasePart") or Bodyps:IsA("Part") then
		Bodyps.Transparency = 1 
	end 
end

local speed = 2

for i,v in pairs(char:GetDescendants()) do
	if v:IsA("Clothing") or v:IsA("ShirtGraphic") then
		v:Destroy()
	end
end

if c:FindFirstChild("ForceField") then
	c.ForceField:Destroy() 
end

game:GetService("StarterGui"):SetCore("SendNotification",{Title="NAP Client Reanimate V2",Text='Reanimated',Duration=5})

----------------------------------------------------------------------------------