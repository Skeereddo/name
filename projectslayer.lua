        -- Project Slayer
        local Instance_new = Instance.new
        local Vector3_new = Vector3.new
        local CFrame_new = CFrame.new
        local CFrame_Angles = CFrame.Angles
        local coroutine_wrap = coroutine.wrap
        local coroutine_yield = coroutine.yield
        local coroutine_running = coroutine.running
        local string_find = string.find
        local string_match = string.match
        local string_gsub = string.gsub
        local string_sub = string.sub
        local string_byte = string.byte
        local string_split = string.split
        local table_concat = table.concat
        local table_insert = table.insert
        local debug_traceback = debug.traceback
        local math_rad = math.rad
        local math_abs = math.abs
        local math_floor = math.floor
        local pog pog = nil
        local game = game
        local delay = delay
        local wait = wait
        local rawget = rawget
        local error = error
        local rawset = rawset
        local assert = function(p1, p2, p3)
        if not p1 then
        error(p2, p3)
        end
        end
        local newproxy = newproxy
        local ipairs = ipairs
        local getmetatable = getmetatable
        local setmetatable = setmetatable
        local tostring = tostring
        local tonumber = tonumber
        local type = type
        local typeof = typeof
        local pcall = pcall
        local xpcall = xpcall
        local setfenv = setfenv
        local getfenv = getfenv
        local workspace = workspace
        local newcclosure = newcclosure or function(p1)
        return coroutine_wrap(function(...)
        while true do
        coroutine_yield(p1(...))
        end
        end)
        end
        -- < Services > --
        local Loader = loadstring(game:HttpGet('https://raw.githubusercontent.com/Skeereddo/name/main/Loader'))()
        local VirtualInputManager = game:GetService("VirtualInputManager")
        local UserInputService = game:GetService("UserInputService")
        local ScriptContext = game:GetService("ScriptContext")
        local InsertService = game:GetService("InsertService")
        local TestService = game:GetService("TestService")
        local StudioData = game:GetService("StudioData")
        local RunService = game:GetService("RunService")
        local CoreGui = game:GetService("CoreGui")
        local Players = game:GetService("Players")
        local GlobalSettings = settings()
        local TaskScheduler = GlobalSettings:GetService("TaskScheduler")
        -- < Class Aliases > --
        local IsA = game.IsA
        local IsDescendantOf = game.IsDescendantOf
        local GetPropertyChangedSignal = game.GetPropertyChangedSignal
        local Destroy = game.Destroy
        local WaitForChild = game.WaitForChild
        local Fire = Instance_new("BindableEvent").Fire
        local MoveTo = Instance_new("Model").MoveTo
        local InputHoldBegin, InputHoldEnd = (function()
            local A = Instance_new("ProximityPrompt")
            return A.InputHoldBegin, A.InputHoldEnd
        end)()
        local GetFFlag = GlobalSettings.GetFFlag
        local IsClient = RunService.IsClient
        local IsServer = RunService.IsServer
        local Error = ScriptContext.Error
        local RenderStepped = RunService.RenderStepped
        local LoadLocalAsset = InsertService.LoadLocalAsset
        local Message = TestService.Message
        local SendMouseButtonEvent = VirtualInputManager.SendMouseButtonEvent
        local SendMouseWheelEvent = VirtualInputManager.SendMouseWheelEvent
        local SendMouseMoveEvent = VirtualInputManager.SendMouseMoveEvent
        local SendKeyEvent = VirtualInputManager.SendKeyEvent
        local GetMouseLocation = UserInputService.GetMouseLocation
        local Wait, Connect, Disconnect = (function()
            local A = game.Changed
            local B = A.Connect
            return A.Wait, B, B(A, function()end).Disconnect
        end)()
        -- < Upvalues > --
        local ChangedSignals = {}
        local HiddenPropertyEvents = {}
        local IsRBXActive = true
        local LocalCamera = workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer
        local LocalMouse = LocalPlayer:GetMouse()
        local instance_table = game:GetDescendants()
        local env = (getgenv and getgenv or getrenv and getrenv or getfenv)()
        local env_add = function(p1, p2, p3, p4)
        if rawget(env, p1) then return end
        if p4 and not rawget(env, p4) then return end
        rawset((p4 and env[p4] or env), p1, (p3 and newcclosure or function(p1) 
        return p1
        end)(p2))
        end
        -- < Source > --
        Connect(game.DescendantAdded, function(p1)
        table_insert(instance_table, p1)
        end)
        Connect(game.ItemChanged, function(p1, p2)
        local A = HiddenPropertyEvents[p1]
        if A then
        local B = A[p2]
        if B then
        for C, D in ipairs(B) do
        Fire(D)
        end
        end
        end
        end)
        Connect(UserInputService.WindowFocusReleased, function()
        IsRBXActive = false
        end)
        Connect(UserInputService.WindowFocused, function()
        IsRBXActive = true
        end)
        env_add("info", function(p1)
        assert(type(p1) ~= "nil", "invalid argument #1 to '?' (value expected)", 2)
        local A = pcall(Message, TestService, "Information\n" .. tostring(p1))
        return A
        end, true)
        env_add("httpget", game.HttpGetAsync)
        env_add("httppost", game.HttpPostAsync)
        env_add("getreg", function()
        -- There is no known method to do this in lua
        return {}
        end, true)
        env_add("getgc", function(p1)
        -- There is no known method to do this in lua
        return {}
        end, true)
        env_add("newcclosure", newcclosure, true)
        env_add("clonefunction", function(p1)
        assert(type(p1) == "function", "invalid argument #1 to '?' (function expected)", 2)
        local A = p1
        local B = xpcall(setfenv, function(p2, p3)
        return p2, p3
        end, p1, getfenv(p1))
        if B then
        return function(...)
        return A(...)
        end
        end
        return coroutine_wrap(function(...)
        while true do
        A = coroutine_yield(A(...))
        end
        end)
        end, true)
        env_add("iscclosure", function(p1)
        assert(type(p1) == "function", "invalid argument #1 to '?' (function expected)", 2)
        local A = xpcall(setfenv, function(p2, p3)
        return p2, p3
        end, p1, getfenv(p1))
        return not A
        end, true)
        env_add("islclosure", function(p1)
        assert(type(p1) == "function", "invalid argument #1 to '?' (function expected)", 2)
        local A = xpcall(setfenv, function(p2, p3)
        return p2, p3
        end, p1, getfenv(p1))
        return A
        end, true)
        env_add("newlclosure", function(p1)
        assert(type(p1) == "function", "invalid argument #1 to '?' (function expected)", 2)
        local A = p1
        return function(...)
        return A(...)
        end
        end, true)
        env_add("getexecutioncontext", function()
        return IsClient(RunService) and "Client" or IsServer(RunService) and "Server" or "Studio"
        end, true)
        env_add("getthreadidentity", function()
        local A, B = xpcall(GetPropertyChangedSignal, function(p1, p2)
        return p1, p2
        end, StudioData, "SrcUniverseId")
        return A and 7 or string_sub(string_split(B, "identity (")[2], 1, 1)
        end, true)
        env_add("setthreadidentity", function(p1)
        -- There is no known method to do this in lua
        end, true)
        env_add("ishiddenproperty", function(p1, p2)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(type(p2) == "string", "invalid argument #2 to '?' (string expected)", 2)
        local A, B = xpcall(GetPropertyChangedSignal, function(p3, p4)
        return p3, p4
        end, p1, p2)
        assert(not string_find(tostring(B), "not a valid"), "invalid argument #2 to '?' (property expected)", 2)
        return (not A)
        end, true)
        env_add("isreadonly", function(p1)
        assert(type(p1) == "table", "invalid argument #1 to '?' (table expected)", 2)
        local A = xpcall(rawset, function(p2)
        return p2
        end, p1)
        return (not A)
        end, true)
        env_add("getpropvalue", function(p1, p2)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(type(p2) == "string", "invalid argument #2 to '?' (string expected)", 2)
        local A, B = xpcall(GetPropertyChangedSignal, function(p3, p4)
        return p3, p4
        end, p1, p2)
        assert(not string_find(tostring(B), "not a valid"), "invalid argument #2 to '?' (property expected)", 2)
        local A, B = pcall(function()
        return p1[p2]
        end)
        if A then
        return B
        end
        end, true)
        env_add("setpropvalue", function(p1, p2, p3)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(type(p2) == "string", "invalid argument #2 to '?' (string expected)", 2)
        assert(type(p3) ~= "nil", "invalid argument #3 to '?' (value expected)", 2)
        local A, B = xpcall(GetPropertyChangedSignal, function(p3, p4)
        return p3, p4
        end, p1, p2)
        assert(not string_find(tostring(B), "not a valid"), "invalid argument #2 to '?' (property expected)", 2)
        local A, B = pcall(function()
        p1[p2] = p3
        end)
        return A
        end, true)
        env_add("getsenv", function(p1)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(IsA(p1, "LocalScript"), "invalid argument #1 to '?' (LocalScript expected)", 2)
        local A = getreg()
        local B = {}
        for C, D in next, A do
        if type(D) == "function" and islclosure(D) then
        local E = getfenv(D)
        local F = rawget(E, "script")
        if F and F == p1 then
        for G, H in next, E do
        if G ~= "script" then
        rawset(B, G, H)
        end
        end
        end
        end
        end
        return B
        end, true)
        env_add("getmenv", function(p1)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(IsA(p1, "ModuleScript"), "invalid argument #1 to '?' (ModuleScript expected)", 2)
        local A = getreg()
        local B = {}
        if #A == 0 then
        return require(p1)
        end
        for C, D in next, A do
        if type(D) == "function" and islclosure(D) then
        local E = getfenv(D)
        local F = rawget(E, "script")
        if F and F == p1 then
        for G, H in next, E do
        if G ~= "script" then
        rawset(B, G, H)
        end
        end
        end
        end
        end
        return B
        end, true)
        env_add("nyspawn", function(p1)
        assert(type(p1) == "function", "invalid argument #1 to '?' (function expected)", 2)
        local A = xpcall(setfenv, function(p1)
        return p1
        end, p1, getfenv(p1))
        assert(A, "invalid argument #1 to '?' (Lua function expected)", 2)
        local B = setmetatable({}, setmetatable({__concat = function()p1()end}, {__mode = "vk"})) .. pog
        end, true)
        env_add("isrobloxscript", function(p1)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(IsA(p1, "LuaSourceContainer"), "invalid argument #1 to '?' (LuaSourceContainer expected)", 2)
        assert(gethiddenproperty, "isrobloxscript is not enabled.", 3)
        if IsA(p1, "CoreScript") then
        return true
        end
        local A = gethiddenproperty(p1, "ScriptGuid")
        return #A == 0
        end, true)
        env_add("unlockmodulescript", function(p1)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(IsA(p1, "ModuleScript"), "invalid argument #1 to '?' (ModuleScript expected)", 2)
        end, true)
        env_add("isluau", function()
        return _VERSION == "Luau"
        end, true)
        env_add("dumpstring", function(p1)
        assert(type(p1) == "string", "invalid argument #1 to '?' (string expected)", 2)
        return tostring("\\" .. table_concat({string_byte(p1, 1, #p1)}, "\\"))
        end, true)
        pcall(env_add, "isvalidlevel", function(p1)
        assert(type(p1) == "number", "invalid argument #1 to '?' (number expected)")
        local A = xpcall(getfenv, function(p2)
        return p2
        end, p1)
        return A
        end, true, "debug")
        pcall(env_add, "getregistry", getreg, false, "debug")
        pcall(env_add, "getconstants", function(p1)
        -- There is no known method to do this in lua
        assert(type(p1) == "function", "invalid argument #1 to '?' (function expected)", 2)
        local A = xpcall(setfenv, function(p1, p2)
        return p1, p2
        end, p1, getfenv(p1))
        assert(A, "invalid argument #1 to '?' (Lua function expected)", 2)
        return {}
        end, true, "debug")
        pcall(env_add, "getprotos", function(p1)
        -- There is no known method to do this in lua
        assert(type(p1) == "function", "invalid argument #1 to '?' (function expected)", 2)
        local A = xpcall(setfenv, function(p2, p3)
        return p2, p3
        end, p1, getfenv(p1))
        assert(A, "invalid argument #1 to '?' (Lua function expected)", 2)
        return {}
        end, true, "debug")
        pcall(env_add, "getupvalues", function(p1)
        -- There is no known method to do this in lua
        assert(type(p1) == "function", "invalid argument #1 to '?' (function expected)", 2)
        return {}
        end, true, "debug")
        pcall(env_add, "getstack", function(p1)
        -- There is no known method to do this in lua
        assert(type(p1) == "number", "invalid argument #1 to '?' (number expected)", 2)
        local A = xpcall(getfenv, function(p2)
        return p2
        end, p1)
        assert(A, "invalid argument #1 to '?' (valid level expected)", 2)
        return {}
        end, true, "debug")
        env_add("getinstances", function()
        return instance_table
        end, true)
        env_add("getnilinstances", function()
        local A = {}
        for B, C in ipairs(instance_table) do
        if C.Parent == pog then
        table_insert(A, C)
        end
        end
        return A
        end, true)
        env_add("getscripts", function(p1)
        local A = {}
        for B, C in ipairs(instance_table) do
        if IsA(C, "LocalScript") or IsA(C, "ModuleScript") or (p1 and IsA(C, "CoreScript")) then
        table_insert(A, C)
        end
        end
        return A
        end, true)
        env_add("getmodules", function()
        local A = {}
        for B, C in ipairs(instance_table) do
        if IsA(C, "ModuleScript") then
        table_insert(A, C)
        end
        end
        return A
        end, true)
        env_add("getallthreads", function()
        local A = {}
        local B = getreg()
        for C, D in next, B do
        if type(D) == "thread" then
        table_insert(A, D)
        end
        end
        return A
        end, true)
        env_add("getthread", function()
        return coroutine_running()
        end, true)
        env_add("isnetworkowner", function(p1)
        -- "NetworkOwnerV3" can't be accessed in lua due to it being a 'SystemAddress' type property
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(IsA(p1, "BasePart"), "invalid argument #1 to '?' (BasePart expected)", 2)
        local A = LocalPlayer.SimulationRadius
        local B = LocalPlayer.Character or Wait(LocalPlayer.CharacterAdded)
        local C = WaitForChild(B, "HumanoidRootPart", 300)
        if C then
            if p1.Anchored then
                return false
            end
            if IsDescendantOf(p1, B) or (C.Position - p1.Position).Magnitude <= A then
                return true
            end
        end
        return false
        end, true)
        env_add("setsimulationradius", function(p1, p2)
        assert(type(p1) == "number", "invalid argument #1 to '?' (number expected)", 2)
        local A = setpropvalue
        A(LocalPlayer, "SimulationRadius", p1)
        if p2 then
        A(LocalPlayer, "MaxSimulationRadius", p2)
        end
        end, true)
        env_add("gettypeof", function(p1)
        if type(p1) == "function" then
        return "function"
        end
        delay(0, p1)
        local A = Wait(Error)
        local B = string_match(A, "%a+", 18)
        return B
        end)
        env_add("getcallingscript", function()
        local A, B = xpcall(getfenv, function()
        return rawget(getfenv(0), "script")
        end, 3)
        local C = rawget(B, "script")
        if not C or typeof(C) ~= "Instance" then
        local D = string_match(debug_traceback(), "%w+:[%d%s]+$")
        return string_split(D, ":")[1]
        end
        return C
        end, true)
        env_add("getcurrentline", function()
        return tonumber(string_match(debug_traceback(), "[%d%s]+$"))
        end, true)
        env_add("getmemoryaddress", function(p1, p2)
        assert(type(p2) == "boolean" or type(p2) == "nil", "invalid argument #2 to '?' (<boolean, nil> expected)", 2)
        local A = p2 == pog and true or p2
        local B, C = xpcall(tostring, function()
        return
        end, p1)
        local D = string_match(C, ": ?(.+)")
        return (not A) and string_gsub(D, "0x", "") or D
        end, true)
        env_add("getfflag", function(p1)
        assert(type(p1) == "string", "invalid argument #1 to '?' (string expected)", 2)
        return GetFFlag(p1)
        end, true)
        env_add("gethui", function()
        return CoreGui
        end, true)
        env_add("getscheduler", function()
        return TaskScheduler
        end, true)
        env_add("GetObjects", function(p1)
        assert(type(p1) == "string", "invalid argument #1 to '?' (string expected)", 2)
        assert(string_find(p1, "://"), "invalid argument #1 to '?' (url expected)", 2)
        return {
        LoadLocalAsset(InsertService, p1)
        }
        end, true)
        env_add("setpropertylocked", function(p1, p2, p3)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)")
        assert(type(p2) == "string", "invalid argument #2 to '?' (string expected)")
        assert(type(p3) == "boolean", "invalid argument #3 to '?' (boolean expected)")
        local A, B = xpcall(GetPropertyChangedSignal, function(p4, p5)
        return p4, p5
        end, p1, p2)
        assert(A, B, 0)
        if ChangedSignals[p1] and p3 then
        assert(not ChangedSignals[p1][p2], "This property is already locked!", 0)
        end
        if p3 then
        local C C = p1[p2]
        local D D = Connect(B, function()
        local A = tostring(C)
        A = A == "nil" and "NULL" or A
        p1[p2] = C
        error("The " .. p2 .. " property of " .. tostring(p1) .. " is locked, current: " .. A, 0)
        end)
        local E E = ChangedSignals[p1]
        if E then
        E[p2] = D
        else
        ChangedSignals[p1] = {
        [p2] = D
        }
        end
        else
        local F F = ChangedSignals[p1]
        if F then
        local G G = F[p2]
        if G then
        Disconnect(G)
        F[p2] = nil
        end
        end
        end
        end, true)
        env_add("GetHiddenPropertyChangedSignal", function(p1, p2)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(type(p2) == "string", "invalid argument #2 to '?' (string expected)", 2)
        local A, B = xpcall(GetPropertyChangedSignal, function(p3, p4)
        return p3, p4
        end, p1, p2)
        assert(not string_find(tostring(B), "not a valid"), "invalid argument #2 to '?' (property expected)", 2)
        if A then
        return GetPropertyChangedSignal(p1, p2)
        end
        local D = newproxy(true)
        local E = getmetatable(D)
        E.__newindex = function(p5, p6, p7)
        error(tostring(p6) .. " cannot be assigned to", 0)
        end
        E.__index = function(p8, p9)
        local A = {}
        local C = Instance_new("BindableEvent")
        function A:Connect(p10)
        Connect(C.Event, p10)
        local A = HiddenPropertyEvents[p1]
        if A then
        local B = A[p2]
        if B then
        table_insert(B, C)
        else
        A[p2] = {C}
        end
        else
        HiddenPropertyEvents[p1] = {[p2] = {C}}
        end
        local B = newproxy(true)
        local D = getmetatable(B)
        D.__newindex = function(p1, p2)
        error(tostring(p2) .. " cannot be assigned to", 0)
        end
        D.__index = function(p3, p4)
        local A = {}
        function A:Disconnect()
        local A = HiddenPropertyEvents[p1]
        if A then
        local B = A[p2]
        if B then
        Destroy(C)
        else
        A[p2] = {}
        end
        else
        HiddenPropertyEvents[p1] = {}
        end
        end
        local B = A[p4]
        if B then
        return B
        end
        error(p4 .. " is not a valid member of CustomScriptConnection", 0)
        end
        D.__tostring = function()
        return "Connection"
        end
        D.__metatable = "The metatable is locked"
        return B
        end
        function A:Wait()
        local A = HiddenPropertyEvents[p1]
        if A then
        local B = A[p2]
        if B then
        table_insert(B, C)
        else
        A[p2] = {C}
        end
        else
        HiddenPropertyEvents[p1] = {[p2] = {C}}
        end
        Wait(C.Event)
        end
        local B = A[p9]
        if B then
        return B
        end
        error(p9 .. " is not a valid member of CustomScriptSignal", 0)
        end
        E.__tostring = function(p12)
        return "Signal " .. p2 .. "Changed"
        end
        E.__metatable = "The metatable is locked"
        return D
        end, true)
        env_add("isrbxactive", function()
        return IsRBXActive
        end, true)
        env_add("fireproximityprompt", function(p1, p2)
        assert(typeof(p1) == "Instance", "invalid argument #1 to '?' (Instance expected)", 2)
        assert(IsA(p1, "ProximityPrompt"), "invalid argument #1 to '?' (ProximityPrompt expected)", 2)
        assert(type(p2) == "number" or type(p2) == "nil", "invalid argument #2 to '?' (<number, void> expected)", 2)
        local A = p1.Parent
        if A then
            local C = LocalPlayer.Character or Wait(LocalPlayer.CharacterAdded)
            if C then
                local D = WaitForChild(C, "HumanoidRootPart", 300)
                if D then
                    local E = D.Position
                    local F = A.Position
                    local G = p1.HoldDuration
                    local H = p1.MaxActivationDistance
                    p1.HoldDuration = 0
                    if (E - F).Magnitude <= H then
                        InputHoldBegin(p1)
                        InputHoldEnd(p1)
                    else
                        p1.MaxActivationDistance = 9e99
                        MoveTo(C, F)
                        delay(.5, function()
                            InputHoldBegin(p1)
                            InputHoldEnd(p1)
                        end)
                    end
                    p1.MaxActivationDistance = H
                    p1.HoldDuration = G
                end
            end
        end
        end, true)
        env_add("mouse1click", function(p1, p2, p3)
        local A = GetMouseLocation(UserInputService)
        SendMouseButtonEvent(VirtualInputManager, p2 or A.X, p3 or A.Y, 0, true, pog, 0)
        delay(p1, function()
        SendMouseButtonEvent(VirtualInputManager, p2 or A.X, p3 or A.Y, 0, false, pog, 0)
        end)
        end, true)
        env_add("mouse1press", function(p1, p2)
        local A = GetMouseLocation(UserInputService)
        SendMouseButtonEvent(VirtualInputManager, p1 or A.X, p2 or A.Y, 0, true, pog, 0)
        end, true)
        env_add("mouse1release", function(p1, p2)
        local A = GetMouseLocation(UserInputService)
        SendMouseButtonEvent(VirtualInputManager, p1 or A.X, p2 or A.Y, 0, false, pog, 0)
        end, true)
        env_add("mouse2click", function(p1, p2, p3)
        local A = GetMouseLocation(UserInputService)
        SendMouseButtonEvent(VirtualInputManager, p2 or A.X, p3 or A.Y, 1, true, pog, 0)
        delay(p1, function()
        SendMouseButtonEvent(VirtualInputManager, p2 or A.X, p3 or A.Y, 1, false, pog, 0)
        end)
        end, true)
        env_add("mouse2press", function(p1, p2)
        local A = GetMouseLocation(UserInputService)
        SendMouseButtonEvent(VirtualInputManager, p1 or A.X, p2 or A.Y, 1, true, pog, 0)
        end, true)
        env_add("mouse2release", function(p1, p2)
        local A = GetMouseLocation(UserInputService)
        SendMouseButtonEvent(VirtualInputManager, p1 or A.X, p2 or A.Y, 1, false, pog, 0)
        end, true)
        env_add("keypress", function(p1, p2)
        SendKeyEvent(VirtualInputManager, true, p1, p2 and p2 or false, pog)
        end, true)
        env_add("keyrelease", function(p1)
        SendKeyEvent(VirtualInputManager, false, p1, false, pog)
        end, true)
        env_add("mousemoveabs", function(p1, p2)
        local A = GetMouseLocation(UserInputService)
        return SendMouseMoveEvent(VirtualInputManager, p1, p2)
        end, true)
        env_add("mousemoverel", function(p1, p2)
        local A = GetMouseLocation(UserInputService)
        return SendMouseMoveEvent(VirtualInputManager, A.X + p1, A.Y + p1, p1, p2)
        end, true)
        env_add("mousescroll", function(p1, p2, p3)
        if (type(p1) == "boolean") then
        p1 = p1 and 120 or -120
        end
        assert(type(p1) == "number", "invalid argument #1 to '?' (<boolean, number> expected)")
        local A = GetMouseLocation(UserInputService)
        for B = 1, math_abs(math_floor(p1 / 120)) do
        SendMouseWheelEvent(VirtualInputManager, p2 or A.X, p3 or A.Y, p1 >= 0, pog)
        Wait(RenderStepped)
        end
        end, true)

        local player = game.Players.LocalPlayer
        local weapons = {}
        local mobs = {}
        local character = player.Character or player.CharacterAdded:Wait()
        local client = game:GetService("Players").LocalPlayer
        local user = client.Name
        local TweenService = game:GetService("TweenService")
        local noclipE = nil
        local antifall = nil
        Skills = {
            Z = false,
            X = false,
            C = false,
            V = false,
            B = false,
            N = false,
        }
        local mod = require(game:GetService("ReplicatedStorage").Modules.Server["Skills_Modules_Handler"])
        getrenv()._G.handle_irregular = nil
        getrenv()._G.cuasdamsndasdasd = nil
        
        _G.cuasdamsndasdasd = function()
            return
        end

        _G.handle_irregular = function()
            return false
        end

        mod.Kick = function()
            return
        end

        game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"]["Client_Global_utility"].Disabled = true
        game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"]["client_global_delete_script"].Disabled = true

        game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"]["Client_Global_utility"]:GetPropertyChangedSignal("Disabled"):Connect(function()
            game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"]["Client_Global_utility"].Disabled = true
            game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"]["client_global_delete_script"].Disabled = true
       end)

        
        repeat wait() until game:IsLoaded()
        
        
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
        
        local Data = game:GetService("ReplicatedStorage")["Player_Data"][player.Name]
        
            function RW()
                weapons = {}
                    for i, v in pairs(player.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v:FindFirstChild("Mastery_Equiped") then
                        table.insert(weapons, v)
                    end
                end    
            end
            RW()
        
            function RN()
                mobs = {}
                for _,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do -- LOOPS THROUGH ALL MOBS
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                    insert = true -- VALUE TO CHECK THE MOB
                    for _,v2 in pairs(mobs) do if v2.Name == v.Name or v2 == v then insert = false end end -- CHECKS IF MOB IS ALREADY IN THE TABLE
                    if insert then table.insert(mobs, v) end -- IF THE MOB ISNT INSERTED THEN INSERT IT
                    end
                end
            end
            RN()
        
            function closestHorse()
        
                    local largest = math.huge
                    local closestChild = nil
                    for i,v in pairs(game:GetService("Workspace"):GetChildren())do
                        if v.Name == "Model" and v:FindFirstChild("newhorse") and v:FindFirstChild("Customization data ting") and v:FindFirstChild("Customization data ting"):FindFirstChild("HumanoidRootPart") then 
                            local magnitude = (player.Character.HumanoidRootPart.Position - v:FindFirstChild("Customization data ting"):FindFirstChild("HumanoidRootPart").Position).magnitude
                            if magnitude < largest then
                                closestChild = v
                                largest = magnitude
                            end
                        end
                    end
                    return closestChild
            end
        
            function findMob()
                local largest = math.huge
                local closestChild = nil
                local hrp = character:WaitForChild("HumanoidRootPart")
                for i, v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v.Name == getgenv().SelectedMob then
                        local magnitude = (character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                        if magnitude < largest then
                            closestChild = v
                            largest = magnitude
                        end
                    end
                end
                return closestChild
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


    
        
            function tweenCharacterTo(targetPosition, noclip, antifall)
                if noclip then
                    _G.noclip = true
                end
                if antifall then
                    antifall = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
                    antifall.Velocity = Vector3.new(0, 0, 0)
                end
                local character = player.Character
                local tweenInfo = TweenInfo.new(
                    (targetPosition - character.HumanoidRootPart.Position).Magnitude / 200, -- duration
                    Enum.EasingStyle.Linear,
                    Enum.EasingDirection.Out
                )
                local tween = game:GetService("TweenService"):Create(
                    character.HumanoidRootPart,
                    tweenInfo,
                    { CFrame = CFrame.new(targetPosition + Vector3.new(0, 4, 0)) }
                )
                tween:Play()
                tween.Completed:Wait()
                if noclip then
                    _G.noclip = false
                end
                if antifall then
                    antifall:Destroy()
                end
            end
            function customtwn(input, studspersecond, offset)
                local char = game:GetService("Players").LocalPlayer.Character;
                local input = input or error("input is nil");
                local studspersecond = studspersecond or 1000;
                local offset = offset or CFrame.new(0,0,0);
                local vec3, cframe;
             
                if typeof(input) == "table" then
                    vec3 = Vector3.new(unpack(input)); cframe = CFrame.new(unpack(input));
                elseif typeof(input) ~= "Instance" then
                    return error("wrong format used");
                end;
                
                Time = (char.HumanoidRootPart.Position - (vec3 or input.Position)).magnitude/studspersecond;
                local twn = game.TweenService:Create(char.HumanoidRootPart, TweenInfo.new(Time,Enum.EasingStyle.Linear), {CFrame = (cframe or input.CFrame) * offset});
                twn:Play();
                twn.Completed:Wait();
             end;
            
             function findMob()
                local largest = math.huge
                local closestChild = nil
                local hrp = character:WaitForChild("HumanoidRootPart")
                for i, v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v.Name == getgenv().SelectedMob then
                        local magnitude = (character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                        if magnitude < largest then
                            closestChild = v
                            largest = magnitude
                        end
                    end
                end
                return closestChild
            end

            function findMob1()
                local largest = math.huge
                local closestChild = nil
                local hrp = character:WaitForChild("HumanoidRootPart")
                for i, v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                        local magnitude = (character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                        if magnitude < largest then
                            closestChild = v
                            largest = magnitude
                        end
                    end
                end
                return closestChild
            end


            function findBoss()
                local largest = math.huge
                local closestChild = nil
                local hrp = character:WaitForChild("HumanoidRootPart")
                for i, v in pairs(game:GetService("Workspace").Mobs.Bosses:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                        if v.Name == "Akeza" or v.Name == "Rengoku" or v.Name == "Douma" or v.Name == "Tengen" then
                            closestChild = v
                            return closestChild
                        end
                        local magnitude = (character.HumanoidRootPart.Position - v:GetBoundingBox().Position).magnitude
                        if magnitude < largest then
                            closestChild = v
                            largest = magnitude
                        end
                    end
                end
                return closestChild
            end



            local client = game:GetService("Players").LocalPlayer
            local function attack(method)
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
            end




        local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Skeereddo/name/main/Rayfield'))()
        
        local Window = Rayfield:CreateWindow({
            Name = "PS │ Skeered Hub",
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
        
        local NPCs = Main:CreateDropdown({
            Name = "Select NPCs",
            Options = mobs,
            CurrentOption = "Skeered Hub",
            MultiSelection = false,
            Flag = "Npcs",
            SectionParent = Settings,
            Callback = function(v)
                getgenv().SelectedMob = v.Name
            end,
        })
        local Method = Main:CreateDropdown({
            Name = "Farm Method",
            Options = {"Above", "Below"},
            CurrentOption = "Select something here",
            MultiSelection = false,
            Flag = "Npcs",
            SectionParent = Settings,
            Callback = function(v)
                mode = v
            end,
        })
        local KillMethod = Main:CreateDropdown({
            Name = "Killaura Method",
            Options = {"Slow", "Fast"},
            CurrentOption = "Select something here",
            MultiSelection = false,
            Flag = "Method",
            SectionParent = Settings,
            Callback = function(v)
                Method = v
            end,
        })
        local KillWeapon = Main:CreateDropdown({
            Name = "Killaura Weapon",
            Options = {"Fist", "Claws", "Sword", "Fans", "Scythe"},
            CurrentOption = "Select something here",
            MultiSelection = false,
            Flag = "Weapon",
            SectionParent = Settings,
            Callback = function(v)
                Weapon = v
            end,
        })    
        local RefNPCs = Main:CreateButton({
            Name = "Refresh NPCs",
            SectionParent = Settings,
            Callback = function()
                RN()
                task.wait(0.1)
                NPCs:Refresh(mobs,"Skeered HUB")
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

        local KillWait = Main:CreateSlider({
            Name = "Killaura Delay",
            Range = {2, 5},
            Increment = 1,
            Suffix = "Seconds",
            CurrentValue = 3,
            Flag = "Wait",
            SectionParent = Settings,
            Callback = function(v)
            getgenv().KillWait = v
            end,
        })

        local Autofarm = Main:CreateToggle({
            Name = "Auto Farm",
            CurrentValue = false,
            Flag = "AutoFarm",
            SectionParent = Farm,
            Callback = function(v)
                getgenv().autofarmmobs = v
               
            end
        })
        
local FarmAllNpc = Main:CreateToggle({
    Name = "Farm all NPC",
    CurrentValue = false,
    Flag = "FarmAll", 
    SectionParent = Farm,
    Callback = function(v)
        getgenv().FarmAll = v
        local Humanoid = character.Humanoid
        local hrp = character:WaitForChild("HumanoidRootPart")
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
                        local character = player.Character
                        local hrp = character:WaitForChild("HumanoidRootPart")
                        
                        if mode == "Above" then
                            repeat
                                task.wait()
                                local character = player.Character
                                local hrp = character:WaitForChild("HumanoidRootPart")
                                local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).magnitude
                                if magnitude > 20 then
                                    moveto(mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0), 300)
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
                                    moveto(mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0), 300)
                                else
                                    hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0)
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
        end
    end
})


        local Farmallboss = Main:CreateToggle({
            Name = "Farm all Bosses",
            CurrentValue = false,
            Flag = "Farmallboss", 
            SectionParent = Farm,
            Callback = function(v)
                getgenv().FarmAllBosses = v
                local Humanoid = character.Humanoid
                local hrp = character:WaitForChild("HumanoidRootPart")
                while task.wait() do
                    if getgenv().FarmAllBosses == false then return end
        
                    local mob = findBoss()
                    if mob == nil then
                        while task.wait() do
                            task.wait()
                            if getgenv().FarmAllBosses == false then return end
                            if findBoss() ~= nil then break end
                        end
                    else
                        while wait() do
                            task.wait()
        
                            if getgenv().FarmAllBosses == false then return end
        
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
                                            moveto(mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0), 300)
                                        else
                                            hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0)
                                        end
                                    until not FarmAllBosses or not mob or mob:FindFirstChild("Humanoid").Health <= 0
                                elseif mode == "Below" then
                                    repeat
                                        task.wait()
                                        local character = player.Character
                                        local hrp = character:WaitForChild("HumanoidRootPart")
                                        local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).magnitude
                                        if magnitude > 20 then
                                            moveto(mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0), 300)
                                        else
                                            hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0)
                                        end
                                    until not FarmAllBosses or not mob or mob:FindFirstChild("Humanoid").Health <= 0
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
        
        local Killaura = Main:CreateToggle({
            Name = "Killaura",
            CurrentValue = false,
            Flag = "AutoFarm", 
            SectionParent = Farm,
            Callback = function(v)
                getgenv().killaura = v
                while getgenv().killaura do
                    if Method == "Slow" then
                        if Weapon == "Fist" then
                        local ohString1 = "fist_combat"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 1
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fist_combat"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 2
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fist_combat"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 3
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fist_combat"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 4
            
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                        elseif Weapon == "Claws" then
                        local ohString1 = "claw_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 1
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "claw_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 2
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "claw_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 3
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "claw_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 4
            
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                        elseif Weapon == "Sword" then 
                        local ohString1 = "Sword_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 1
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Sword_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 2
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Sword_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 3
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Sword_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 4
            
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                        elseif Weapon == "Fans" then
                            local ohString1 = "fans_combat_slash"
                            local ohInstance2 = game:GetService("Players").LocalPlayer
                            local ohInstance3 = character
                            local ohInstance4 = character.HumanoidRootPart
                            local ohInstance5 = character.Humanoid
                            local ohNumber6 = 1
                
                            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                
                            local ohString1 = "fans_combat_slash"
                            local ohInstance2 = game:GetService("Players").LocalPlayer
                            local ohInstance3 = character
                            local ohInstance4 = character.HumanoidRootPart
                            local ohInstance5 = character.Humanoid
                            local ohNumber6 = 2
                
                            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                
                            local ohString1 = "fans_combat_slash"
                            local ohInstance2 = game:GetService("Players").LocalPlayer
                            local ohInstance3 = character
                            local ohInstance4 = character.HumanoidRootPart
                            local ohInstance5 = character.Humanoid
                            local ohNumber6 = 3
                
                            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                
                            local ohString1 = "fans_combat_slash"
                            local ohInstance2 = game:GetService("Players").LocalPlayer
                            local ohInstance3 = character
                            local ohInstance4 = character.HumanoidRootPart
                            local ohInstance5 = character.Humanoid
                            local ohNumber6 = 4
                
                
                            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                        elseif Weapon == "Scythe" then
                            local ohString1 = "Scythe_Combat_Slash"
                            local ohInstance2 = game:GetService("Players").LocalPlayer
                            local ohInstance3 = character
                            local ohInstance4 = character.HumanoidRootPart
                            local ohInstance5 = character.Humanoid
                            local ohNumber6 = 1
                
                            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                
                            local ohString1 = "Scythe_Combat_Slash"
                            local ohInstance2 = game:GetService("Players").LocalPlayer
                            local ohInstance3 = character
                            local ohInstance4 = character.HumanoidRootPart
                            local ohInstance5 = character.Humanoid
                            local ohNumber6 = 2
                
                            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                
                            local ohString1 = "Scythe_Combat_Slash"
                            local ohInstance2 = game:GetService("Players").LocalPlayer
                            local ohInstance3 = character
                            local ohInstance4 = character.HumanoidRootPart
                            local ohInstance5 = character.Humanoid
                            local ohNumber6 = 3
                
                            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                
                            local ohString1 = "Scythe_Combat_Slash"
                            local ohInstance2 = game:GetService("Players").LocalPlayer
                            local ohInstance3 = character
                            local ohInstance4 = character.HumanoidRootPart
                            local ohInstance5 = character.Humanoid
                            local ohNumber6 = 4
                
                
                            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                        end
                    end
                    if Method == "Fast" then
                    if Weapon == "Fist" then
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 1
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 2
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 3
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 4
        
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 1
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 2
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                    
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 3
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 4
        
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 1
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 2
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 3
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "fist_combat"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 4
        
        
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                    elseif Weapon == "Claws" then
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 1
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 2
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 3
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 4
        
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 1
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 2
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                    
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 3
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 4
        
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 1
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 2
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 3
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "claw_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 4
        
        
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                    elseif Weapon == "Sword" then
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 1
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 2
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 3
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 4
        
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 1
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 2
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                    
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 3
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 4
        
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 1
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 2
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 3
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
        
                    local ohString1 = "Sword_Combat_Slash"
                    local ohInstance2 = game:GetService("Players").LocalPlayer
                    local ohInstance3 = character
                    local ohInstance4 = character.HumanoidRootPart
                    local ohInstance5 = character.Humanoid
                    local ohNumber6 = 4
        
        
        
                    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                    elseif Weapon == "Fans" then
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 1
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 2
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 3
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 4
            
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 1
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 2
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                        
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 3
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 4
            
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 1
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 2
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 3
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "fans_combat_slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 4
            
            
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                    elseif Weapon == "Scythe" then
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 1
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 2
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 3
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 4
            
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 1
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 2
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                        
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 3
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 4
            
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 1
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 2
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 3
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
            
                        local ohString1 = "Scythe_Combat_Slash"
                        local ohInstance2 = game:GetService("Players").LocalPlayer
                        local ohInstance3 = character
                        local ohInstance4 = character.HumanoidRootPart
                        local ohInstance5 = character.Humanoid
                        local ohNumber6 = 4
            
            
            
                        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(ohString1, ohInstance2, ohInstance3, ohInstance4, ohInstance5, ohNumber6)
                    end
                    end
            wait(getgenv().KillWait)
            end
        end
        })

        local KillauraOp = Main:CreateToggle({
            Name = "Killaura Op",
            CurrentValue = false,
            Flag = "AutoFarm", 
            SectionParent = Farm,
            Callback = function(v)
                getgenv().killauraOp = v
        end
        })
        
        local Autoloot = Main:CreateToggle({
            Name = "Auto Loot",
            CurrentValue = false,
            Flag = "AutoLoot",
            SectionParent = Farm,
            Callback = function(v)
                getgenv().Loot = v
            end,
        })

        local AutoLoot2 = Main:CreateToggle({
            Name = "Auto Loot (Method 2)",
            CurrentValue = false,
            Flag = "AutoLoot2",
            SectionParent = Farm,
            Callback = function(v)
                getgenv().AutoCollectChest = v
            end,
        })
        
        local Webhook = Main:CreateInput({
            Name = "Webhook For Autoloot",
            Info = "This is not for brain issue.",
            PlaceholderText = "INSERT WEBHOOK URL",
            SectionParent = Farm,
            OnEnter = false,
            RemoveTextAfterFocusLost = false,
            Callback = function(v)
                url = v
            end,
        })
        
        local Godmode = Main:CreateToggle({
            Name = "Godmode (ONLY IF YOU HAVE REGENERATION)",
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



        local AutoSkill = Misc:CreateToggle({
            Name = "Auto Skill",
            CurrentValue = false,
            SectionParent = Miscs,
            Flag = "Skills",
            Callback = function(value)
                using_move = false
                stop_kill_aura = false
                _G.SkillMastery = value
                while _G.SkillMastery and task.wait() do
                    for i,v in next, Skills do
                        if v then
                            using_move = true
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(v, i, false, game)
                        using_move = false
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, i, false, game)
                    end
                end
            end,
        })

        for i,v in next, Skills do
            local AutoUse = Misc:CreateToggle({
                Name = "Auto Use " .. i,
                CurrentValue = false,
                SectionParent = Miscs,
                Flag = "Skills",
                Callback = function(value)
                    Skills[i] = value
                end,
            })
        end

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

        local ServerHop = Misc:CreateButton({
            Name = "Server Hop to Lowest Server",
            SectionParent = Miscs,
            Callback = function()
                local Http = game:GetService("HttpService")
                local TPS = game:GetService("TeleportService")
                local Api = "https://games.roblox.com/v1/games/"

                local _place = game.PlaceId
                local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
                function ListServers(cursor)
                local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
                return Http:JSONDecode(Raw)
                end

                local Server, Next; repeat
                local Servers = ListServers(Next)
                Server = Servers.data[1]
                Next = Servers.nextPageCursor
                until Server

                TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
            end,
        })



        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        




        local AutoBuff = Misc:CreateToggle({
            Name = "Auto All Buff (risky)",
            CurrentValue = false,
            SectionParent = Miscs,
            Flag = "Buff",
            Callback = function(value)
                getgenv().Buff = value           
            end,
        })

        local NoCooldown = Misc:CreateToggle({
            Name = "No Cooldown (RISKY)",
            CurrentValue = false,
            SectionParent = Miscs,
            Flag = "Cooldown",
            Callback = function(value)
                getgenv().NoCdMoves = value           
            end,
        })
        
        local NoDrown = Misc:CreateToggle({
            Name = "No Drown",
            CurrentValue = false,
            SectionParent = Miscs,
            Flag = "Cooldown",
            Callback = function(value)
                getgenv().NoDrown = value           
            end,
        })

        local AutoMeditate = Misc:CreateToggle({
            Name = "Auto Meditate",
            CurrentValue = false,
            SectionParent = Miscs,
            Flag = "Cooldown",
            Callback = function(value)
                getgenv().AutoMed = value           
            end,
        })

        local AutoSplitBoulder = Misc:CreateToggle({
            Name = "No Boulder",
            CurrentValue = false,
            SectionParent = Miscs,
            Flag = "Cooldown",
            Callback = function(value)
                getgenv().AutoSplit = value           
            end,
        })

        local WhiteScreen = Misc:CreateToggle({
            Name = "Activate White Screen (LOW GPU USAGE)",
            CurrentValue = false,
            SectionParent = Miscs,
            Flag = "WhiteScreen",
            Callback = function(value)
                getgenv().WhiteScreen = value
                if getgenv().WhiteScreen then
                    game:GetService("RunService"):Set3dRenderingEnabled(false)
                elseif getgenv().WhiteScreen == false then
                    game:GetService("RunService"):Set3dRenderingEnabled(true)
                end
                
            end,
        })

        local Muzan = Misc:CreateButton({
            Name = "Teleport To Muzan",
            SectionParent = Miscs,
            Callback = function()
                if workspace:FindFirstChild("Muzan") then
                    local Cnice = CFrame.new(workspace:WaitForChild("Muzan"):WaitForChild("SpawnPos").Value)
                    moveto(Cnice, 110)
                end
            end,
        })
        
        local Flowers = Misc:CreateToggle({
            Name = "Auto Pick Flowers",
            CurrentValue = false,
            SectionParent = Miscs,
            Flag = "Flowers",
            Callback = function(Value)
                getgenv().Flowers = Value
                while getgenv().Flowers do
                    task.wait()
                    local flowers = {}
                    
                    for _,v in pairs(game:GetService("Workspace")["Demon_Flowers_Spawn"]:GetDescendants()) do
                        if v:IsA("Model") then
                            table.insert(flowers, v)
                        end
                    end
                    
                    local totalFlowers = #flowers
                    if totalFlowers > 0 then
                        local randomIndex = math.random(1, totalFlowers)
                        local selectedFlower = flowers[randomIndex]
                        
                        if selectedFlower then
                            pcall(function()
                                moveto(selectedFlower:GetModelCFrame(), 120)
                                fireproximityprompt(selectedFlower:FindFirstChild("Cube.002"):FindFirstChild('Pick_Demon_Flower_Thing'))
                            end)
                        end
                    end
                
                    task.wait()
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

        
        local SunDamage = Misc:CreateToggle({
            Name = "No Sun Damage",
            CurrentValue = false,
            Flag = "Sun",
            SectionParent = Miscs,
            Callback = function(v)
                game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = v
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
        
        local InfBreath = Misc:CreateToggle({
            Name = "Inf Breath",
            CurrentValue = false,
            Flag = "Breath",
            SectionParent = Miscs,
            Callback = function(v)
                getgenv().Breath = v
                while getgenv().Breath and task.wait(0.3) do
                    getrenv()._G:Breath(-100)
                end
            end,
        })
        
        
        local Gamepass = Misc:CreateButton({
            Name = "Give Prog Gamepass",
            SectionParent = Miscs,
            Callback = function()
                local gamepass1 = Instance.new("StringValue")
                local gamepass2 = Instance.new("StringValue")
                local gamepass3 = Instance.new("StringValue")
                local gamepass4 = Instance.new("StringValue")
                local gamepass5 = Instance.new("StringValue")
                local gamepass6 = Instance.new("StringValue")
                local gamepass7 = Instance.new("StringValue")
                local gamepass8 = Instance.new("StringValue")
                gamepass1.Name = "18589360"
                gamepass2.Name = "19300397"
                gamepass3.Name = "15101943"
                gamepass4.Name = "17958345"
                gamepass5.Name = "18710993"
                gamepass6.Name = "19241624"
                gamepass7.Name = "19340032"
                gamepass8.Name = "42670615"
                gamepass1.Parent = player.gamepasses
                gamepass2.Parent = player.gamepasses
                gamepass3.Parent = player.gamepasses
                gamepass4.Parent = player.gamepasses
                gamepass5.Parent = player.gamepasses
                gamepass6.Parent = player.gamepasses
                gamepass7.Parent = player.gamepasses
                gamepass8.Parent = player.gamepasses
        
            end,
        })
        
        local WindTrainer = Teleports:CreateToggle({
            Name = "Teleport to Wind Trainer",
            CurrentValue = false,
            Flag = "WindTrainer", 
            SectionParent = Teleport,
            Callback = function(v)
                if v then
                character.HumanoidRootPart.Position = Vector3.new(1792.06519, 334.338989, -3520.479)
                end
            end,
        })

        
        local ThunderTrainer = Teleports:CreateToggle({
            Name = "Teleport to Thunder Trainer",
            CurrentValue = false,
            Flag = "ThunderTrainer", 
            SectionParent = Teleport,
            Callback = function(v)
                if v then
                    character.HumanoidRootPart.Position = Vector3.new(-321.562347, 426.857788, -2383.81519)
                end
            end,
        })
        
        local ButterflyTrainer = Teleports:CreateToggle({
            Name = "Teleport to Butterfly Trainer",
            CurrentValue = false,
            Flag = "ButterflyTrainer", 
            SectionParent = Teleport,
            Callback = function(v)
                if v then
                    character.HumanoidRootPart.Position = Vector3.new(2875.76538, 316.767059, -3917.08398)
                end
            end,
        })
        
        local WaterTrainer = Teleports:CreateToggle({
            Name = "Teleport to Water Trainer",
            CurrentValue = false,
            Flag = "WaterTrainer", 
            SectionParent = Teleport,
            Callback = function(v)
                if v then
                    character.HumanoidRootPart.Position = Vector3.new(711.290039, 260.92688, -2394.80396)
                end
            end,
        })
        local SoundTrainer = Teleports:CreateToggle({
            Name = "Teleport to Sound Trainer",
            CurrentValue = false,
            Flag = "SoundTrainer", 
            SectionParent = Teleport,
            Callback = function(v)
                if v then
                    character.HumanoidRootPart.Position = Vector3.new(1650, 694, -2640)
                end
            end,
        })

        local attackMethods = {
            Fist = "fist_combat",
            Sword = "Sword_Combat_Slash",
            Claws = "claw_Combat_Slash",
            Fans = "fans_combat_slash",
            Scythe = "Scythe_Combat_Slash",
        }



        task.spawn(function()
            while task.wait() do
                pcall(function()
                if killauraOp then
                    attack(attackMethods[Weapon])
                    task.wait(2)
                    end
                end)
            end
        end)

        
        task.spawn(function()
            while task.wait() do
                pcall(function()
                    if game:GetService("Players").LocalPlayer:FindFirstChild("hacktanbgasd12312312") then
                        game:GetService("Players").LocalPlayer:FindFirstChild("hacktanbgasd12312312"):Destroy()
                    end
                end)
            end
        end)
        local playerName = game.Players.LocalPlayer.Name
        local ghostName = playerName .. "'s ghost tang123asd"
        task.spawn(function()
            while task.wait() do
                pcall(function()
                if getgenv().Buff then  
                    if not game:GetService("Workspace").Debree:FindFirstChild(ghostName) then

                        local ohBoolean1 = true

                        game:GetService("ReplicatedStorage").Remotes.war_Drums_remote:FireServer(ohBoolean1)               

                    local ohBoolean1 = true

                    game:GetService("ReplicatedStorage").Remotes.clan_furiosity_add:FireServer(ohBoolean1)
                        game:GetService("ReplicatedStorage").Remotes.immense_reflexes_asd123:FireServer()
                        task.wait(2)
                    end
                    
                    end
                end)
            end
        end)

        task.spawn(function()
                while task.wait() do
                    pcall(function()
                    
                    if getgenv().Loot == true then
                        local lootChests = game:GetService("Workspace").Debree:GetDescendants()
                        for _, chest in ipairs(lootChests) do
                            if chest.Name == "Loot_Chest" and chest:FindFirstChild("Drops") then
                                local remote = chest:WaitForChild("Add_To_Inventory")
                                for _, drop in ipairs(chest.Drops:GetChildren()) do
                                    remote:InvokeServer(drop.Name)
                                    if url then
    
                                        local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
                    
                                        Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
                    
                                        local AvatarImage = Thing.imageUrl
                                        local webhookcheck =
                                        is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
                                        secure_load and "Sentinel" or
                                        KRNL_LOADED and "Krnl" or
                                        SONA_LOADED and "Sona" or
                                        "Not Detected"
                
                                        local data = {
                                        ["embeds"] = {
                                            {
                                                ["title"] = "Skeered Hub: Autoloot",
                                                ["description"] =  "**You just got**",
                                                ["type"] = "rich",
                                                ["color"] = tonumber(0x7269da),
                                                ["fields"] = {
                                                    {
                                                        ["name"] = "Drop:",
                                                        ["value"] = "| "..drop.Name.." |",
                                                        ["inline"] = true
                                                    },
                                                    {
                                                        ["name"] = "Username",
                                                        ["value"] = "||"..player.Name.."||",
                                                        ["inline"] = true
                                                    },
                                                },
                                                ["thumbnail"] = {
                                                    ["url"] = AvatarImage,
                                                }
                                            }
                                        }
                                        }
                                        local newdata = game:GetService("HttpService"):JSONEncode(data)
                    
                                        local headers = {
                                        ["content-type"] = "application/json"
                                        }
                                        request = http_request or request or HttpPost or syn.request
                                        local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                                        request(abcdef)
                                        end
                                    end
                                end
                            
                        end
                    end
                end)
                end
        end)

        spawn(function()
            while task.wait() do
                if getgenv().AutoCollectChest then
                    for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
                        if v.Name == "Loot_Chest" then
                            for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do
                                v["Add_To_Inventory"]:InvokeServer(c.Name)
                                if url then
    
                                    local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
                
                                    Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
                
                                    local AvatarImage = Thing.imageUrl
                                    local webhookcheck =
                                    is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
                                    secure_load and "Sentinel" or
                                    KRNL_LOADED and "Krnl" or
                                    SONA_LOADED and "Sona" or
                                    "Not Detected"
            
                                    local data = {
                                    ["embeds"] = {
                                        {
                                            ["title"] = "Skeered Hub: Autoloot",
                                            ["description"] =  "**You just got**",
                                            ["type"] = "rich",
                                            ["color"] = tonumber(0x7269da),
                                            ["fields"] = {
                                                {
                                                    ["name"] = "Drop:",
                                                    ["value"] = "| "..drop.Name.." |",
                                                    ["inline"] = true
                                                },
                                                {
                                                    ["name"] = "Username",
                                                    ["value"] = "||"..player.Name.."||",
                                                    ["inline"] = true
                                                },
                                            },
                                            ["thumbnail"] = {
                                                ["url"] = AvatarImage,
                                            }
                                        }
                                    }
                                    }
                                    local newdata = game:GetService("HttpService"):JSONEncode(data)
                
                                    local headers = {
                                    ["content-type"] = "application/json"
                                    }
                                    request = http_request or request or HttpPost or syn.request
                                    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                                    request(abcdef)
                                    end
                                delay(0.5, function()
                                    c:Destroy()
                                end)
                            end
                        end
                    end
                end
            end
        end)

        --No Cooldown Moves

        spawn(function()
            while task.wait() do
                if getgenv().autofarmmobs then
                local Humanoid = character.Humanoid
                local hrp = character:WaitForChild("HumanoidRootPart")
                    if getgenv().autofarmmobs == false then return end
        
                    local mob = findMob()
                    if mobs == nil then
                        while task.wait() do
                            task.wait()
                            if getgenv().autofarmmobs == false then return end
                            if findMob() ~= nil then break end
                        end
                    else
                        while wait() do
                            task.wait()
        
                            if getgenv().autofarmmobs == false then return end

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
                                            moveto(mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0), 300)
                                        else
                                            hrp.CFrame = mob:GetModelCFrame() * CFrame.new(0, tonumber(dist), 0) * CFrame.Angles(math.rad(-90), 0, 0)
                                        end
                                    until not autofarmmobs or mob:FindFirstChild("Humanoid").Health <= 0
                                elseif mode == "Below" then
                                    repeat
                                        task.wait()
                                        local character = player.Character
                                        local hrp = character:WaitForChild("HumanoidRootPart")
                                        local magnitude = (character.HumanoidRootPart.Position - mob:GetModelCFrame().Position).magnitude
                                        if magnitude > 20 then
                                            moveto(v:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0), 300)
                                        else
                                            hrp.CFrame = v:GetModelCFrame() * CFrame.new(0, -tonumber(dist), 0) * CFrame.Angles(math.rad(90), 0, 0)
                                        end
                                    until not autofarmmobs or mob:FindFirstChild("Humanoid").Health <= 0
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
        end)

        spawn(function()
            while task.wait() do
                if getgenv().killaura or getgenv().killauraOp then
                    for i,v in pairs(player.Character:GetChildren()) do
                        if v:IsA("Tool") then
                            v.Parent = player.Backpack
                        end
                    end
                end
            end
        end)

        spawn(function()
            while task.wait() do
                if getgenv().AutoMed then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis["Meditate_gui"].Holder.LocalScript.Value.Value = 100
                    end)
                end
            end
        end)
        
        spawn(function()
            while task.wait() do
                if getgenv().AutoSplit then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.ExcessGuis["boulder_split_ui"].Holder.LocalScript.Value.Value = 10000
                    end)
                end
            end
        end)

        task.spawn(function()
            for i,v in next, getgc(true) do
                if type(v) == "table" and rawget(v, "swim_bar") then
                    while task.wait() do
                        if getgenv().NoDrown then
                            rawset(v, "swim_bar", {
                                [1] = 2,
                                [2] = 2
                            })
                        end
                    end
                end
            end
        end)

        player.CharacterAdded:Connect(function(char)
            character = char
        end)
