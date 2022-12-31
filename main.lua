if (not game.IsLoaded(game)) then
    local Loaded = game.Loaded
    Loaded.Wait(Loaded);
end
local reason
local succ,err = pcall(function()
    kometaLoader = loadstring(game:HttpGet("https://s.kometa.ga/kometa.lua"))();
    NotificationLibLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
end);
if err then
    error(err);
end;
if not isfolder("AutoTPBss") then 
    makefolder("AutoTPBss")
end
if isfile('AutoTPBss/Data.json') == true then
    reason = game:GetService("HttpService"):JSONDecode(readfile("AutoTPBss/Data.json"))
end
NotificationLibLoader.new("success", "Success", "Successfully rejoined and ran dependencies.") 
wait(1)
NotificationLibLoader.new("warning", "Warning1", "Rejoined after kick.")
wait(1)
NotificationLibLoader.new("warning", "Warning2", "Kick reason: "..reason["Reason"])
_ = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Child)
    if Child.Name == 'ErrorPrompt' and Child:FindFirstChild('MessageArea') and Child.MessageArea:FindFirstChild("ErrorFrame") and Child.MessageArea.ErrorFrame:FindFirstChild("ErrorMessage") then
        wait(1);
        reason = Child.MessageArea.ErrorFrame:FindFirstChild("ErrorMessage").Text;
        if (reason:match("267")) then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Game Script Based Kick"
            }))
        elseif reason:match("266") then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Internet Connection Issue / AFK"
            }))
        elseif reason:match("268") then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Unexpected Client Behaviour"
            }))
        elseif reason:match("271") then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Client Joined While Server Shutdown"
            }))
        elseif reason:match("275") then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Maintenance / Game Banned"
            }))
        elseif reason:match("277") then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Internet Connection Issue / Ping Issue"
            }))
        elseif reason:match("278") then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Idle For More Than 20 Mins"
            }))
        elseif reason:match("517") then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Server Was Already Closing"
            }))
        elseif reason:match("523") then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Server Has Shutdown"
            }))
        elseif reason:match("529") then
            writefile("AutoTPBss/Data.json", game:GetService("HttpService"):JSONEncode({
                ["Reason"] = "Roblox Backend Issue"
            }))
        end
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer);
        local queue_on_teleport = syn and syn.queue_on_teleport or queue_on_teleport;
        queue_on_teleport("loadstring(game.HttpGet(game, \"https://github.com/AggelosLua/autotp/raw/main/main.lua\"))()");
end
end)
