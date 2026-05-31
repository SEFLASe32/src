

shared.Setting = {
	["Plot"] = nil,
	["AutoCollect"] = true,
	["GasPrice"] = {
		["Activate"] = false,
		["AbovePrice"] = 10,
}
}
for i,v in pairs(workspace.Plots:GetChildren()) do
    if tostring(v.Configuration.Player.Value) == game.Players.LocalPlayer.Name then
	    shared.Setting["Plot"] = v.Name
        break
    end
end
function Fire(P)
    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,P,0)
    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,P,1)
    return
end

task.spawn(function()
   while wait(0.9) do
        if shared.Setting["AutoCollect"] then
	        for i,v in pairs(workspace.Plots[shared.Setting["Plot"]].Buildings:GetDescendants()) do 
                if v:IsA("TouchTransmitter") then
                    Fire(v.Parent)
                end
            end
        end
    end
end)
task.spawn(function()
   while wait() do
             if game:GetService("ReplicatedStorage").GasPrice.Value >= shared.Setting["GasPrice"]["AbovePrice"] and shared.Setting["GasPrice"]["Activate"] then
		        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BaseService"):WaitForChild("RE"):WaitForChild("SellGas"):FireServer()
	     end
	end
end)
