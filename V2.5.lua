function Joint(P1,P2)
	local AlignP = Instance.new('AlignPosition', P2);
	AlignP.ApplyAtCenterOfMass = true;
	AlignP.MaxForce = 67752;
	AlignP.MaxVelocity = math.huge/9e110;
	AlignP.ReactionForceEnabled = false;
	AlignP.Responsiveness = 200;
	AlignP.RigidityEnabled = true;
	local AlignO = Instance.new('AlignOrientation', P2);
	AlignO.MaxAngularVelocity = math.huge/9e110;
	AlignO.MaxTorque = 67752;
	AlignO.PrimaryAxisOnly = false;
	AlignO.ReactionTorqueEnabled = false;
	AlignO.Responsiveness = 200;
	AlignO.RigidityEnabled = true;
	local AttA=Instance.new('Attachment',P2);
	local AttB=Instance.new('Attachment',P1);
	AlignP.Attachment1 = AttA;
	AlignP.Attachment0 = AttB;
	AlignO.Attachment1 = AttA;
	AlignO.Attachment0 = AttB;
	AttA.Name = "Align" .. P1.Name
	AttB.Name = "Align" .. P1.Name
end

function Joint2(P1,P2, POS, ROT)
	local AlignP = Instance.new('AlignPosition', P2);
	AlignP.ApplyAtCenterOfMass = true;
	AlignP.MaxForce = 67752;
	AlignP.MaxVelocity = math.huge/9e110;
	AlignP.ReactionForceEnabled = false;
	AlignP.Responsiveness = 200;
	AlignP.RigidityEnabled = true;
	local AlignO = Instance.new('AlignOrientation', P2);
	AlignO.MaxAngularVelocity = math.huge/9e110;
	AlignO.MaxTorque = 67752;
	AlignO.PrimaryAxisOnly = false;
	AlignO.ReactionTorqueEnabled = false;
	AlignO.Responsiveness = 200;
	AlignO.RigidityEnabled = true;
	local AttA=Instance.new('Attachment',P2);
	local AttB=Instance.new('Attachment',P1);
	AlignP.Attachment1 = AttA;
	AlignP.Attachment0 = AttB;
	AlignO.Attachment1 = AttA;
	AlignO.Attachment0 = AttB;
	AttA.Name = "Align" .. P1.Name
	AttA.Rotation = ROT
	AttA.Position = POS
	AttB.Name = "Align" .. P1.Name
end

local p = game:GetService("Players").LocalPlayer
local c = p.Character
p.Character.Archivable = true 

spawn(function() --so we don't overwrite anything
	local temp = Instance.new("Model", workspace)
	Instance.new("Humanoid",temp)
	temp.Name = "Fred"
	p.Character = temp
	if c:FindFirstChildOfClass("Humanoid"):FindFirstChild("Animator") then
		c:FindFirstChildOfClass("Humanoid").Animator.Parent = temp.Humanoid
	end
	wait()
	local rig
	if c:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
		rig = "R15"
	else
		rig = "R6"
	end
	local Reset = Instance.new("BindableEvent")
	Reset.Event:Connect(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
		Reset:Destroy()
		local m = Instance.new("Model", workspace)
		m.Name = "UwU"
		local h = Instance.new("Humanoid", m)
		p.Character:Destroy()
		wait()
		p.Character = m
		wait()
		h.Health = 0
		p.ChildAdded:Wait()
		m:Destroy()
	end)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", Reset)
	c.Humanoid:Destroy()
	local humanoid = Instance.new("Humanoid", c)
	humanoid.RequiresNeck = false
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	humanoid.HealthDisplayDistance = Enum.HumanoidHealthDisplayType.AlwaysOff
	if rig == "R15" then
		humanoid.RigType = Enum.HumanoidRigType.R15
		humanoid.HipHeight = 2.19
	else
		humanoid.RigType = Enum.HumanoidRigType.R6
	end
	p.Character = c
	workspace.CurrentCamera.CameraSubject = c
	if c:FindFirstChild("Animate") then
		c.Animate.Disabled = true
		c.Animate.Disabled = false
	end
	wait()
	temp:Destroy()
end)
wait(0.5)

local clonec

if c.Humanoid.RigType == Enum.HumanoidRigType.R6 then
	clonec = p.Character:Clone()
	clonec.Parent = c 
	clonec.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
	wait() 
	clonec.Humanoid.BreakJointsOnDeath = false
	workspace.CurrentCamera.CameraSubject = clonec.Humanoid
	clonec.Name = "Rig" 
	clonec.Humanoid.DisplayDistanceType = "None"
	if clonec.Head:FindFirstChild("face") then clonec.Head.face:Destroy() end
else
	clonec = game:GetObjects("rbxassetid://6297951239")[1]
	clonec.Parent = c 
	clonec.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
	wait() 
	clonec.Humanoid.BreakJointsOnDeath = false
	workspace.CurrentCamera.CameraSubject = clonec.Humanoid
	clonec.Name = "Rig" 
	clonec.Humanoid.DisplayDistanceType = "None"
	if clonec.Head:FindFirstChild("face") then clonec.Head.face:Destroy() end
	for _,e in pairs(c:GetDescendants()) do
	if e:IsA("Accessory") then
		e:Clone().Parent = clonec
	end
end

end

for _,e in pairs(clonec:GetDescendants()) do
	if e:IsA("Accessory") then
		pcall(function() Joint(c[e.Name].Handle, e.Handle) end)
	end
end

c.Humanoid.Animator:Destroy()
c.Animate:Destroy()

c.HumanoidRootPart:Destroy()

