repeat wait() until game:IsLoaded()


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
            Fans = "fans_combat_slash",
            Scythe = "Scythe_Combat_Slash",
        }

        function Attack()
            if Method == nil then 
                Method = "Fist"
            end
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

        function Attack1()
            if Method == nil then 
                Method = "Fist"
            end
            local Method = AttackMethods[Method]

            for Cycle=1, 2 do
                Call(
                    Initiate_S,
                    Method,
                    Client,
                    Client.Character,
                    Client.Character.HumanoidRootPart,
                    Client.Character.Humanoid,
                    Cycle ~= 2 and Cycle or Cycle == 2 and 919
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
        --#endregion
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

        local function noclip()
            for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end

        local function moveto(obj, speed)
            local info = TweenInfo.new(((Client.Character.HumanoidRootPart.Position - obj.Position).Magnitude) / speed,Enum.EasingStyle.Linear)
            local tween = TweenService:Create(Client.Character.HumanoidRootPart, info, {CFrame = obj})
            if not Client.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                antifall = Instance.new("BodyVelocity", Client.Character.HumanoidRootPart)
                antifall.Velocity = Vector3.new(0, 0, 0)
                noclipE = game:GetService("RunService").Stepped:Connect(noclip) 
                tween:Play()
                tween.Completed:Wait()
                antifall:Destroy()
                noclipE:Disconnect()
            end
        end
        

        
        
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
        
        local Settings = Main:CreateSection("Both Section")
        local Method1 = Main:CreateSection("Method 1")
        local Method2 = Main:CreateSection("Method 2")
        
        local Teleport = Teleports:CreateSection("Teleport")
        local Miscs = Misc:CreateSection("Others")

        local Tutorial = Main:CreateParagraph({Title = "Auto Dungeon Tutorial", Content = "New ServerHop Dungeon:\nPut the script in Auto Execute\nYou must activate Auto Buy EXP or WEN on Dead\nFor now it will farm with fist when you server hop"})

        local Method = Main:CreateDropdown({
            Name = "Farm Method",
            Options = {"Fist", "Claws", "Sword", "Fans", "Scythe"},
            CurrentOption = "Select something here",
            MultiSelection = false,
            Flag = "Method",
            SectionParent = Settings,
            Callback = function(v)
                Method = v
            end,
        })

        local Mode = Main:CreateDropdown({
            Name = "Farm Mode",
            Options = {"Above", "Below", "Behind"},
            CurrentOption = "Select something here",
            MultiSelection = false,
            Flag = "mode",
            SectionParent = Method2,
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
            SectionParent = Method2,
            Callback = function(v)
            dist = v
            end,
        })

        local AutoBuyExp = Main:CreateToggle({
            Name = "Auto Buy EXP on dead",
            CurrentValue = false,
            Flag = "BuyExp",
            SectionParent = Settings,
            Callback = function(v)
                _G.EXP = v
                repeat wait() until game:GetService("Workspace")["Dungeon_Timer"].Value == 0 and game:GetService("Workspace")["Total_Time"].Value > 0
                if _G.EXP then
                    Client.Character.Humanoid.Health = 0
                end
            end
        })

        local AutoBuyWen = Main:CreateToggle({
            Name = "Auto Buy WEN on dead",
            CurrentValue = false,
            Flag = "BuyWen",
            SectionParent = Settings,
            Callback = function(v)
                _G.WEN = v
                repeat wait() until game:GetService("Workspace")["Dungeon_Timer"].Value == 0 and game:GetService("Workspace")["Total_Time"].Value > 0
                if _G.WEN then
                    Client.Character.Humanoid.Health = 0
                end
            end
        })

        local AutoDungeon = Main:CreateToggle({
            Name = "Auto Dungeon (Method 1)",
            CurrentValue = false,
            Flag = "AutoDungeon",
            SectionParent = Method1,
            Callback = function(v)
                _G.Enabled = v
                local ohString1 = "Normal"

                game:GetService("ReplicatedStorage").TeleportCirclesEvent:FireServer(ohString1)
            end
        })

        local Killaura = Main:CreateToggle({
            Name = "Killaura",
            CurrentValue = false,
            Flag = "BuyWen",
            SectionParent = Method2,
            Callback = function(v)
                getgenv().Killaura = v
                while getgenv().Killaura do
                    Attack()
                    wait(1.5)
                end
            end
        })
        
        local AutoDungeonN = Main:CreateToggle({
            Name = "Auto Dungeon (Method 2)",
            CurrentValue = false,
            Flag = "DungeonN", 
            SectionParent = Method2,
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

                                        if magnitude > 150 then
                                            local tween = TweenService:Create(hrp, TweenInfo.new(magnitude / 300, Enum.EasingStyle.Linear), {
                                                CFrame = mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0)
                                            })

                                            tween:Play()

                                            repeat
                                                magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude
                                                task.wait()
                                            until magnitude < 150 or getgenv().FarmAll == false

                                            tween:Cancel()
                                        else
                                            hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0)
                                        end

                                    until not FarmAll or mob:FindFirstChild("Humanoid").Health <= 0 
                                elseif mode == "Behind" then
                                    repeat
                                        task.wait()
                                        local character = Client.Character
                                        local hrp = character:WaitForChild("HumanoidRootPart")
                                        local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude

                                        if magnitude > 150 then
                                            local tween = TweenService:Create(hrp, TweenInfo.new(magnitude / 300, Enum.EasingStyle.Linear), {
                                                CFrame = mob:GetModelCFrame() * CFrame.new(0, 0, tonumber(dist))
                                            })

                                            tween:Play()

                                            repeat
                                                magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude
                                                task.wait()
                                            until magnitude < 150 or getgenv().FarmAll == false

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

                                        if magnitude > 150 then
                                            local tween = TweenService:Create(hrp, TweenInfo.new(magnitude / 300, Enum.EasingStyle.Linear), {
                                                CFrame = mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0)
                                            })

                                            tween:Play()

                                            repeat
                                                magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude
                                                task.wait()
                                            until magnitude < 150

                                            tween:Cancel()
                                        else
                                            hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0)
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

        local Godmode = Main:CreateToggle({
            Name = "Godmode (ONLY IF YOU HAVE KAMADO)",
            CurrentValue = false,
            SectionParent = Settings,
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
                if not _G.Enabled then return end
                for i, v in next, Mobs:GetChildren() do
                    if v:FindFirstChildOfClass("Model") and v:FindFirstChildOfClass("Model"):FindFirstChild("Humanoid") and v:FindFirstChildOfClass("Model"):FindFirstChild("Humanoid").Health > 0 then
                        Mob = v:FindFirstChildOfClass("Model")
                    pcall(function()
                        BodyVelocity:Clone().Parent = Client.Character.LowerTorso
                        BodyAngularVelocity:Clone().Parent = Client.Character.LowerTorso
                        if not _G.Enabled then return end
                        Teleport(Mob.HumanoidRootPart.CFrame.Position, Vector3.new(0, 50, 0), 200)
                    end)        
                    
                    repeat
                        local Status = pcall(function()
                            if #Mobs:GetChildren() == 0 then
                                if not _G.Enabled then return end
                                spawn(ClaimOrbs)
                            end
                            if not _G.Enabled then return end
                            Client.Character.HumanoidRootPart.CFrame = Mob.HumanoidRootPart.CFrame
                            wait(0.30)
                            if not _G.Enabled then return end
                            Attack()
                            task.wait(0.1)
                            if not _G.Enabled then return end
                            Teleport(Mob.HumanoidRootPart.CFrame.Position, Vector3.new(0, 50, 0), 250)
                            if not _G.Enabled then return end
                            repeat wait() until Client:WaitForChild("combotangasd123", 9e9).Value == 0 and wait(0.25)
                        end)
                        if not Status or not _G.Enabled then
                            break
                        end
        
                    until wait() and not _G.Enabled or Mob:FindFirstChild("Humanoid") and Mob:FindFirstChild("Humanoid").Health <= 0
        
                    pcall(function()
                        Client.Character.LowerTorso:FindFirstChildOfClass("BodyVelocity"):Destroy()
                        Client.Character.LowerTorso:FindFirstChildOfClass("BodyAngularVelocity"):Destroy()    
                    end)
                end
                end
                wait()
            end
    end
end)
        spawn(function()
            while task.wait() do
            while _G.Enabled or getgenv().FarmAll do
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

        game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
            if _G.EXP then
                
                _G.Enabled = false
                getgenv().FarmAll = false
                task.wait(15)
                game:GetService("ReplicatedStorage").TeleportToShop:FireServer()
                task.wait(1)
                Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Shop Items"]["EXP Elixir"].Handle.CFrame
                task.wait(0.3)
                repeat
                    fireproximityprompt(game:GetService("Workspace")["Shop Items"]["EXP Elixir"].Handle.Buy)
                until task.wait() and Client.leaderstats.Points.Value < 25
                task.wait(0.1)
                game:GetService("TeleportService"):Teleport(9321822839, Client)  -- replace the numbers with the id of the game you want to teleport to
            elseif _G.WEN then
                _G.Enabled = false
                getgenv().FarmAll = false

                task.wait(15)
                game:GetService("ReplicatedStorage").TeleportToShop:FireServer()
                task.wait(1)
                Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Shop Items"]["Wen Bag"]["Cylinder.001"].CFrame
                task.wait(0.3)
                repeat
                    fireproximityprompt(game:GetService("Workspace")["Shop Items"]["Wen Bag"].Buy)
                until task.wait() and Client.leaderstats.Points.Value < 25
                task.wait(0.1)
                game:GetService("TeleportService"):Teleport(9321822839, Client)  -- replace the numbers with the id of the game you want to teleport to
            end
            
            end)
