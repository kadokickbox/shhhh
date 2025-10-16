local GameID = game.GameId
local Exploit = identifyexecutor()

local Player = game:GetService("Players").LocalPlayer
local LogService = game:GetService("LogService")
local ScriptContext = game:GetService("ScriptContext")

-- // If you're buying yuna then you should prob buy a paid exploit, not just buy only yuna
local Shitsploits = { "Solara", "Xeno" }

local GameIDs = {
    ["3150475059"] = "https://api.luarmor.net/files/v3/loaders/295c9f0edac4d95d36fb9defe521ca87.lua", -- FF2
    ["115797356"] = "https://api.luarmor.net/files/v3/loaders/b3f78af212d54a1d008b143aac4a86be.lua",
    ["3032132418"] = "https://api.luarmor.net/files/v3/loaders/b1cd6d05e9596d7b36b423139f5433e3.lua", -- HCBB
    ["5750914919"] = "https://api.luarmor.net/files/v3/loaders/38b884e4a785b41d18f3313ccd0afd1f.lua", -- Fisch
    ["184199275"] = "https://api.luarmor.net/files/v3/loaders/a553b5c3e7ff1378e91c7f7af656fb98.lua", -- UF
    ["4931927012"] = "https://api.luarmor.net/files/v3/loaders/31e7ebc8a688fbb6ce54e279fbe11685.lua", -- BL
    ["6035872082"] = "https://api.luarmor.net/files/v3/loaders/5f9c4cf29d60aae7a0f464d3939cd753.lua", -- Rivals
    ["4730278139"] = "https://api.luarmor.net/files/v3/loaders/ffc073d797e7bb0b9329ae48caed965b.lua", -- UBG
    ["6517184723"] = "https://api.luarmor.net/files/v3/loaders/8cdda091c86a0da8725caafc7e23dc43.lua", -- Basetball Universe
    ["6505338302"] = "https://api.luarmor.net/files/v3/loaders/2e2166a30d9c0b286e9b6e404e377302.lua", -- // Football Legends
    ["6931042565"] = "https://api.luarmor.net/files/v3/loaders/e3fe4d5e8022392eb2b6c8dbfa40f390.lua", -- // Volleyball Legends
}

local SolaraIDs = {
    ["3150475059"] = "https://api.luarmor.net/files/v3/loaders/9292f827569f2535f2c40a0ba7c42deb.lua", -- FF2
    ["4931927012"] = "https://api.luarmor.net/files/v3/loaders/31e7ebc8a688fbb6ce54e279fbe11685.lua", -- BL
}

local function Execute(IDs)
    return loadstring(game:HttpGet(IDs[tostring(GameID)]))()
end

-- // Key detection (more detailed kick message because LRM's is not that great)
if not script_key and not getgenv().script_key then
    return Player:Kick("Yuna | Please make sure you include the script_key part ABOVE the loadstring, otherwise Luarmor will not be able to recognize that you bought.")
end

-- // LogService/ScriptContext error detection bypass
if GameID == 3150475059 and not table.find(Shitsploits, Exploit) then
    if hookfunction then
        local Old; Old = hookfunction(LogService.GetLogHistory, function(...)
            local Results = Old(...);

            -- // Remove any potential errors that the game could detect, by default the console has 3 errors in it already
            if #Results > 3 then
                for i = 4, #Results do
                    if type(Results[i]) == "table" and Results[i].messageType == Enum.MessageType.MessageError then
                        table.remove(Results, i);
                    end
                end
            end

            return Results
        end)
    end

    if getconnections then
        for i,v in next, getconnections(ScriptContext.Error) do
            if v.Function then
                v:Disable()
            end
        end
    end
end


if table.find(Shitsploits, Exploit) then

    return Player:Kick(`Yuna | {Exploit} is not supported by Yuna.`)


    --Execute(SolaraIDs)
elseif Exploit == "Fluxus" then
    Player:Kick("Yuna | For mobile please use Krnl.")
elseif GameIDs[tostring(GameID)] then
    if tostring(GameID) == "3032132418" then
        for x, y in getconnections(game:GetService("LogService").MessageOut) do
        	if y.Function == nil or typeof(getfenv(y.Function).script) == 'table' then
        		continue
        	end
        	y:Disable()
        end
    end
    Execute(GameIDs)
end
