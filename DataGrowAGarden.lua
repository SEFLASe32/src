local Data = {
    ["Gear"] = {},
    ["Seed"] = {}
}
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Gear_Shop.Frame.ScrollingFrame:GetChildren()) do
    if v:FindFirstChild("Main_Frame") then
        if v["Main_Frame"]["Cost_Text"].Text ~= "NO STOCK" then
            Data["Gear"][v.Name] = {}
            Data["Gear"][v.Name]["Price"] = string.gsub(v["Main_Frame"]["Cost_Text"].Text,"¢","")
            Data["Gear"][v.Name]["Stock"] = string.match(v["Main_Frame"]["Stock_Text"].Text,"%d+")
            print("Type : Gear" .. "Name :".. v.Name .." Price :" .. v["Main_Frame"]["Cost_Text"].Text .. " Stock : " .. string.match(v["Main_Frame"]["Stock_Text"].Text,"%d+"))
        end
    end
end
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Seed_Shop.Frame.ScrollingFrame:GetChildren()) do
    if v:FindFirstChild("Main_Frame") then
        if v["Main_Frame"]["Cost_Text"].Text ~= "NO STOCK" then
            Data["Seed"][v.Name] = {}
            Data["Seed"][v.Name]["Price"] = string.gsub(v["Main_Frame"]["Cost_Text"].Text,"¢","")
            Data["Seed"][v.Name]["Stock"] = string.match(v["Main_Frame"]["Stock_Text"].Text,"%d+")
            print("Type : Seed" .. "Name :".. v.Name .." Price :" .. v["Main_Frame"]["Cost_Text"].Text .. " Stock : " .. string.match(v["Main_Frame"]["Stock_Text"].Text,"%d+"))
        end
    end
end
