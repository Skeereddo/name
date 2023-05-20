
local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua'))()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local mobs = {}
local Player = game:GetService("Players").LocalPlayer;
local character = Player.Character
local fiend = {}
local npcs = {}
local UIS = game:GetService'UserInputService'
_G.Config = { ["Theme"] = "Discord" }


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
-- ESP --
local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua'))()
function startPESP()
    Sense.teamSettings.enemy.enabled = true
    Sense.teamSettings.enemy.box = true
    Sense.teamSettings.enemy.boxColor = { Color3.new(0,0,0), 0 }
    Sense.teamSettings.enemy.healthBar = true
    Sense.teamSettings.enemy.healthText = true
    Sense.teamSettings.enemy.box3d = true
    Sense.teamSettings.enemy.name = true
    Sense.teamSettings.enemy.distance = true
end
function endPESP()
    Sense.teamSettings.enemy.enabled = false
end
    repeat wait() until game:IsLoaded()
    getgenv().mob = nil -- SELECTED MOB
    getgenv().npc = nil
    getgenv().Esp = false
    --MOBS
    for _,v in pairs(game:GetService("Workspace").Living:GetChildren()) do -- LOOPS THROUGH ALL MOBS
        insert = true -- VALUE TO CHECK THE MOB
        for _,v2 in pairs(mobs) do if v2 == v.Name then insert = false end end -- CHECKS IF MOB IS ALREADY IN THE TABLE
        if insert then table.insert(mobs, v.Name) end -- IF THE MOB ISNT INSERTED THEN INSERT IT
    end
    for _, v in pairs(game:GetService("Workspace").Living:GetChildren()) do -- LOOPS THROUGH ALL MOBS
        local insert = true -- VALUE TO CHECK THE MOB
        local validMobNames = {"Cricket Fiend", "Beetle Fiend", "Imposter Fiend", "Mantis Shrimp Fiend"}
        for _, name in pairs(validMobNames) do
        if v.Name == name and v.Humanoid and v.HumanoidRootPart then -- CHECKS IF THE MOB NAME IS VALID
        for _, v2 in pairs(fiend) do
        if v2 == name then
        insert = false
        end
        end
        if insert then
        table.insert(fiend, name) -- INSERT THE MOB NAME INTO THE TABLE
        end
        break
        end
        end
        end
    --NPCS
    for _,v in pairs(game:GetService("Workspace").DialogNPCs:GetChildren()) do -- LOOPS THROUGH ALL NPCS
        insert = true -- VALUE TO CHECK THE MOB
        for _,v2 in pairs(npcs) do if v2 == v.Name then insert = false end end -- CHECKS IF NPCS IS ALREADY IN THE TABLE
        if insert then table.insert(npcs, v.Name) end -- IF THE NPCS ISNT INSERTED THEN INSERT IT
    end
    function bosses()
        for i,v in pairs(game:GetService("Workspace").Living:GetDescendants()) do
            if v:IsA("Model") and v:FindFirstChild("Boss") then
                table.insert(boss, Sense.AddInstance(v.HumanoidRootPart, {
                    enabled = false,
                    text = v.Name .. "\n{distance}",
                    distance = true,
                    textColor = { Color3.new(1,1,1), 1 },
                    textOutline = true,
                    textOutlineColor = Color3.new(),
                    textSize = 13,
                    textFont = 2,
                    limitDistance = false,
                    maxDistance = 150,
                }))
            end
        end
    end
    function enemies()
        for i,v in pairs(game:GetService("Workspace").Living:GetDescendants()) do
            if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("notrip") and v:FindFirstChild("Boss") == nil then
                table.insert(enemy, Sense.AddInstance(v.HumanoidRootPart, {
                    enabled = false,
                    text = v.Name .. "\n{distance}",
                    distance = true,
                    textColor = { Color3.new(1,1,1), 1 },
                    textOutline = true,
                    textOutlineColor = Color3.new(),
                    textSize = 13,
                    textFont = 2,
                    limitDistance = false,
                    maxDistance = 150,
                }))
            end
        end
    end
    game:GetService("Workspace").Living.DescendantAdded:Connect(function(v)
        if v:IsA("Model") and v:FindFirstChild("Boss") then
            NotificationLibrary:SendNotification("Info", "Mob added:"..v.Name, 3)
            table.insert(boss, Sense.AddInstance(v.HumanoidRootPart, {
                enabled = false,
                text = v.Name .. "\n{distance}",
                distance = true,
                textColor = { Color3.new(1,1,1), 1 },
                textOutline = true,
                textOutlineColor = Color3.new(),
                textSize = 13,
                textFont = 2,
                limitDistance = false,
                maxDistance = 150,                
            }))
        end
    end)
    game:GetService("Workspace").Living.DescendantAdded:Connect(function(v)
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("notrip") and v:FindFirstChild("Boss") == nil then
            NotificationLibrary:SendNotification("Info", "Mob added:"..v.Name, 3)
            table.insert(enemy, Sense.AddInstance(v.HumanoidRootPart, {
                enabled = false,
                text = v.Name .. "\n{distance}",
                distance = true,
                textColor = { Color3.new(1,1,1), 1 },
                textOutline = true,
                textOutlineColor = Color3.new(),
                textSize = 13,
                textFont = 2,
                limitDistance = false,
                maxDistance = 150,                
            }))
        end
    end)
    Sense.Load()
    local invite = "https://discord.gg/gbHkVD5S2g"
    local Window = Rayfield:CreateWindow({
        Name = "Chainsaw Man: Devil's Heart",
        LoadingTitle = "Skeered Hub",
        LoadingSubtitle = "by Skeered",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "Skeered Hub",
            FileName = "Chainsaw Man: Devil's heart"
        },
        KeySystem = true, -- Set this to true to use their key system
        KeySettings = {
            Title = "Skeered Hub",
            Subtitle = "Key System",
            Note = "Paste your clipboard for discord invite (key)",
            SaveKey = true,
            Key = _G.key
        },
            setclipboard(invite)
    })
    
    Rayfield:Notify({
        Title = "Welcome to Skeered Hub",
        Content = "Chainsaw Man: Devil's Heart",
        Duration = 2.5,
        Image = 4483362458,
        Actions = { -- Notification Buttons
            Ignore = {
                Name = "Okay!",
                Callback = function()
            end
            },
            },
        })
        local function has_quest()
            local mission = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild('Quest')
            if mission then
                --print(tostring(mission.quest.Value):find('fiends'),tonumber(mission.max.Value) < 3 )
                if tostring(mission.quest.Value):find('Kill fiends') and tonumber(mission.progress.Value) < 3 then
                    return true
                elseif tonumber(mission.progress.Value) >= 3 then
                    local repeat_mission = game:GetService("Players").LocalPlayer.PlayerGui.Quest:FindFirstChild('Completed')
                    if repeat_mission then
                        wait(1)
                        repeat wait()
                        until game:GetService("Players").LocalPlayer.PlayerGui.Quest.Completed
                        local dialog_xcp = game:GetService("Players").LocalPlayer.PlayerGui.Quest.Completed.Yes.TextLabel.AbsolutePosition
                        local dialog_xcs = game:GetService("Players").LocalPlayer.PlayerGui.Quest.Completed.Yes.TextLabel.AbsoluteSize
                        local dialogX = dialog_xcp+dialog_xcs
                        local dialog_ycp = game:GetService("Players").LocalPlayer.PlayerGui.Quest.Completed.Yes.AbsolutePosition
                        local dialog_ycs = game:GetService("Players").LocalPlayer.PlayerGui.Quest.Completed.Yes.AbsoluteSize
                        local dialogY = dialog_ycp+dialog_ycs
                        local repeat_mission_ap = game:GetService("Players").LocalPlayer.PlayerGui.Quest.Completed.Yes.AbsolutePosition
                        mousemoveabs(dialogX.X+offset,dialogY.Y+offset)
                        offset = offset - 2
                        wait(0.1)
                        mousemoveabs(dialogX.X+offset,dialogY.Y+offset)
                        wait(0.1)
                        mouse1click()
                    end
                    if tostring(mission.quest.Value):find('Kill fiends') and  tonumber(mission.max.Value) < 3 then
                        return true
                    end
                else
                    return false
                end
            end
         end
        
        
        local function accept_quest()
            local quest_boy = game:GetService("Workspace").DialogNPCs["grown up boy"].HumanoidRootPart
            local pos,onscreen = game.workspace.Camera:WorldToViewportPoint(quest_boy.Position)
            local dialog = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild('dialogGUI')
            if onscreen and not dialog then
                keypress(0x45)
                wait()
                keyrelease(0x45)
            elseif onscreen and dialog then
                wait(1)
                repeat wait()
                until game:GetService("Players").LocalPlayer.PlayerGui.dialogGUI
            local dialog_ap = game:GetService("Players").LocalPlayer.PlayerGui.dialogGUI.f.sf.option.AbsolutePosition
        local dialog_as = game:GetService("Players").LocalPlayer.PlayerGui.dialogGUI.f.sf.option.AbsoluteSize
        local dialogY = dialog_ap+dialog_as
        local dialog_xp = game:GetService("Players").LocalPlayer.PlayerGui.dialogGUI.f.sf.option.text.AbsolutePosition
        local dialog_xs = game:GetService("Players").LocalPlayer.PlayerGui.dialogGUI.f.sf.option.text.AbsoluteSize
        local dialogX = dialog_xp+dialog_xs
                mousemoveabs(dialogX.X+offset,dialogY.Y+offset)
                offset = offset - 2
                wait()
                mousemoveabs(dialogX.X+offset,dialogY.Y+offset)
                wait()
                mouse1click()
            end
        end
        function closest_npc()
            local npcs_folder = game:GetService("Workspace").Living
            local largest = math.huge
            local closestChild = nil
            for i,v in pairs(npcs_folder:GetChildren())do
                if v.Name:find('Fiend') and v.Name ~= "Cricket Fiend" and v:WaitForChild('HumanoidRootPart') and v:WaitForChild('Humanoid').Health > 0 then
                    local magnitude = (Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                    if magnitude < largest then
                        closestChild = v
                        largest = magnitude
                    end
                end
            end
            return closestChild
        end

    local Autofarm = Window:CreateTab("Autofarm", 4483345998) -- Title, Image
    local Teleport = Window:CreateTab("Teleport", 4370305588) -- Title, Image
    local localCheats = Window:CreateTab("LocalCheats", 6961018885) -- Title, Image
    local Esp = Window:CreateTab("ESP", 10802202912) -- Title, Image
    local Farm = Autofarm:CreateSection("Mob/Player farm")
    local NPC = Teleport:CreateSection("NPCs")
    local Movement = localCheats:CreateSection("Movements")
    local PlayerESP = Esp:CreateSection("Player ESP")
    
    local Mobchoose = Autofarm:CreateDropdown({
        Name = "Mob/Player",
        Options = mobs,
        CurrentOption = "Skeered HUB",
        Flag = "MobPlayer", 
        Callback = function(v)
            getgenv().mob = v
        end,
    })
    local NpcChoose = Teleport:CreateDropdown({
        Name = "NPCs",
        Options = npcs,
        CurrentOption = "1",
        Flag = "Npc", 
        Callback = function(t)
            getgenv().npc = t
            getgenv().teleport = t
                local npc = game:GetService("Workspace").DialogNPCs:FindFirstChild(getgenv().npc)
                        npc = game:GetService("Workspace").DialogNPCs:FindFirstChild(getgenv().npc)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0,2,-5)
                                wait(0.2)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0,2,-5)
                                wait(0.2)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0,2,-5)
                                wait(0.2)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0,2,-5)
                                wait(0.2)
                                getgenv().teleport = false        
                        wait() -- WAIT SO WE DONT CRASH
                    end})
            
    local Farmstart = Autofarm:CreateToggle({
        Name = "Mob/Player farm ",
        CurrentValue = false,
        Flag = "Farmstart", 
        Callback = function(v)
            getgenv().autofarmmobs = v
            while wait() do -- INFINITE LOOP
                if getgenv().autofarmmobs == false then return end -- IF THE TOGGLE IS OFF THEN STOP THE LOOP
                if getgenv().mob == nil then -- IF THE MOB ISNT SELECTED
                    game.StarterGui:SetCore("SendNotification", { -- SHOW NOTIFIACTION
                        Title = "Error!", -- NOTIFICACTION LABEL
                        Text = "You havent selected a mob with the dropdown above\nUntoggle this toggle!", -- NOTIFICATION DESCRIPTION / TEXT
                        Icon = "", -- ICON (NO ICON)
                        Duration = 2.5 -- DURATION OF THE NOTIFIACTIOn
                    })
                    getgenv().autofarmmobs = false -- TURN OFF THE AUTO FARM
                    return -- MAKE SURE IT DOESNT EXECUTE ANYTHING UNDER // FULLY TURN OFF THE LOOP
                end
                local mob = game:GetService("Workspace").Living:FindFirstChild(getgenv().mob)
                if mob == nil then
                    game.StarterGui:SetCore("SendNotification", { -- SHOW NOTIFIACTION
                        Title = "Info!", -- NOTIFICACTION LABEL
                        Text = "There is currently no spawned mobs of this type!\nJust wait until they spawn", -- NOTIFICATION DESCRIPTION / TEXT
                        Icon = "", -- ICON (NO ICON)
                        Duration = 2.5 -- DURATION OF THE NOTIFIACTIOn
                    })
                    while wait() do -- LOOP WHICH REPEATS UNTIL THE UNTIL IS TRUE / DONE
                        wait() -- WAIT SO WE DONT CRASH
                        if getgenv().autofarmmobs == false then return end -- IF THE TOGGLE IS OFF THEN STOP THE LOOP
                        if game:GetService("Workspace").Living:FindFirstChild(getgenv().mob) ~= nil then break; end
                    end -- IF THE MOB IS SPAWNED THEN GO ON WITH THE AUTOFARM
                else
                    local mob2 = mob
                    while wait() do
                        mob = game:GetService("Workspace").Living:FindFirstChild(getgenv().mob)
                        if mob ~= mob2 then break; end
                        if getgenv().autofarmmobs == false then return end -- IF THE TOGGLE IS OFF THEN STOP THE LOOP
                        if mob ~= nil then
                            if mob:FindFirstChild("Humanoid") then
                                if mob.Humanoid.Health == 0 then wait(0.1) mob:Destroy() break; end -- IF THE MOB IS DEAD THEN JUST DESTROY IT FOR FASTER FARMING
                            end
                            if mob:FindFirstChild("HumanoidRootPart") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,0,6) -- TELEPORT TO THE MOB
                                local A_1 = "NormalAttack"
                                local hit = game:GetService("ReplicatedStorage").events.remote
                                hit:FireServer(A_1)
                                end
                            end
                        end
                        wait() -- WAIT SO WE DONT CRASH
                    end
                end
            end
        })
        local function noclip()
            for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                end
            end
        end
        local TweenService = game:GetService("TweenService")
        local Fiendfarm = Autofarm:CreateToggle({
            Name = "Kill all Fiend (Activate AutoQuest)",
            CurrentValue = false,
            Flag = "Fiendfarm",
            Callback = function(v)
                getgenv().autofarmfiend = v
                _G.noclip = v
                if getgenv().autofarmfiend == false then return end
                while getgenv().autofarmfiend == true do
                    repeat wait()
                    until has_quest()
                    local fiend = closest_npc()
                    local fiendrootPart = fiend:WaitForChild("HumanoidRootPart")
                    if fiend and closest_npc() and fiendrootPart then
                        local character = game.Players.LocalPlayer.Character
                        local rootPart = character:WaitForChild("HumanoidRootPart")
                        local distance = (rootPart.Position - fiendrootPart.Position).Magnitude
                        
                        if distance < 20 then
                            local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
                            local tween = TweenService:Create(rootPart, tweenInfo, {CFrame = fiendrootPart.CFrame * CFrame.new(0, 0, 8)})
                            tween:Play()
                        else
                            local tweenInfo = TweenInfo.new(distance / 200, Enum.EasingStyle.Linear)
                            local tween = TweenService:Create(rootPart, tweenInfo, {CFrame = fiendrootPart.CFrame * CFrame.new(0, 0, 8)})
                            tween:Play()
                            tween.Completed:Wait()
                        end
                        
                        local A_1 = "NormalAttack"
                        local hit = game:GetService("ReplicatedStorage").events.remote
                        hit:FireServer(A_1)
                    end
                    
                    wait()
                end
            end
        })	   
        game.Players.LocalPlayer.CharacterAdded:connect(function(char)
            repeat wait()
            until Character
                wait(5)
                local toolname = "Katana" -- replace with the name of the tool
    local Plr = game:GetService("Players").LocalPlayer
        pcall(function()
            if Plr.Backpack:FindFirstChild(toolname) and Plr.Character:FindFirstChild(toolname) == nil then
                local tool = Plr.Backpack:FindFirstChild(toolname)
                Plr.Character.Humanoid:EquipTool(tool)
            end
        end)
    
                Fiendfarm.Callback(getgenv().autofarmfiend)
            end)
        local RFiendfarm = Autofarm:CreateToggle({
            Name = "Kill all Fiend (No AutoQuest)",
            CurrentValue = false,
            Flag = "Fiendfarm",
            Callback = function(v)
            getgenv().Rautofarmfiend = v
            while wait() do
            if getgenv().Rautofarmfiend == false then return end
            while wait() do
            wait()
            if getgenv().Rautofarmfiend == false then return end
            local fiend = game:GetService("Workspace").Living:FindFirstChild(fiend[math.random(#fiend)])
            if fiend ~= nil and fiend.Humanoid.Health > 0 then
            while fiend.Humanoid.Health > 0 do
            if getgenv().Rautofarmfiend == false then return end
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = fiend:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, 6)
            local A_1 = "NormalAttack"
            local hit = game:GetService("ReplicatedStorage").events.remote
            hit:FireServer(A_1)
            wait()
            end
            end
            end
            wait()
            end
            end
            })
    local Autoattack = Autofarm:CreateToggle({
        Name = "Auto Attack",
        CurrentValue = false,
        Flag = "Attack", 
        Callback = function(v)
            getgenv().autoattack = v
            while getgenv().autoattack == true do
            wait(0.5)
            local A_1 = "NormalAttack"
            local hit = game:GetService("ReplicatedStorage").events.remote
            hit:FireServer(A_1)
            end
        end,
    })
    local autoQuest = Autofarm:CreateToggle({
        Name = "Auto Quest",
        CurrentValue = false,
        Flag = "Quest",
        Callback = function(q)
            _G.toggle = q
            while _G.toggle == true do
                local quest_boy = game:GetService("Workspace").DialogNPCs["grown up boy"].HumanoidRootPart
                local Player = game:GetService('Players').LocalPlayer
                local Character = Player.Character
                repeat wait(0.25) until Player and Character and Character:FindFirstChild('HumanoidRootPart')
                local magnitude = (quest_boy.Position - Character.HumanoidRootPart.Position).magnitude
                if magnitude > 10 and not has_quest() then
                    local tweenInfo = TweenInfo.new((quest_boy.Position - Character.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                    local tween = TweenService:Create(Character.HumanoidRootPart, tweenInfo, {CFrame = quest_boy.CFrame})
                    tween:Play()
                    _G.noclip = true
                    tween.Completed:Wait()
                    _G.noclip = false
                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,quest_boy.Position)
                    accept_quest()
                elseif Character and magnitude <= 10 and not has_quest()  then
                    accept_quest()
                elseif Character and has_quest()  then
                    offset = 0
                   repeat wait()
                   until not has_quest()
               end
               wait(0.75)
             end
             Character.HumanoidRootPart.Anchored = false
        end,
    })
    local Update = Autofarm:CreateButton({
        Name = "Update Dropdown",
        Callback = function()
            Mobchoose:Set("Skeered HUB")
        end,
    })
    local walkKey = localCheats:CreateKeybind({
        Name = "Walkspeed Keybind",
        CurrentKeybind = "Y",
        HoldToInteract = false,
        Flag = "WalkKey", 
        Callback = function(Keybind)
            _G.Running = true
            while wait(0.005) and _G.Running == true do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 3
            end
        end
    })
    UIS.InputEnded:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode[walkKey.CurrentKeybind] then
            _G.Running = false
        end
    end)
    local Fly = localCheats:CreateToggle({
        Name = "Fly",
        CurrentValue = false,
        Flag = "Fly", 
        Callback = function(Value)
            _G.FlyT = Value
            if _G.FlyT == true then
            startFly()
            end
            if _G.FlyT == false then
            endFly()
            end
        end,
    })
    local Flyspeed = localCheats:CreateSlider({
        Name = "Fly Speed",
        Range = {50, 1000},
        Increment = 1,
        Suffix = "Speed",
        CurrentValue = 50,
        Flag = "Flyspeed", 
        Callback = function(Value)
            speed = Value
        end,
    })
    local InfJump = localCheats:CreateButton({
        Name = "Infinite Jump",
        Callback = function()
            _G.JumpHeight = 150;
     
            function Action(Object, Function) if Object ~= nil then Function(Object); end end
     
            UIS.InputBegan:connect(function(UserInput)
            if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
            Action(Player.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                                end)
                            end
                        end)
                    end
                end)
            end
            })
        local JumpHeight = localCheats:CreateSlider({
            Name = "Jump Height",
            Range = {0, 500},
            Increment = 1,
            Suffix = "Height",
            CurrentValue = 100,
            Flag = "JumpHeight", 
            Callback = function(Value)
                _G.JumpHeight = Value
            end,
        })
    local PEsp = Esp:CreateToggle({
                Name = "Player ESP",
                CurrentValue = false,
                Flag = "PEsp", 
                Callback = function(Value)
                    getgenv().PESP = Value
                    if getgenv().PESP == true then
                        startPESP()
                    end
                    if getgenv().PESP == false then
                        endPESP()
                    end
                end
                })
    local Enemies = Esp:CreateToggle({
            Name = "Enemy ESP",
            CurrentValue = false,
            Flag = "EEsp", 
            Callback = function(Value)
                for _, enemy in next, enemy do
                    enemy.options.enabled = Value
                end
            end
            })
    local BossESP = Esp:CreateToggle({
            Name = "Boss ESP",
            CurrentValue = false,
            Flag = "Boss ESP", 
                Callback = function(Value)
                    for _, boss in next, boss do
                        boss.options.enabled = Value
                    end
                end
            })
                        

    local ServerHop = Autofarm:CreateButton({
                    Name = "ServerHop",
                    Callback = function()
                        Time = 1 -- seconds
                        repeat wait() until game:IsLoaded()
                        wait(Time)
                        local PlaceID = game.PlaceId
                        local AllIDs = {}
                        local foundAnything = ""
                        local actualHour = os.date("!*t").hour
                        local Deleted = false
                        function TPReturner()
                            wait(5)
                            syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Skeereddo/name/main/source'))()")
                        local Site;
                        if foundAnything == "" then
                            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. 11345435986 .. '/servers/Public?sortOrder=Asc&limit=100'))
                        else
                            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. 11345435986 .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                            end
                        local ID = ""
                        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                            foundAnything = Site.nextPageCursor
                            end
                        local num = 0;
                        for i,v in pairs(Site.data) do
                        local Possible = true
                            ID = tostring(v.id)
                        if tonumber(v.maxPlayers) > tonumber(v.playing) then
                        for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                        else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                        end
                        end
                            num = num + 1
                        end
                        if Possible == true then
                            table.insert(AllIDs, ID)
                            wait()
                            pcall(function()
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                            wait(4)
                        end
                        end
                        end
                        end
                        function Teleport()
                        while wait() do
                            pcall(function()
                                TPReturner()
                                if foundAnything ~= "" then
                                    
                                    TPReturner()
                        end
                        end)
                        end
                        end
    
                        Teleport()
                    end,
    })
    while wait(5) do

        enemies()
        bosses()
    end
