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

        local Tutorial = Main:CreateParagraph({Title = "Auto Dungeon Tutorial", Content = "New ServerHop Dungeon:\nPut the script in Auto Execute\nYou must activate Auto Buy EXP or WEN on Dead\nFor now it will farm with fist when you server hop"})

        local Method = Main:CreateDropdown({
            Name = "Farm Method",
            Options = {"Fist", "Claws", "Sword"},
            CurrentOption = "Select something here",
            MultiSelection = false,
            Flag = "Method",
            SectionParent = Settings,
            Callback = function(v)
                Method = v
            end,
        })

        local AutoBuyExp = Main:CreateToggle({
            Name = "Auto Buy EXP on dead",
            CurrentValue = false,
            Flag = "BuyExp",
            SectionParent = Farm,
            Callback = function(v)
                _G.EXP = v

            end
        })

        local AutoBuyWen = Main:CreateToggle({
            Name = "Auto Buy WEN on dead",
            CurrentValue = false,
            Flag = "BuyWen",
            SectionParent = Farm,
            Callback = function(v)
                _G.WEN = v

            end
        })

        local AutoDungeon = Main:CreateToggle({
            Name = "Auto Dungeon",
            CurrentValue = false,
            Flag = "AutoDungeon",
            SectionParent = Farm,
            Callback = function(v)
                _G.Enabled = v
                local ohString1 = "Normal"

                game:GetService("ReplicatedStorage").TeleportCirclesEvent:FireServer(ohString1)
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
                    if v:FindFirstChildOfClass("Model") and v:FindFirstChildOfClass("Model"):FindFirstChild("Humanoid") and v:FindFirstChildOfClass("Model"):FindFirstChild("Humanoid").Health > 0 then
                        Mob = v:FindFirstChildOfClass("Model")
                    pcall(function()
                        BodyVelocity:Clone().Parent = Client.Character.LowerTorso
                        BodyAngularVelocity:Clone().Parent = Client.Character.LowerTorso
        
                        Teleport(Mob.HumanoidRootPart.CFrame.Position, Vector3.new(0, 50, 0), 200)
                    end)        
                    
                    repeat
                        local Status = pcall(function()
                            if #Mobs:GetChildren() == 0 then
                                spawn(ClaimOrbs)
                            end
        
                            Client.Character.HumanoidRootPart.CFrame = Mob.HumanoidRootPart.CFrame
                            wait(0.30)
                            Attack()
                            task.wait(0.1)
                            Teleport(Mob.HumanoidRootPart.CFrame.Position, Vector3.new(0, 50, 0), 250)
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

        game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
            if _G.EXP then
                _G.Enabled = false
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
