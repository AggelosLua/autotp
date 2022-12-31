_ = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Child)
    if Child.Name == 'ErrorPrompt' and Child:FindFirstChild('MessageArea') and Child.MessageArea:FindFirstChild("ErrorFrame") then
        wait(1);
        setclipboard(Child:FindFirstChild('MessageArea').Text)
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer);
        if not game:IsLoaded() then
            game.Loaded:Wait();
        end;
        local start = os.clock();
        local kometaLoader;
        local NotificationLibLoader;
        local queue_on_teleport = syn and syn.queue_on_teleport or queue_on_teleport;
        local succ,err = pcall(function()
            kometaLoader = loadstring(game:HttpGet('https://s.kometa.ga/kometa.lua'))();
            NotificationLibLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
        end);
        if err then
            error("Failed to load a dependecy.");
        end;
        NotificationLibLoader.new("success", "Success", "Successfully rejoined and ran dependencies.") 
        wait(1)
        NotificationLibLoader.new("warning", "Warnings", "Rejoined after kick.")
    end
end)
