--[[
                                       
,--.                                                
|  |    ,---.,--.  ,--.,---. ,--,--,  ,---.  ,---.  
|  |   | .-. |\  `'  /| .-. :|      \(  .-' | .-. : 
|  '--.' '-' ' \    / \   --.|  ||  |.-'  `)\   --. 
`-----' `---'   `--'   `----'`--''--'`----'  `----' 
                                                    
        Control your Lovense toy with Roblox

]]

local Lovense = {}

local HttpService = game:GetService("HttpService")
Lovense.debugmode = false;
Lovense.host = "";

function Lovense.GetToys()
    local Response = syn.request({
        Url = "http://api.lovense.com/api/lan/getToys",
        Method = "GET"
    })
    Lovense.host = Response.domain .. Response.httpsPort;
    print("Toy(s): " .. Response.toys);
    print("Host: " .. Lovense.host);
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
    local Response = syn.request({
        Url = Lovense.host .. "/Battery",
        Method = "GET"
    })
    print("Battery Output: " .. Response.battery);
end

function Lovense.Vibrate(speed, length)
    local Response = syn.request({
        Url = Lovense.host .. "/AVibrate?v=" .. speed .. "&sec=" .. length,
        Method = "GET"
    })
    
    print("[Lovense] Started vibrating at speed " .. speed .. " for " .. length .. " seconds.");

    if Lovense.debugmode == true then
        print(Response.Body);
    else
        --
    end
end

function Lovense.Rotate(speed, length)
    local Response = syn.request({
        Url = Lovense.host .. "/ARotate?v=" .. speed .. "&sec=" .. length,
        Method = "GET"
    })

    print("[Lovense] Started rotating at speed " .. speed .. " for " .. length .. " seconds.");

    if Lovense.debugmode == true then
        print(Response.Body)
    else
        --
    end
end

return Lovense
