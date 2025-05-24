
shared.Config = {
	["AutoVote"] = true,
	["AutoPlay"] = true,
	["AutoRetry"] = true,
	["AutoUpgrade"] = true
}
--[[
  use at own risk Anime Ranger X Update 1 
]]
task.spawn(function()
	while true do wait()
		if shared.Config["AutoVote"] then
			if game:GetService("Players").LocalPlayer.PlayerGui.HUD.InGame.VotePlaying.Visible == true then
			    repeat wait()
			       game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VotePlaying"):FireServer() 
			    until game:GetService("Players").LocalPlayer.PlayerGui.HUD.InGame.VotePlaying.Visible == false or not shared.Config["AutoVote"]
			end
		end
		if shared.Config["AutoPlay"] then
			if game:GetService("Players").LocalPlayer.PlayerGui.HUD.Enabled == true then
				if game:GetService("Players").LocalPlayer.PlayerGui.HUD.InGame.Main.AutoPlay.Back["true"].Enabled == false then
					repeat wait()
						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("AutoPlay"):FireServer()
						wait(0.75)
					until game:GetService("Players").LocalPlayer.PlayerGui.HUD.InGame.Main.AutoPlay.Back["true"].Enabled == true
				end
			end
		end
		if shared.Config["AutoRetry"] then
			if game:GetService("Players").LocalPlayer.PlayerGui.HUD.Enabled == false then
			    repeat wait()
			        if game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == false and game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == false then
    			        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0, 0, true, game, 1)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0, 0, false, game, 1)
                    end
			    until game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == true
				if game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == true then
					repeat wait()
									game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VoteRetry"):FireServer()
					until game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == false
				end 
			end
		end
	end
end)
task.spawn(function()
    while true do wait()
        if shared.Config["AutoUpgrade"] then
		    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUD.InGame.UnitsManager.Main.Main.ScrollingFrame:GetChildren()) do
		            
		        if not string.find(v.Name,"Padding") and not string.find(v.Name,"ListLayout") then
		            local args = {
                    [1] = game:GetService("Players").LocalPlayer:WaitForChild(v.Name)
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("Upgrade"):FireServer(unpack(args))
		        end
		    end
		end
    end
end)
