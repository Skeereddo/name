    -- Project Mugetsu Lobby
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

    local Window = Rayfield:CreateWindow({
        Name = "PU Skeered Hub",
        LoadingTitle = "Skeered Hub",
        LoadingSubtitle = "by Skeered",
        ConfigurationSaving = {
        Enabled = true,
        FolderName = "Skeered Hub", -- Create a custom folder for your hub/game
        FileName = "PM Lobby"
        },
        Discord = {
        Enabled = true,
        Invite = "gbHkVD5S2g", -- The Discord invite code, do not include discord.gg/
        RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
        KeySystem = true, -- Set this to true to use our key system
        KeySettings = {
        Title = "Skeered Hub",
        Subtitle = "Key System",
        Note = "Join the discord (discord.gg/gbHkVD5S2g)",
        FileName = "SkeeredK",
        SaveKey = true,
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = _G.key
        }
    })
    local Main = Window:CreateTab("Main", 4483362458) -- Title, Image
    local Normal = Main:CreateSection("Normal Shit",false) -- The 2nd argument is to tell if its only a Title and doesnt contain elements

    local chooseClan = Main:CreateDropdown({
        Name = "Choose Clan Wanted",
        Options = {
            "Hitsugaya",
            "Hisagi",
            "Ichimaru",
            "Shihoin",
            "Unohana",
            "Uryu",
            "Cifer",
            "Yamamoto",
            "Urahara",
            "Kurosaki",
            "Urahara",
            "Aizen",
            "Zaraki",
            "Thoumeaux",
            "Yhwach"
        },
        SectionParent = Normal,
        CurrentOption = "Skeered Hub",
        MultiSelection = true,
        Callback = function(Option)
            clans = Option
        end,
    })

    local Spin = Main:CreateToggle({
        Name = "Auto Spin",
        CurrentValue = false,
        SectionParent = Op,
        Flag = "LootMain", 
        Callback = function(Value)
            getgenv().loop = Value
            local user = tostring(game.Players.LocalPlayer)
            while getgenv().loop do
                game:GetService("ReplicatedStorage").Spin:InvokeServer(1)
                task.wait(0.1)
                local found = false
    
                for i=1, #clans do
                    if clans[i]:lower() == game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value:lower() then
                        found = true
                        break
                    end
                end
    
                if found then
                    print("YAYYYYY YOU GOT "..tostring(game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value))
                    getgenv().loop = false
                else
                    print("Rolled "..tostring(game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value))
                end
            end
        end
    })
