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
        local character = player.Character

        local vim = game:GetService('VirtualInputManager')

        local uis = game:GetService('UserInputService')
        local client = game:GetService('Players').LocalPlayer
        local rs = game:GetService('RunService')

        local function pressKey(key)
            vim:SendKeyEvent(true, key, false, game)
            wait()
            vim:SendKeyEvent(false, key, false, game)
        end

        _G.noclip = nil
        local Loop  game:GetService('RunService').Stepped:connect(function()
            if _G.noclip then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        if v.CanCollide ~= not _G.noclip then
                            v.CanCollide = not _G.noclip
                        end
                    end
                end
            end
        end)

        --Instances

        local Client = Players.LocalPlayer


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

        -- FLY --
local speed = 50
        
local c
local h
local bv
local bav
local cam
local flying
local p = game.Players.LocalPlayer
local buttons = {W = false, S = false, A = false, D = false, Moving = false}
 
local startFly = function () -- Call this function to begin flying 
    if not p.Character or not p.Character.Head or flying then return end
    c = p.Character
    h = c.Humanoid
    h.PlatformStand = true
    cam = workspace:WaitForChild('Camera')
    bv = Instance.new("BodyVelocity")
    bav = Instance.new("BodyAngularVelocity")
    bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bv.Parent = c.Head
    bav.Parent = c.Head
    flying = true
    h.Died:connect(function() flying = false end)
end
 
local endFly = function () -- Call this function to stop flying
    if not p.Character or not flying then return end
    h.PlatformStand = false
    bv:Destroy()
    bav:Destroy()
    flying = false
end
 
game:GetService("UserInputService").InputBegan:connect(function (input, GPE) 
    if GPE then return end
    for i, e in pairs(buttons) do
        if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
            buttons[i] = true
            buttons.Moving = true
        end
    end
end)
 
game:GetService("UserInputService").InputEnded:connect(function (input, GPE) 
    if GPE then return end
    local a = false
    for i, e in pairs(buttons) do
        if i ~= "Moving" then
            if input.KeyCode == Enum.KeyCode[i] then
                buttons[i] = false
            end
            if buttons[i] then a = true end
        end
    end
    buttons.Moving = a
end)
 
local setVec = function (vec)
    return vec * (speed / vec.Magnitude)
end
 
