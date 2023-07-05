local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "ScriptMaster Hub | Ability Wars", HidePremium = false, SaveConfig = false})

-- TABS

local MAIN_TAB = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local MISC_TAB = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local BADGES_TAB = Window:MakeTab({
	Name = "Badges",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- CONFIGS

getgenv().aurareach = 20

local ANTI_VOID = Instance.new("Part")
ANTI_VOID.Parent = workspace
ANTI_VOID.Anchored = true
ANTI_VOID.Transparency = 1
ANTI_VOID.Position = Vector3.new(63, 15, -9)
ANTI_VOID.Size = Vector3.new(2048,1,2048)
ANTI_VOID.CanCollide = false

 -- BUTTONS

MAIN_TAB:AddToggle({
	Name = "Punch-Aura",
	Default = false,
	Callback = function(bool)
		getgenv().saura = bool

      while getgenv().saura do
         task.wait(.4)
      for i,v in pairs(game:GetService("Players"):GetChildren()) do
         if v.Character["Right Arm"]:FindFirstChild("SelectionBox") == nil and v ~= game.Players.LocalPlayer then
         local target = v.Character.HumanoidRootPart
         local mag = (target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
         if getgenv().aurareach > mag then
         local args = {
         [1] = workspace:WaitForChild(target.Parent.Name),
         [2] = Vector3.new(target.Position),
         [3] = 1.8757749795913696,
         [4] = game:GetService("Players"):WaitForChild(target.Parent.Name).Character:FindFirstChild("Head")
         }

         game:GetService("ReplicatedStorage"):WaitForChild("Remote Events"):WaitForChild("Punch"):FireServer(unpack(args))
      end
         end
            end
               end
	               end    
})

MAIN_TAB:AddSlider({
	Name = "Punch-Aura Reach",
	Min = 5,
	Max = 20,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "REACH",
	Callback = function(val)
      getgenv().aurareach = val
	end    
})

MAIN_TAB:AddToggle({
	Name = "Anti-Void",
	Default = false,
	Callback = function(bool)
		ANTI_VOID.CanCollide = bool
	end    
})

MAIN_TAB:AddSlider({
	Name = "Walkspeed",
	Min = 20,
	Max = 500,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "WS",
	Callback = function(val)
		game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = val
   end
})

MAIN_TAB:AddSlider({
	Name = "Jumppower",
	Min = 50,
	Max = 500,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JP",
	Callback = function(val)
		game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = val
	end    
})

MAIN_TAB:AddSlider({
	Name = "Hitbox (0 for normal)",
	Min = 0,
	Max = 20,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Hitbox",
	Callback = function(val)
         if val ~= 0 then
            game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Size = Vector3.new(val,val,val)
            game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Transparency = .6
         else
            game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Size = Vector3.new(1,2,1)
            game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Transparency = 0
         end
      end 
})

local function boss()
   if game.Workspace:FindFirstChild("Dog") then
      return "Dog";
   elseif game.Workspace:FindFirstChild("Cat") then
      return "Cat";
   elseif game.Workspace:FindFirstChild("Tree Lord") then
      return "Tree Lord";
   elseif game.Workspace:FindFirstChild("Mushroom King") then
      return "Mushroom King";
   elseif game.Workspace:FindFirstChild("Scarecrow") then
      return "Scarecrow";
   else
	  return "none";
   end
end

MISC_TAB:AddToggle({
	Name = "Auto-Kill Bosses",
	Default = false,
	Callback = function(bool)
      getgenv().autokillboss = bool
		while getgenv().autokillboss == true and boss() ~= "none" do
         local punch = boss()
         task.wait(.1)
         local args = {
         [1] = workspace:WaitForChild(punch),
         [2] = Vector3.new(workspace:WaitForChild(punch):WaitForChild("Right Leg").Position),
         [3] = 1.8757749795913696,
         [4] = workspace:WaitForChild(punch):WaitForChild("Right Leg")
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Remote Events"):WaitForChild("Punch"):FireServer(unpack(args))
      end
	end    
})

MISC_TAB:AddToggle({
	Name = "Destroy Nametag",
	Default = false,
	Callback = function(bool)
		getgenv().nametag = bool

		while getgenv().nametag do
			task.wait()
			pcall(function()
				game.Players.LocalPlayer.Character.Head["Name Tag"]:Destroy()
			end)
		end
	end    
})

MISC_TAB:AddToggle({
	Name = "Anti Cauldron",
	Default = false,
	Callback = function(bool)
		workspace.Main.Shop.Attic.Alchemy["Alchemist Cauldron"]["Character Kill"].CanTouch = not bool
	end
})

BADGES_TAB:AddButton({
	Name = "Get Boing",
	Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("Remote Events"):WaitForChild("BigMushroomEvent"):FireServer()
  	end    
})

local cake = true

BADGES_TAB:AddButton({
	Name = "Get Cake",
	Callback = function()
		if cake == true then
		cake = false
      	local cframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

      	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(160,271,29)
      	task.wait(.1)
      	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
		cake = true
  	end    
end
})


local ascend = true

BADGES_TAB:AddButton({
	Name = "Get Ascend",
	Callback = function()
		if ascend == true then
		if game.Players.LocalPlayer.leaderstats.Ability.Value == "Lemon" then
			if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < 240 then
				ascend = false
				game:GetService("ReplicatedStorage"):WaitForChild("Remote Events"):WaitForChild("AbilityEvent"):FireServer(1)
				task.wait(.5)
      			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(147,19,148)
				ascend = true
			else
				OrionLib:MakeNotification({
					Name = "Enter Arena",
					Content = "You need to enter the arena for this to work.",
					Image = "rbxassetid://4483345998",
					Time = 3
				})
			end
		else
			OrionLib:MakeNotification({
				Name = "Lemon Ability Required",
				Content = "You need lemon for this to work.",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		end
  	end  
end  
})


local shopping = true

BADGES_TAB:AddButton({
	Name = "Get Grocery Shopping",
	Callback = function()
	if shopping == true then
		shopping = false
      	local cframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

      	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(160,271,29)
      	task.wait(.1)
	 	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-101, 23, -97)
	 	task.wait(.1)
	 	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(150, -21, 150)
	 	task.wait(.1)
    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
		shopping = true
  	end  
end 
})

BADGES_TAB:AddButton({
	Name = "Get Backrooms",
	Callback = function()
	if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < 240 then
      	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-121, 19, -119)
	else
		OrionLib:MakeNotification({
			Name = "Enter Arena",
			Content = "You need to enter the arena for this to work.",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
  	end    
end
})

game.Players.LocalPlayer.Chatted:Connect(function(msg)
	if msg == "dev mode" then
		local DEV_MODE = Window:MakeTab({
			Name = "Developer Mode",
			Icon = "rbxassetid://11860859170",
			PremiumOnly = false
		})

		OrionLib:MakeNotification({
			Name = "Developer Mode",
			Content = "Developer Mode has been unlocked",
			Image = "rbxassetid://1202200114",
			Time = 5
		})

		DEV_MODE:AddButton({
			Name = "Print CFrame",
			Callback = function()
				print(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end    
		})

		DEV_MODE:AddToggle({
			Name = "ban-risk punch aura",
			Default = false,
			Callback = function(bool)
				getgenv().aura = bool
		
			  while getgenv().aura do
				 task.wait(.001)
			  for i,v in pairs(game:GetService("Players"):GetChildren()) do
				 if v.Character["Right Arm"]:FindFirstChild("SelectionBox") == nil and v ~= game.Players.LocalPlayer then
				 local target = v.Character.HumanoidRootPart
				 local mag = (target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
				 if getgenv().aurareach > mag then
				 local args = {
				 [1] = workspace:WaitForChild(target.Parent.Name),
				 [2] = Vector3.new(target.Position),
				 [3] = 1.8757749795913696,
				 [4] = game:GetService("Players"):WaitForChild(target.Parent.Name).Character:FindFirstChild("Head")
				 }
		
				 game:GetService("ReplicatedStorage"):WaitForChild("Remote Events"):WaitForChild("Punch"):FireServer(unpack(args))
			  end
				 end
					end
					   end
						   end    
		})

		DEV_MODE:AddColorpicker({
			Name = "Hitbox Color",
			Default = Color3.fromRGB(255, 255, 255),
			Callback = function(Value)
				game.Players.LocalPlayer.Character:WaitForChild("Hitbox").Color = Value
			end	  
		})

		DEV_MODE:AddToggle({
			Name = "ESP",
			Default = false,
			Callback = function(bool)
				print("wip")
			end    
		})
	end
end)
