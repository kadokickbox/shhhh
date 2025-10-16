if not _G.Ran then 
    local PBann = game.ReplicatedStorage.RES.PBann
    for x,y in getconnections(game:GetService("LogService").MessageOut) do
	if typeof(getfenv(y.Function).script) == 'table' then
		continue
	end
    	y:Disable()
    end
    _G.Ran = true
    getfenv().getgenv = nil
	local Old
	Old = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
		if getnamecallmethod() == "FireServer" and ({...})[1] == "Incorrect context deep" then
			return
		end
	
		if getnamecallmethod() == "FireServer" and (Self.Name:find("R\204\180\204\136\204\177B\204\180\205\140\204\177KH\204\183\204\138\204\173\204\174") or Self == PBann) then
			local args = {...}

			local info = getinfo(3)
            
			if (info.currentline == 13523 or info.currentline == 19) then
				return Old(Self, ...)
			end
			return
		end
	
		return Old(Self, ...)
	end))
warn("Hooked")
end
