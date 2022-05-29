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

Lovense.debugmode = false; -- false by default
Lovense.host = "";

function Lovense.GetToys()
    local Response = syn.request({
        Url = "https://api.lovense.com/api/lan/getToys",
        Method = "GET"
    })

    print("[Lovense] Toys received");

    if Lovense.debugmode == true then
        print(Response.Body)
    else
        -- Lyssa was here
    end

    Port = Response.httpPort
    Domain = Response.domain
    Toys = Response.toys
end

function Lovense.Vibrate(speed, length)
    local Response = syn.request({
        Url = Lovense.host .. "/AVibrate?v=" .. speed .. "&sec=" .. length,
        Method = "GET"
    })

    print("[Lovense] Started vibrating for " .. length .. " seconds.");

    if Lovense.debugmode == true then
        print(Response.Body)
    else
        -- Lyssa was here
    end
end

return Lovense
