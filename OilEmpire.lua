--[[
    Cheat Use At Own Risk!!
    AutoCollecy --> Solar Panel'll Collect too
    CollectMethod --> [W] mean Walk  [I] mean Instant 
    W Method it for Public Server it look like a marco sometime it gonna stuck wall -->{ }
    I Method it for Private Server it instant collecting but i reccomend to get closer Solar Panel and Gas Tank btw
]] 

shared.Setting = {
	["Plot"] = nil, 
	["AutoCollect"] = true,
    ["CollectMethod"] = "W",
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
    wait(0.2)
    return true
end
--[[
    local PathfindingService = game:GetService("PathfindingService")

local function walkTo(destination)
    local path = PathfindingService:CreatePath({
        AgentHeight = 5,
        AgentRadius = 2,
        AgentCanJump = true
    })
    path:ComputeAsync(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, destination.Position)
    if path.Status == Enum.PathStatus.Success then
        for _, waypoint in pairs(path:GetWaypoints()) do
            game.Players.LocalPlayer.Character.Humanoid:MoveTo(waypoint.Position)
            game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
        end
    else
        game.Players.LocalPlayer.Character.Humanoid:MoveTo(destination.Position)
    end
end
]]
function Walk(P)
    repeat wait()
        game.Players.LocalPlayer.Character.Humanoid:MoveTo(P.Position);
    until (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 or not shared.Setting["AutoCollect"]
    wait(0.7)
    return true
end
task.spawn(function()
   while true do wait(0.9)
        if shared.Setting["AutoCollect"] then
	        for i,v in pairs(workspace.Plots[shared.Setting["Plot"]].Buildings:GetDescendants()) do 
                if v:IsA("TouchTransmitter") then
                    if shared.Setting["CollectMethod"] == "W" then
                        Walk(v.Parent)
                    else 
                        Fire(v.Parent)
                    end
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
