if (not game.IsLoaded(game)) then
    local Loaded = game.Loaded
    Loaded.Wait(Loaded);
end
local succ,err = pcall(function()
    kometaLoader = loadstring(game:HttpGet("https://s.kometa.ga/kometa.lua"))();
    NotificationLibLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
end);
if err then
    error("Failed to load a dependecy.", err);
end;
NotificationLibLoader.new("success", "Success", "Successfully rejoined and ran dependencies.") 
wait(1)
NotificationLibLoader.new("warning", "Warning1", "Rejoined after kick.")
wait(1)
NotificationLibLoader.new("warning", "Warning2", "Kick reason:")
_ = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Child)
    if Child.Name == 'ErrorPrompt' and Child:FindFirstChild('MessageArea') and Child.MessageArea:FindFirstChild("ErrorFrame") then
        wait(1);
      --  setclipboard(Child:FindFirstChild('MessageArea').Text)
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer);
        if not game:IsLoaded() then
            game.Loaded:Wait();
        end;
        local start = os.clock();
        local kometaLoader;
        local NotificationLibLoader;
        local queue_on_teleport = syn and syn.queue_on_teleport or queue_on_teleport;
        queue_on_teleport("loadstring(game.HttpGet(game, \"https://github.com/AggelosLua/autotp/raw/main/main.lua\"))()");
    end
end)
