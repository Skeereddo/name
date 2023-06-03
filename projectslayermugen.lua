        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")
        local TweenService = game:GetService("TweenService")
        local Player = game:GetService("Players").LocalPlayer;
        local player = game:GetService("Players").LocalPlayer;
        local UIS = game:GetService'UserInputService';
        local Players = game:FindService("Players")
        local players = game:FindService("Players")
        local plr = game.Players.LocalPlayer
        local camera = game:GetService("Workspace").CurrentCamera
        local CurrentCamera = Workspace.CurrentCamera
        local worldToViewportPoint = CurrentCamera.worldToViewportPoint
        local UserInputService = cloneref(game:GetService'UserInputService')
        local runservice = game:GetService("RunService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local TweenService = game:GetService("TweenService")
        local PathfindingService = game:GetService("PathfindingService")
        local mouse = player:GetMouse()
        local mobs = {""} -- MOBS TABLE
        local npcs = {""}
        local fiend = {}
        local fiends = {}
        local Character = Player.Character
        local offset = 0
        local zones = {}
        local zonesN = {""}
        local boss = {}
        local enemy = {}
        local noclipE = false
        local antifall = nil
        local tp_speed = 250
        local infinite_gas = false
        local infinite_blade_durability = false
        local mt = getrawmetatable(game)
        local nc = mt.__namecall


        --Instances
        local Map = workspace.Map
        local Mobs = workspace.Mobs
        local Remotes = ReplicatedStorage.Remotes
        local Client = Players.LocalPlayer

        function findMob1()
            local largest = math.huge
            local closestChild = nil
            local hrp = Client.Character:WaitForChild("HumanoidRootPart")
            for i, v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                    local magnitude = (Client.Character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                    if magnitude < largest then
                        closestChild = v
                        largest = magnitude
                    end
                end
            end
            return closestChild
        end

        local spawn, wait = task.spawn, task.wait

        local FireServer = Instance.new("RemoteEvent").FireServer
        local InvokeServer = Instance.new("RemoteFunction").InvokeServer

        function Call(self, ...) --Caching the FireServer and InvokeServer functions for optimization
            local Method = self.ClassName == ("RemoteEvent") and FireServer or self.ClassName == ("RemoteFunction") and InvokeServer

            return spawn(Method, self, ...)
        end

        local Initiate_S = Remotes.To_Server.Handle_Initiate_S_

        local AttackMethods = {
            Fist = "fist_combat",
            Sword = "Sword_Combat_Slash",
            Claws = "claw_Combat_Slash",
            Fans = "fans_combat_slash",
            Scythe = "Scythe_Combat_Slash",
        }

        function Attack()
            if Method == nil then 
                Method = "Fist"
            end
            local Method = AttackMethods[Method]

            for Cycle=1, 8 do
                Call(
                    Initiate_S,
                    Method,
                    Client,
                    Client.Character,
                    Client.Character.HumanoidRootPart,
                    Client.Character.Humanoid,
                    Cycle ~= 8 and Cycle or Cycle == 8 and 919
                )
                task.wait(0.1)
            end
        end

        local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Skeereddo/name/main/ArrayField'))()
        
        local Window = Rayfield:CreateWindow({
            Name = "PS Mugen │ Skeered Hub",
            LoadingTitle = "Skeered Hub",
            LoadingSubtitle = "by Skeered",
            ConfigurationSaving = {
                Enabled = true,
                FolderName = "Skeered Hub", -- Create a custom folder for your hub/game
                FileName = "Project Slayer"
            },
            Discord = {
                Enabled = true,
                Invite = "gbHkVD5S2g", 
                RememberJoins = true
            },
            KeySystem = true,
            KeySettings = {
                Title = "Skeered Hub",
                Subtitle = "Key System",
                Note = "Join discord server for the key",
                FileName = "SkeeredHub Key", 
                SaveKey = true, 
                GrabKeyFromSite = false,
                Key = _G.key
            }
        })
        local Main = Window:CreateTab("Main", 4483362458)
        local Teleports = Window:CreateTab("Teleports", 4483362458)
        local Misc = Window:CreateTab("Misc", 4483362458)
        
        local Settings = Main:CreateSection("Settings Section")
        local Farm = Main:CreateSection("Farm Section")
        
        local Teleport = Teleports:CreateSection("Teleport")
        local Miscs = Misc:CreateSection("Others")

        local Method = Main:CreateDropdown({
            Name = "Farm Method",
            Options = {"Above", "Front"},
            CurrentOption = "Select something here",
            MultiSelection = false,
            Flag = "Npcs",
            SectionParent = Settings,
            Callback = function(v)
                mode = v
            end,
        })
        
        local Distance = Main:CreateSlider({
            Name = "Autofarm Distance",
            Range = {0, 20},
            Increment = 1,
            Suffix = "Studs",
            CurrentValue = 7,
            Flag = "Distance",
            SectionParent = Settings,
            Callback = function(v)
            dist = v
            end,
        })

        local Killaura = Main:CreateToggle({
            Name = "Killaura",
            CurrentValue = false,
            Flag = "BuyWen",
            SectionParent = Farm,
            Callback = function(v)
                getgenv().Killaura = v
                while getgenv().Killaura do
                    Attack()
                    wait(2)
                end
            end
        })

            local Godmode = Main:CreateToggle({
            Name = "Godmode (ONLY IF YOU ARE KAMADO DEMON)",
            CurrentValue = false,
            SectionParent = Farm,
            Callback = function(v)
                getgenv().god = v
                if getgenv().god then
                    local ohBoolean1 = true
        
                    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(ohBoolean1)
                elseif not getgenv().god then
                    local ohBoolean1 = false
        
                    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(ohBoolean1)
                end
        end
        })


        local AutoMugen = Main:CreateToggle({
            Name = "Auto Mugen",
            CurrentValue = false,
            Flag = "Mugen", 
            SectionParent = Farm,
            Callback = function(v)
                getgenv().FarmAll = v
                local Humanoid = Client.Character.Humanoid
                local hrp = Client.Character:WaitForChild("HumanoidRootPart")
                while task.wait() do
                    if getgenv().FarmAll == false then return end
        
                    local mob = findMob1()
 
                    if mobs == nil then
                        while task.wait() do
                            task.wait()
                            if getgenv().FarmAll == false then return end
                            if findMob1() ~= nil then break end
                        end
                    else
                        while wait() do
                            task.wait()
        
                            if getgenv().FarmAll == false then return end
        
                            if mob and mob:FindFirstChild("Humanoid") ~= nil and mob:FindFirstChild("Humanoid").Health > 0 then
                                local ehum = mob:WaitForChild("Humanoid")
                                local character = Client.Character
                                local hrp = character:WaitForChild("HumanoidRootPart")
                                
                                if mode == "Above" then
                                    repeat
                                        task.wait()
                                        local character = Client.Character
                                        local hrp = character:WaitForChild("HumanoidRootPart")
                                        local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude

                                        if magnitude > 100 then
                                            local tween = TweenService:Create(hrp, TweenInfo.new(magnitude / 300, Enum.EasingStyle.Linear), {
                                                CFrame = mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0)
                                            })

                                            tween:Play()

                                            repeat
                                                magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude
                                                task.wait()
                                            until magnitude < 100 or getgenv().FarmAll == false

                                            tween:Cancel()
                                        else
                                            hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0)
                                        end

                                    until not FarmAll or not mob or mob:FindFirstChild("Humanoid").Health <= 0 
                                elseif mode == "Behind" then
                                    repeat
                                        task.wait()
                                        local character = Client.Character
                                        local hrp = character:WaitForChild("HumanoidRootPart")
                                        local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude

                                        if magnitude > 100 then
                                            local tween = TweenService:Create(hrp, TweenInfo.new(magnitude / 300, Enum.EasingStyle.Linear), {
                                                CFrame = mob:GetModelCFrame() * CFrame.new(0, 0, tonumber(dist))
                                            })

                                            tween:Play()

                                            repeat
                                                magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude
                                                task.wait()
                                            until magnitude < 100 or getgenv().FarmAll == false

                                            tween:Cancel()
                                        else
                                            hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, 0, tonumber(dist))
                                        end

                                    until not FarmAll or mob:FindFirstChild("Humanoid").Health <= 0 
                                elseif mode == "Below" then
                                    repeat
                                        task.wait()
                                        local character = Client.Character
                                        local hrp = character:WaitForChild("HumanoidRootPart")
                                        local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude

                                        if magnitude > 100 then
                                            local tween = TweenService:Create(hrp, TweenInfo.new(magnitude / 300, Enum.EasingStyle.Linear), {
                                                CFrame = mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0)
                                            })

                                            tween:Play()

                                            repeat
                                                magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude
                                                task.wait()
                                            until magnitude < 100

                                            tween:Cancel()
                                        else
                                            hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0)
                                        end

                                    until not FarmAll or mob:FindFirstChild("Humanoid").Health <= 0 
                                elseif mode == "Front" then
                                    repeat
                                        task.wait()
                                        local character = Client.Character
                                        local hrp = character:WaitForChild("HumanoidRootPart")
                                        local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude

                                        if magnitude > 100 then
                                            local tween = TweenService:Create(hrp, TweenInfo.new(magnitude / 300, Enum.EasingStyle.Linear), {
                                                CFrame = mob:GetModelCFrame() * CFrame.new(0, 0, -tonumber(dist)) * CFrame.Angles(0, math.rad(180), 0)
                                            })

                                            tween:Play()

                                            repeat
                                                magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude
                                                task.wait()
                                            until magnitude < 100 or getgenv().FarmAll == false

                                            tween:Cancel()
                                        else
                                            hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, 0, -tonumber(dist)) * CFrame.Angles(0, math.rad(180), 0)
                                        end

                                    until not FarmAll or mob:FindFirstChild("Humanoid").Health <= 0 
                                elseif mode == nil then
                                    game.StarterGui:SetCore("SendNotification", {
                                        Title = "Info!",
                                        Text = "Select the autofarm mode in the dropdown above",
                                        Icon = "",
                                        Duration = 2.5
                                    })
                                end
                            else
                                break
                            end
                        end
                    end
                    task.wait()
                end
            end
        })

        local AutoInvincible = Misc:CreateToggle({
            Name = "Invincible (Akaza BD)",
            CurrentValue = false,
            Flag = "BuyExp",
            SectionParent = Miscs,
            Callback = function(v)
                _G.Invicinbility = v
                while _G.Invicinbility do
                    local A_1 = "skil_ting_asd"
                    local A_2 = game:GetService("Players").LocalPlayer
                    local A_3 = "akaza_bda_compass_needle"
                    local A_4 = 1
                    local Event = game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S"]
                    Event:FireServer(A_1, A_2, A_3, A_4)
                    task.wait(0.5)
                end
            end
        })

        local Walk = Misc:CreateToggle({
            Name = "Walkspeed",
            CurrentValue = false,
            SectionParent = Miscs,
            Flag = "MobEsp",
            Callback = function(Value)
                Walkspeed()
                enabled = Value
            end
        })
        
        local speedSlider = Misc:CreateSlider({
            Name = "WSpeed",
            Info = "Select how fast you go lol", -- Speaks for itself, Remove if none.
            Range = {0, 300},
            Increment = 1,
            Suffix = "Speed",
            CurrentValue = 100,
            SectionParent = Miscs,
            Flag = "Walkspeed2",
        
            Callback = function(Value)
                walkSpeed = Value
            end,
        })
        
        local InfStam = Misc:CreateToggle({
            Name = "Inf Stamina",
            CurrentValue = false,
            Flag = "Stam",
            SectionParent = Miscs,
            Callback = function(v)
                getgenv().Stam = v
                while getgenv().Stam and task.wait(0.3) do
                    getrenv()._G:Stamina(-9e9)
                end
            end,
        })
