if game:GetService("Players").LocalPlayer.Character:FindFirstChild("NAP Client Reanim V2") then
	game:GetService("StarterGui"):SetCore("SendNotification",{Title="NAP Client Reanimate V2",Text='Already Reanimated',Duration=5})
	return
end

game:GetService("StarterGui"):SetCore("SendNotification",{Title="NAP Client Reanimate V2",Text='Loading Reanimate...',Duration=5})
local p = game:GetService("Players").LocalPlayer
local char = p.Character

function Joint(P1,P2,Pos,Rot)
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
	local AttC=Instance.new('Attachment',P2);
	local AttD=Instance.new('Attachment',P1);
	AttC.Orientation = Rot
	AttA.Position = Pos
	AlignP.Attachment1 = AttA;
	AlignP.Attachment0 = AttB;
	AlignO.Attachment1 = AttC;
	AlignO.Attachment0 = AttD;
	AttA.Name = "AlignP" .. P1.Name
	AttB.Name = "AlignP" .. P1.Name
	AttC.Name = "AlignO" .. P1.Name
	AttD.Name = "AlignO" .. P1.Name
end

game:GetService("Players").LocalPlayer.Character.Archivable = true 

if char.Humanoid.RigType == Enum.HumanoidRigType.R6 then
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
	game:GetService("Players").LocalPlayer.Character = char
	wait(game:GetService("Players").RespawnTime + 0.2)
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

	local NCL = game:GetService("RunService").Stepped:Connect(function()
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
	end)

	local LookVectorP = Instance.new("Part", workspace) 
	LookVectorP.CanCollide = false 
	LookVectorP.Transparency = 1
	local ConvertVector = game:GetService("RunService").Heartbeat:Connect(function()
		local lookVec = workspace.Camera.CFrame.lookVector
		local Root = CloneChar["HumanoidRootPart"]
		LookVectorP.Position = Root.Position
		LookVectorP.CFrame = CFrame.new(LookVectorP.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
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

	function MoveClone(X,Y,Z)
		LookVectorP.CFrame = LookVectorP.CFrame * CFrame.new(-X,Y,-Z)
		CloneChar.Humanoid.WalkToPoint = LookVectorP.Position
	end

	local clonemover = game:GetService("RunService").Stepped:Connect(function()
		if WDown then 
			MoveClone(0,0,1e4) 
		end
		if ADown then 
			MoveClone(1e4,0,0) 
		end
		if SDown then 
			MoveClone(0,0,-1e4) 
		end
		if DDown then 
			MoveClone(-1e4,0,0) 
		end
		if SpaceDown then 
			CloneChar["Humanoid"].Jump = true 
		end
		if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
			workspace["Rig"].Humanoid.WalkToPoint = workspace["Rig"].HumanoidRootPart.Position 
		end
	end)

	local Reset = Instance.new("BindableEvent")
	Reset.Event:Connect(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
		KD:Disconnect()
		ConvertVector:Disconnect()
		clonemover:Disconnect()
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

	if CloneChar:FindFirstChild("ForceField") then
		CloneChar.ForceField:Destroy() 
	end
	CloneChar.Head.face:Destroy()

elseif char.Humanoid.RigType == Enum.HumanoidRigType.R15 then

	game:GetService("Players").LocalPlayer.Character.Archivable = true 

	local CloneChar = game:GetObjects("rbxassetid://6297951239")[1]

	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 0 
	game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 0 
	game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate = false

	local FalseChar = Instance.new("Model", workspace)
	FalseChar.Name = "TempChar"
	Instance.new("Part",FalseChar).Name = "Head" 
	Instance.new("Part",FalseChar).Name = "UpperTorso" 
	Instance.new("Humanoid",FalseChar).Name = "Humanoid"
	game:GetService("Players").LocalPlayer.Character = FalseChar
	game:GetService("Players").LocalPlayer.Character.Humanoid.Name = "Fake"

	local Clone = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fake"):Clone()
	Clone.Parent = game:GetService("Players").LocalPlayer.Character
	Clone.Name = "Humanoid"

	game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fake"):Destroy() 
	game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0 
	game:GetService("Players").LocalPlayer.Character = workspace[game:GetService("Players").LocalPlayer.Name] 
	wait(game:GetService("Players").RespawnTime + 0.2)
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

	local NCL = game:GetService("RunService").Stepped:Connect(function()
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
	end)

	local LookVectorP = Instance.new("Part", workspace) 
	LookVectorP.CanCollide = false 
	LookVectorP.Transparency = 1
	local ConvertVector = game:GetService("RunService").Heartbeat:Connect(function()
		local lookVec = workspace.Camera.CFrame.lookVector
		local Root = CloneChar["HumanoidRootPart"]
		LookVectorP.Position = Root.Position
		LookVectorP.CFrame = CFrame.new(LookVectorP.Position, Vector3.new(lookVec.X * 9999, lookVec.Y, lookVec.Z * 9999))
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

	function MoveClone(X,Y,Z)
		LookVectorP.CFrame = LookVectorP.CFrame * CFrame.new(-X,Y,-Z)
		CloneChar.Humanoid.WalkToPoint = LookVectorP.Position
	end

	local clonemover = game:GetService("RunService").Stepped:Connect(function()
		if WDown then 
			MoveClone(0,0,1e4) 
		end
		if ADown then 
			MoveClone(1e4,0,0) 
		end
		if SDown then 
			MoveClone(0,0,-1e4) 
		end
		if DDown then 
			MoveClone(-1e4,0,0) 
		end
		if SpaceDown then 
			CloneChar["Humanoid"].Jump = true 
		end
		if WDown ~= true and ADown ~= true and SDown ~= true and DDown ~= true then
			workspace["Rig"].Humanoid.WalkToPoint = workspace["Rig"].HumanoidRootPart.Position 
		end
	end)

	local Reset = Instance.new("BindableEvent")
	Reset.Event:Connect(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
		KD:Disconnect()
		ConvertVector:Disconnect()
		clonemover:Disconnect()
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
	Joint(DeadChar["UpperTorso"],CloneChar["Torso"],Vector3.new(0,0.2,0),Vector3.new(0,0,0))
	Joint(DeadChar["LowerTorso"],CloneChar["Torso"],Vector3.new(0,-0.78,0),Vector3.new(0,0,0))
	Joint(DeadChar["LeftUpperArm"],CloneChar["Left Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
	Joint(DeadChar["LeftLowerArm"],CloneChar["Left Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
	Joint(DeadChar["LeftHand"],CloneChar["Left Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))
	Joint(DeadChar["RightUpperArm"],CloneChar["Right Arm"],Vector3.new(0,0.375,0),Vector3.new(0,0,0))
	Joint(DeadChar["RightLowerArm"],CloneChar["Right Arm"],Vector3.new(0,-0.215,0),Vector3.new(0,0,0))
	Joint(DeadChar["RightHand"],CloneChar["Right Arm"],Vector3.new(0,-0.825,0),Vector3.new(0,0,0))

	Joint(DeadChar["LeftUpperLeg"],CloneChar["Left Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
	Joint(DeadChar["LeftLowerLeg"],CloneChar["Left Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
	Joint(DeadChar["LeftFoot"],CloneChar["Left Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))
	Joint(DeadChar["RightUpperLeg"],CloneChar["Right Leg"],Vector3.new(0,0.575,0),Vector3.new(0,0,0))
	Joint(DeadChar["RightLowerLeg"],CloneChar["Right Leg"],Vector3.new(0,-0.137,0),Vector3.new(0,0,0))
	Joint(DeadChar["RightFoot"],CloneChar["Right Leg"],Vector3.new(0,-0.787,0),Vector3.new(0,0,0))

	Joint(DeadChar["HumanoidRootPart"],CloneChar["HumanoidRootPart"],Vector3.new(0,0,0),Vector3.new(0,0,0))

	for _,v in next, DeadChar:GetChildren() do
		if v:IsA("Accessory") and CloneChar:FindFirstChild(v.Name) then
			Joint(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
		end
	end

	for _,Bodyps in next, CloneChar:GetDescendants() do
		if Bodyps:IsA("BasePart") or Bodyps:IsA("Part") then
			Bodyps.Transparency = 1 
		end 
	end

	if DeadChar.Head:FindFirstChild("Neck") then
		game.Players.LocalPlayer.Character:BreakJoints()
	end
	
	CloneChar.Head.face:Destroy()
end
game:GetService("StarterGui"):SetCore("SendNotification",{Title="NAP Client Reanimate V2",Text='Reanimated',Duration=5})