local LookVectorPart = Instance.new("Part", workspace) 
LookVectorPart.CanCollide = false 
LookVectorPart.Transparency = 1
local ConvertVector = game:GetService("RunService").Heartbeat:Connect(function()
	local lookVec = workspace.CurrentCamera.CFrame.lookVector
	local Root = clonec["HumanoidRootPart"]
	LookVectorPart.Position = Root.Position
	LookVectorPart.CFrame = CFrame.new(LookVectorPart.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
end)

local WDown, ADown, SDown, DDown, SpaceDown = false, false, false, false, false

local KD = game:GetService("UserInputService").InputBegan:Connect(function(K, gay)
	if gay then return end
	if K.KeyCode == Enum.KeyCode.W then
		repeat
			wait()
			WDown = true 
		until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) == false
		WDown = false
	end
	if K.KeyCode == Enum.KeyCode.A then
		repeat
			wait()
			ADown = true 
		until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) == false
		ADown = false
	end
	if K.KeyCode == Enum.KeyCode.S then
		repeat
			wait()
			SDown = true 
		until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) == false
		SDown = false
	end
	if K.KeyCode == Enum.KeyCode.D then
		repeat
			wait()
			DDown = true 
		until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) == false
		DDown = false 
	end
	if K.KeyCode == Enum.KeyCode.Space then
		repeat
			wait()
			SpaceDown = true 
		until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) == false
		SpaceDown = false
	end 
end)

local function MoveClone(X,Y,Z)
	LookVectorPart.CFrame = LookVectorPart.CFrame * CFrame.new(-X,Y,-Z)
	clonec.Humanoid.WalkToPoint = LookVectorPart.Position
end

coroutine.wrap(function() 
	while true do 
		game:GetService("RunService").RenderStepped:Wait()
		if WDown then MoveClone(0,0,1e4) end
		if ADown then MoveClone(1e4,0,0) end
		if SDown then MoveClone(0,0,-1e4) end
		if DDown then MoveClone(-1e4,0,0) end
		if SpaceDown then clonec["Humanoid"].Jump = true end
		if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
			clonec.Humanoid.WalkToPoint = clonec.HumanoidRootPart.Position 
		end
	end 
end)()

local con
function NC()
	for _,c in next, clonec:GetDescendants() do
		if c:IsA("BasePart") then
			c.CanCollide = false 
		end 
	end
	for _,c in next, c:GetDescendants() do
		if c:IsA("BasePart") then
			c.CanCollide = false
		end 
	end 
end
con = game:GetService("RunService").Stepped:Connect(NC)

if c.Humanoid.RigType == Enum.HumanoidRigType.R6 then
	Joint(c["Head"],clonec["Head"])
	Joint(c["Torso"],clonec["Torso"])
	Joint(c["Left Arm"],clonec["Left Arm"])
	Joint(c["Right Arm"],clonec["Right Arm"])
	Joint(c["Left Leg"],clonec["Left Leg"])
	Joint(c["Right Leg"],clonec["Right Leg"])

	spawn(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			pcall(function() c["Torso"].CFrame = clonec["Torso"].CFrame end)
		end
	end)
elseif c.Humanoid.RigType == Enum.HumanoidRigType.R15 then
	Joint2(c["Head"], clonec["Head"], Vector3.new(0,0,0), Vector3.new(0,0,0))
	Joint2(c["UpperTorso"], clonec["Torso"], Vector3.new(0,0.2,0), Vector3.new(0,0,0))
	Joint2(c["LowerTorso"], clonec["Torso"], Vector3.new(0,-0.78,0), Vector3.new(0,0,0))
	Joint2(c["LeftUpperArm"], clonec["Left Arm"], Vector3.new(0,0.375,0), Vector3.new(0,0,0))
	Joint2(c["LeftLowerArm"], clonec["Left Arm"], Vector3.new(0,-0.215,0), Vector3.new(0,0,0))
	Joint2(c["LeftHand"], clonec["Left Arm"], Vector3.new(0,-0.825,0), Vector3.new(0,0,0))
	Joint2(c["RightUpperArm"], clonec["Right Arm"], Vector3.new(0,0.375,0), Vector3.new(0,0,0))
	Joint2(c["RightLowerArm"], clonec["Right Arm"], Vector3.new(0,-0.215,0) ,Vector3.new(0,0,0))
	Joint2(c["RightHand"], clonec["Right Arm"], Vector3.new(0,-0.825,0), Vector3.new(0,0,0))

	Joint2(c["LeftUpperLeg"], clonec["Left Leg"], Vector3.new(0,0.575,0), Vector3.new(0,0,0))
	Joint2(c["LeftLowerLeg"], clonec["Left Leg"], Vector3.new(0,-0.137,0), Vector3.new(0,0,0))
	Joint2(c["LeftFoot"], clonec["Left Leg"], Vector3.new(0,-0.787,0), Vector3.new(0,0,0))
	Joint2(c["RightUpperLeg"], clonec["Right Leg"], Vector3.new(0,0.575,0), Vector3.new(0,0,0))
	Joint2(c["RightLowerLeg"], clonec["Right Leg"], Vector3.new(0,-0.137,0), Vector3.new(0,0,0))
	Joint2(c["RightFoot"], clonec["Right Leg"], Vector3.new(0,-0.787,0), Vector3.new(0,0,0))
end

for _,c in pairs(clonec:GetDescendants()) do
	if c:IsA("BasePart") then
		c.Transparency = 1 
	end
	if c:IsA("ForceField") then
		c:Destroy() 
	end
end


	wait(game:GetService("Players").RespawnTime + .2)
	for i,v in pairs(c:GetDescendants()) do
		if v:IsA("Motor6D") and not v:IsDescendantOf(clonec) then
			v:Destroy()
		end
	end