game:GetService("RunService").Heartbeat:connect(function (step) -- The actual fly function, called every frame
    if flying and c and c.PrimaryPart then
        local p = c.PrimaryPart.Position
        local cf = cam.CFrame
        local ax, ay, az = cf:toEulerAnglesXYZ()
        c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
        if buttons.Moving then
            local t = Vector3.new()
            if buttons.W then t = t + (setVec(cf.lookVector)) end
            if buttons.S then t = t - (setVec(cf.lookVector)) end
            if buttons.A then t = t - (setVec(cf.rightVector)) end
            if buttons.D then t = t + (setVec(cf.rightVector)) end
            c:TranslateBy(t * step)
        end
    end
end)

        function findMob()
            local Mob = {}
            local largest = math.huge
            local closestChild = nil
            local hrp = character:WaitForChild("HumanoidRootPart")
            for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and (string.find(v.Name, "Fishbone") or string.find(v.Name, "Frisker")) then
                    table.insert(Mob, v)
                end
            end
            return Mob
        end
        

        function findMob1()
            local largest = math.huge
            local closestChild = nil
            local hrp = character:WaitForChild("HumanoidRootPart")
            for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and (string.find(v.Name, "Fishbone") or string.find(v.Name, "Frisker")) then
                    local magnitude = (character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                    if magnitude < largest then
                        closestChild = v
                        largest = magnitude
                    end
                end
            end
            return closestChild
        end

        function findQuestMob()
            local largest = math.huge
            local closestChild = nil
            local hrp = character:WaitForChild("HumanoidRootPart")
            for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("Highlight") and (string.find(v.Name, "Fishbone") or string.find(v.Name, "Frisker")) then
                    local magnitude = (character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                    if magnitude < largest then
                        closestChild = v
                        largest = magnitude
                    end
                end
            end
            return closestChild
        end

        function findMob2()
            local largest = math.huge
            local closestChild = nil
            local hrp = Client.Character:WaitForChild("HumanoidRootPart")
            for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HumanoidRootPart") and (string.find(v.Name, "Fishbone") or string.find(v.Name, "Frisker")) then
                    local magnitude = (Client.Character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                    if magnitude < largest then
                        closestChild = v
                        largest = magnitude
                    end
                end
            end
            return closestChild
        end

        function closestMob()
            local largest = math.huge
            local closestChild = nil
            for i, v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HumanoidRootPart") and (string.find(v.Name, "Fishbone") or string.find(v.Name, "Frisker")) then
                    local magnitude = (Client.Character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                    if magnitude < largest then
                        closestChild = v
                        largest = magnitude
                        task.wait(0.5)
                    end
                    
                end
            end
            return closestChild
        end


function nostun()
    local a = {"KnockedOut", "Stun", "FakeStun", "carry_ting_asdasd", "RagDoll", "novelocity"}
    
        for _,o in pairs(getconnections(game:GetService("ReplicatedStorage").PlayerValues[game.Players.LocalPlayer.Name].ChildAdded)) do 
            o:Disable()
        end
        game:GetService("ReplicatedStorage").PlayerValues[game.Players.LocalPlayer.Name].ChildAdded:Connect(function(child)
            if table.find(a, child.Name) then 
                child.Name = "FakeStun"
                child:Destroy()
            end
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
        local info = TweenInfo.new(((client.Character.HumanoidRootPart.Position - obj.Position).Magnitude) / speed,Enum.EasingStyle.Linear)
        local tween = TweenService:Create(client.Character.HumanoidRootPart, info, {CFrame = obj})
        if not client.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            antifall = Instance.new("BodyVelocity", client.Character.HumanoidRootPart)
            antifall.Velocity = Vector3.new(0, 0, 0)
            noclipE = game:GetService("RunService").Stepped:Connect(noclip) 
            tween:Play()
            tween.Completed:Wait()
            antifall:Destroy()
            noclipE:Disconnect()
        end
    end

    local spawn, wait = task.spawn, task.wait

    local FireServer = Instance.new("RemoteEvent").FireServer
    local InvokeServer = Instance.new("RemoteFunction").InvokeServer

    local Client = player


    


    function Attack1()
        pcall(function()
        
        if Method == nil then 
            Method = "Fist"
        end
        local Method = AttackMethods[Method]
        for Cycle=1, 8 do
            if player:FindFirstChild("combotangasd123") and player:FindFirstChild("combotangasd123").Value == 16 then return end
            task.spawn(function()
                if player:FindFirstChild("combotangasd123") and player:FindFirstChild("combotangasd123").Value == 16 then return end
                Initiate_S:InvokeServer(Method, Client, Client.Character, Client.Character.HumanoidRootPart, Client.Character.Humanoid, 919, "ground_slash")
            end)
            if player:FindFirstChild("combotangasd123") and player:FindFirstChild("combotangasd123").Value == 16 then return end
            task.spawn(function()
                if player:FindFirstChild("combotangasd123") and player:FindFirstChild("combotangasd123").Value == 16 then return end
                Initiate_S:InvokeServer(Method, Client, Client.Character, Client.Character.HumanoidRootPart, Client.Character.Humanoid, math.huge, "ground_slash")
            end)
            if player:FindFirstChild("combotangasd123") and player:FindFirstChild("combotangasd123").Value == 16 then return end
        end
    end)
    end

    function ClaimOrbs()
        for i, Orb in next, Map:GetChildren() do
            if table.find(Orbs, Orb.Name) and First == Orb.Name or Second == Orb.Name or Third == Orb.Name or Fourth == Orb.Name or Fifth == Orb.Name then
                moveto(Orb:FindFirstChildOfClass("MeshPart").CFrame, 300)
            end
        end
    end

    function getNumber()
        local tradeItems = player.PlayerGui.MainGuis.TradeF["Trade_Hub_Items"].Items.Scroll:GetChildren()
    
        for _, item in ipairs(tradeItems) do
            local number = string.match(item.Name, "Bandage(%d+)")
            if number then
                return tonumber(number)
            end
        end
    
        return nil 
    end

    function getMission()
        local largest = math.huge
        local closestChild = nil
        local hrp = character:WaitForChild("HumanoidRootPart")
        for i,v in pairs(Client.PlayerGui.DialogueUI:GetDescendants()) do
        if v:IsA("TextLabel") and v.Text == "MissionBoard" then
            local x = game.Players.LocalPlayer.PlayerGui.DialogueUI.dialogueFrame.Yes

            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,true,x,1)
            vim:SendMouseButtonEvent(x.AbsolutePosition.X+x.AbsoluteSize.X/2,x.AbsolutePosition.Y+50,0,false,x,1)
        end
        end

        for i, v in pairs(game:GetService("Workspace").NPCs.MissionNPC:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Board") and v:FindFirstChild("Board"):FindFirstChild("Union") and v:FindFirstChild("Board"):FindFirstChild("Union"):FindFirstChild("ClickDetector") then
                local magnitude = (character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                if magnitude < largest then
                    local Board = v:FindFirstChild("Board")
                    local Union = Board:FindFirstChild("Union")
                    local Click = Union:FindFirstChild("ClickDetector")
                    hrp.CFrame = Union.CFrame
                    fireclickdetector(Click)
                    closestChild = v
                    largest = magnitude
                end
            end
        end
        return closestChild
    end
    
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Skeereddo/name/main/Rayfield'))()
        
        local Window = Rayfield:CreateWindow({
            Name = "Type://Soul │ Skeered Hub",
            LoadingTitle = "Skeered Hub",
            LoadingSubtitle = "by Skeered",
            ConfigurationSaving = {
                Enabled = true,
                FolderName = "Skeered Hub", -- Create a custom folder for your hub/game
                FileName = "Type Soul"
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
                Note = "Join discord server for the key (.gg/SkeeredHub)",
                FileName = "SkeeredHub Key", 
                SaveKey = true, 
                GrabKeyFromSite = false,
                Key = _G.key
            }
        })


-- You do not have to set your tabs & groups up this way, just a prefrence.
local Main = Window:CreateTab("Main", 4483362458)

local LeftGroupBox = Main:CreateSection("Farming")
local LP = Main:CreateSection("LocalPlayer")
local Miscs = Main:CreateSection("Miscs")

Main:CreateToggle({
    Name = "Walkspeed",
    CurrentValue = false,
    Flag = "WalkFast",
    SectionParent = LP,
    Callback = function(v)
        Walkspeed()
        enabled = v
    end
})

Main:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "NoClip",
    SectionParent = LP,
    Callback = function(v)
        _G.noclip = v
        if _G.noclip == false then
            character.Humanoid:ChangeState(7)
        end
        end
})

local WalkspeedSlider = Main:CreateSlider({
    Name = "Walkspeed Speed",
    Range = {0, 200},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 100,
    Flag = "WalkspeedSpeed",
    SectionParent = LP,
    Callback = function(v)
        walkSpeed = v
    end,
})

Main:CreateDropdown({
    Name = "Farm Method",
    Options = {"Front", "Above", "Below"},
    CurrentOption = "Above",
    MultiSelection = false,
    Flag = "FarmMethod",
    SectionParent = LeftGroupBox,
    Callback = function(v)
        mode = v
    end,
})

local Distance = Main:CreateSlider({
    Name = "Autofarm Distance",
    Range = {0, 20},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 10,
    Flag = "Distance",
    SectionParent = LeftGroupBox,
    Callback = function(v)
    dist = v
    end,
})

Main:CreateToggle({
    Name = "Killaura",
    CurrentValue = false,
    Flag = "JustKillaura",
    SectionParent = LeftGroupBox,
    Callback = function(v)
        getgenv().KillauraOP = v
        while getgenv().KillauraOP do
            pcall(function()
                task.wait(0.2)
                if character:FindFirstChild("Right Arm") and not character:FindFirstChild("Right Arm"):FindFirstChildOfClass("Model") then

                character.CharacterHandler.Remotes.Weapon:FireServer()
                end
        local ohString1 = "LightAttack"

        game:GetService("ReplicatedStorage").Remotes.ServerCombatHandler:FireServer(ohString1)
            
        end)
        end
    end
})

Main:CreateToggle({
    Name = "Farm Near Npc",
    CurrentValue = false,
    Flag = "FarmNearNpc",
    SectionParent = LeftGroupBox,
    Callback = function(v)
        getgenv().FarmAll = v
        if dist == nil then
            dist = 10
        end
        if mode == nil then
            mode = "Above"
        end
        local Humanoid = character.Humanoid
        local hrp = character:WaitForChild("HumanoidRootPart")
        while task.wait() do
            pcall(function()
            
            
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
                        local character = player.Character
                        local hrp = character:WaitForChild("HumanoidRootPart")
                        
                        if mode == "Above" then
                            repeat
                                task.wait()
                                local character = player.Character
                                local hrp = character:WaitForChild("HumanoidRootPart")
                                local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).magnitude
                                if magnitude > 20 then
                                    moveto(mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0), 100)
                                else
                                    hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0)
                                end
                            until not FarmAll or not mob or mob:FindFirstChild("Humanoid").Health <= 0
                        elseif mode == "Below" then
                            repeat
                                task.wait()
                                local character = player.Character
                                local hrp = character:WaitForChild("HumanoidRootPart")
                                local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).magnitude
                                if magnitude > 20 then
                                    moveto(mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0), 100)
                                else
                                    hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0)
                                end
                            until not FarmAll or not mob or mob:FindFirstChild("Humanoid").Health <= 0
                        elseif mode == "Front" then
                            repeat
                                task.wait()
                                local character = Client.Character
                                local hrp = character:WaitForChild("HumanoidRootPart")
                                local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).Magnitude

                                if magnitude > 20 then
                                    moveto(mob:GetModelCFrame() * CFrame.new(0, 0, -tonumber(dist)) * CFrame.Angles(0, math.rad(180), 0), 100)
                                else
                                    hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, 0, -tonumber(dist)) * CFrame.Angles(0, math.rad(180), 0)
                                end

                            until not FarmAll or not mob or mob:FindFirstChild("Humanoid").Health <= 0 
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
        end)
        end
    end
})

Main:CreateToggle({
    Name = "Activate Whitescreen",
    CurrentValue = false,
    Flag = "Whitescreen",
    SectionParent = Miscs,
    Callback = function(v)
        getgenv().Whitescreen = v
        if Whitescreen then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        elseif not Whitescreen then
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end
})


player.CharacterAdded:Connect(function(char)
    character = char
end)
