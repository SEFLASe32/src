--[[
    Remember Cheat Use At Owner Risk!!!
]]
shared.control = {
    AwayRodPerfect = true,
    AutoPool = true,
    GodMode = true
}
local equiq 
local namefish
namefish = hookmetamethod(game,"__namecall",function(self,...)
	local args = {...}
	local methods = getnamecallmethod():lower()
	if not checkcaller() and methods == "fireserver" and self.Name == "cast" and shared.control.AwayRodPerfect then -- Your lure value is 100 to 100, the text will not show perfect.
        print(self)
        args[1] = 100 -- If you want safety,you need to use math.random(94.3,99.132) or randon [[ 1-100 ]] Ex args[1] = math.random(94.3,99.132);
        args[2] = 1
		return namefish(self,unpack(args))
    elseif not checkcaller() and methods == "fireserver" and self.Name == "drown" and shared.control.GodMode  then -- nerver drown forever skull
        args[1] = 100 -- If you want safety,you need to use math.random(97,99.131) or randon [[ 50-100 ]]
        return namefish(self,unpack(args))
    end
	return namefish(self,...)
end)

task.spawn(function()
    while  wait() do
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")["values"].lure.Value == 100 and shared.control.AutoPool then -- If the lure value reaches 100,then fireserver
            local args = {
                [1] = 100, -- 100 equal finished remote jmp
                [2] = false
            }
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("reelfinished"):FireServer(unpack(args))
        end
    end
end)
