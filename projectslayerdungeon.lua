        repeat wait() until game:IsLoaded()


        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")
        local TweenService = game:GetService("TweenService")

        --Instances
        local Map = workspace.Map
        local Mobs = workspace.Mobs
        local Remotes = ReplicatedStorage.Remotes
        local Client = Players.LocalPlayer

        --#region Functions
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
        }

        function Attack()
            local Method = AttackMethods[Method]

            for Cycle=1, 5 do
                Call(
                    Initiate_S,
                    Method,
                    Client,
                    Client.Character,
                    Client.Character.HumanoidRootPart,
                    Client.Character.Humanoid,
                    Cycle ~= 5 and Cycle or Cycle == 5 and 919
                )
            end
        end

        local Orbs = {
            "InstaKill",
            "HealthRegen",
            "StaminaRegen",
            "BloodMoney",
            "DoublePoints",
        }

        function ClaimOrbs()
            for i, Orb in next, Map:GetChildren() do
                if table.find(Orbs, Orb.Name) then
                    pcall(Teleport, Orb:FindFirstChildOfClass("MeshPart").CFrame.Position, nil, 256)
                end
            end
        end

        function CreateInstance(Class, Properties)
            local Instance = Instance.new(Class)

            for Property, Value in Properties do
                Instance[Property] = Value
            end

            return Instance
        end

        local enabled = true
        local walkSpeed = 100
        
        function Walkspeed()
            local UIS = game:GetService("UserInputService")
            local RS = game:GetService("RunService")
            local W, A, S, D
            local xVelo, yVelo
        
            RS.RenderStepped:Connect(function()
                if not enabled then return end
                task.wait(0.1)
                local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
                local C = game.Workspace.CurrentCamera
                local LV = C.CFrame.LookVector
        
                for i,v in pairs(UIS:GetKeysPressed()) do
                    if v.KeyCode == Enum.KeyCode.W then
                        W = true
                    end
                    if v.KeyCode == Enum.KeyCode.A then
                        A = true
                    end
                    if v.KeyCode == Enum.KeyCode.S then
                        S = true
                    end
                    if v.KeyCode == Enum.KeyCode.D then
                        D = true
                    end
                end
        
                if W == true and S == true then
                    yVelo = false
                    W,S = nil
                end
        
                if A == true and D == true then
                    xVelo = false
                    A,D = nil
                end
        
                if yVelo ~= false then
                    if W == true then
                        if xVelo ~= false then
                            if A == true then
                                local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                                HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                                W,A = nil
                            else
                                if D == true then
                                    local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                                    HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                                    W,D = nil
                                end
                            end
                        end
                    else
                        if S == true then
                            if xVelo ~= false then
                                if A == true then
                                    local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                                    HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                                    S,A = nil
                                else
                                    if D == true then
                                        local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                                        HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                                        S,D = nil
                                    end
                                end
                            end
                        end
                    end
                end
        
        if W == true then
           HRP.Velocity = Vector3.new((LV.X * walkSpeed), HRP.Velocity.Y, (LV.Z * walkSpeed))
        end
        if S == true then
           HRP.Velocity = Vector3.new(-(LV.X * walkSpeed), HRP.Velocity.Y, -(LV.Z * walkSpeed))
        end
        if A == true then
           local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
           HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
        end
        if D == true then
           local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
           HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
        end
        
        xVelo, yVelo, W, A, S, D = nil
        end)
        
        end

        --#endregion

        --Main
        local BodyVelocity = CreateInstance("BodyVelocity", {MaxForce = Vector3.new(1/0, 1/0, 1/0), Velocity = Vector3.zero, Name = "BV"})
        local BodyAngularVelocity = CreateInstance("BodyAngularVelocity", {MaxTorque = Vector3.new(1/0, 1/0, 1/0), AngularVelocity = Vector3.zero, Name = "BAV"})
        


        local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Skeereddo/name/main/ArrayField'))()
        
        local Window = Rayfield:CreateWindow({
            Name = "PS Dungeon │ Skeered Hub",
            LoadingTitle = "Skeered Hub",
            LoadingSubtitle = "by Skeered",
            ConfigurationSaving = {
                Enabled = true,
                FolderName = "Skeered Hub", -- Create a custom folder for your hub/game
                FileName = "Project Slayer Dungeon"
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
            Options = {"Fist", "Claws", "Sword"},
            CurrentOption = "Select something here",
            MultiSelection = false,
            Flag = "Npcs",
            SectionParent = Settings,
            Callback = function(v)
                Method = v
            end,
        })

        local AutoDungeon = Main:CreateToggle({
            Name = "Auto Dungeon",
            CurrentValue = false,
            Flag = "AutoFarm",
            SectionParent = Farm,
            Callback = function(v)
                _G.Enabled = v

            end
        })
        
        local Godmode = Main:CreateToggle({
            Name = "Godmode (ONLY IF YOU HAVE KAMADO)",
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

        function Teleport(Position, Offset, Speed)
            local Distance = Client:DistanceFromCharacter(Position + (Offset or Vector3.zero))

            if Distance < 2500 then
                local Tween = TweenService:Create(
                    Client.Character.HumanoidRootPart,
                    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                    {CFrame = CFrame.new(Position + (Offset or Vector3.zero)
                )})

                Tween:Play()

                return Tween.Completed:Wait()
            else
                Client.Character.HumanoidRootPart.CFrame = Position + (Offset or Vector3.zero)
                
                return wait()
            end
        end

        spawn(function()
            while task.wait() do
            while _G.Enabled do
                task.wait()
                for i, v in next, Mobs:GetChildren() do
                    Mob = v:FindFirstChildOfClass("Model")
                    pcall(function()
                        BodyVelocity:Clone().Parent = Client.Character.LowerTorso
                        BodyAngularVelocity:Clone().Parent = Client.Character.LowerTorso
        
                        Teleport(Mob.HumanoidRootPart.CFrame.Position, Vector3.new(0, 50, 0), 128)
                    end)        
                    
                    repeat
                        local Status = pcall(function()
                            if #Mobs:GetChildren() == 0 then
                                spawn(ClaimOrbs)
                            end
        
                            Client.Character.HumanoidRootPart.CFrame = Mob.HumanoidRootPart.CFrame
                            wait(0.25)
                            Attack()
                            Teleport(Mob.HumanoidRootPart.CFrame.Position, Vector3.new(0, 50, 0), 256)
                            repeat wait() until Client:WaitForChild("combotangasd123", 9e9).Value == 0 and wait(0.25)
                        end)
                        if not Status or not _G.Enabled then
                            break
                        end
        
                    until wait() and not _G.Enabled
        
                    pcall(function()
                        Client.Character.LowerTorso:FindFirstChildOfClass("BodyVelocity"):Destroy()
                        Client.Character.LowerTorso:FindFirstChildOfClass("BodyAngularVelocity"):Destroy()    
                    end)
                end
                wait()
            end
    end
end)
        spawn(function()
            while task.wait() do
            while _G.Enabled do
                local lootChests = game:GetService("Workspace").Debree:GetDescendants()
                for _, chest in ipairs(lootChests) do
                    if chest and chest.Name == "Loot_Chest" and chest:FindFirstChild("Drops") then
                        local remote = chest:WaitForChild("Add_To_Inventory")
                        for _, drop in ipairs(chest.Drops:GetChildren()) do
                            remote:InvokeServer(drop.Name)
                        end
                    end
                end
                
                wait(3)
            end
            end
        end)
