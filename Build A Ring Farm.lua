--[[ all rarity 
    Common Uncommon Rare Epic Legendary Secret Prisamatic Divine Exotic Transcended
    Ex . ["Rarity"] = {"Transcended","Exotic"}

]]
shared.Setting = {
    ["Auto Roll"] = {
        ["Acttivate"] = true,
        ["Rarity"] = {"Transcended"},
    },
    ["Auto Buy Gear"] = true, -- Buy Every Thing am rich
}
spawn(function()
    while task.wait(0.9) do
        if shared.Setting["Auto Roll"]["Acttivate"] then
             for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if string.find(v.Name,"SeedGui") then
                    table.foreach(shared.Setting["Auto Roll"]["Rarity"],function(i2,v2)
                        if v.Frame.InfoFrame.Rarity.Text == v2 then 
                            fireproximityprompt(v.Parent.BuySeed)
                            warn(v.Frame.NameLabel.Text,v.Frame.InfoFrame.Rarity.Text,v.Frame.InfoFrame.Cost.Text)
                        end
                    end)
                end
            end
            wait(0.5)
            game:GetService("ReplicatedStorage").Remotes.RollSeeds:FireServer()
            wait(0.8)
        end
    end      
end)

spawn(function()
    while task.wait() do  
        if shared.Setting["Auto Buy Gear"] then
            for i,v in pairs(game:GetService("ReplicatedStorage").GearStocks[game.Players.LocalPlayer.Name]:GetChildren()) do   
                if not string.find(v.Name,"Next") then
                    for i2=1,v.Value,1 do
                        game:GetService("ReplicatedStorage").Remotes.Gear.Transaction:InvokeServer(v.Name)
                    end   
                end
            end
            wait(math.random(15,60))
        end
    end
end)
