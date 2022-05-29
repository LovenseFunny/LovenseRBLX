--[[
                                       
,--.                                                
|  |    ,---.,--.  ,--.,---. ,--,--,  ,---.  ,---.  
|  |   | .-. |\  `'  /| .-. :|      \(  .-' | .-. : 
|  '--.' '-' ' \    / \   --.|  ||  |.-'  `)\   --. 
`-----' `---'   `--'   `----'`--''--'`----'  `----' 
                                                    
        Control your Lovense toy with Roblox
           Created by Lyssa#1337 (@170q)

]]

local Lovense = {}

local HttpService = game:GetService("HttpService")
Lovense.debugmode = false;
Lovense.host = "";

function Lovense.GetToys()
    local Req = HttpService:GetAsync(Lovense.host .. "/GetToys")
    local Response = HttpService:JSONDecode(Req);
    --Lovense.host = Response.domain .. Response.httpsPort;
    print("Toy(s): " .. Response.toys);
    if Lovense.debugmode == true then
        print(Response.Body)
    else
        --
    end
end



function Lovense.Domain()
    print(Lovense.host);
end

function Lovense.GetBattery()
    local Req = HttpService:GetAsync(Lovense.host .. "/Battery");
    local Response = HttpService:JSONDecode(Req);
    print("Battery Output: " .. Response.battery);
end

function Lovense.Vibrate(speed, length)
    local Req = HttpService:GetAsync(Lovense.host .. "/AVibrate?v=" .. speed .. "&sec=" .. length);
    local Response = HttpService:JSONDecode(Req);

    print("[Lovense] Started vibrating at speed " .. speed .. " for " .. length .. " seconds.");

    if Lovense.debugmode == true then
        print(Response.Body);
    else
        --
    end
end

function Lovense.Rotate()
    local Req = HttpService:GetAsync(Lovense.host .. "/ARotate?v=" .. speed .. "&sec=" .. length);
    local Response = HttpService:JSONDecode(Req);

    print("[Lovense] Started rotating at speed " .. speed .. " for " .. length .. " seconds.");

    if Lovense.debugmode == true then
        print(Response.Body)
    else
        --
    end
end

return Lovense
