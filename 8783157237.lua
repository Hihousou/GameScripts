local function damage(e)
	if e.Humanoid.Health <= 0 then
		return
	end
	local tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
	local lRoot = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	local eRoot = e.HumanoidRootPart
	
	if not tool or not lRoot or not eRoot then
		return
	end
	local args = {
		[1] = tool,
		[2] = {
			["p"] = eRoot.Position,
			["pid"] = 1,
			["part"] = eRoot,
			["d"] = (lRoot.Position - eRoot.Position).Magnitude,
			["maxDist"] = (lRoot.Position - eRoot.Position).Magnitude+1,
			["h"] = e.Humanoid,
			["m"] = eRoot.Material.Plastic,
			["sid"] = 1,
			["t"] = 0.013683955117603506,
			["n"] = (lRoot.Position - eRoot.Position).Unit,
		}
	}

	game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit:FireServer(unpack(args))
end
local function damageall()
	for _,v in pairs(workspace.Enemy:GetChildren())do
		damage(v)
	end
	for _,v in pairs(workspace:GetChildren())do
		if v:FindFirstChild("EnemyNPCHandler")then
			damage(v) 
		end
	end
end
local function collectall()
	local localRoot = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	for _,v in pairs(workspace.Coin:Chidlren())do
		if v.Name == "TouchInterest" and v.Parent then
			firetouchinterest(localRoot,v,0)
		end
	end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hihousou/Hexploit/main/uilib.lua"))()
local Window = Library:Window("有感筆電⚔️槍戰")
Window:Toggle("AutoKill (equip weapon)",false,function(Bool)
	_G.AutoKill = Bool
end)
Window:Toggle("AutoCollect)",false,function(Bool)
	_G.AutoCollect = Bool
end)

task.spawn(function()
	while wait()do -- because throttling is awesome
		if _G.AutoKill then
			damageall()
		end
		if _G.AutoCollect then
			collectall() 
		end
	end
end)
