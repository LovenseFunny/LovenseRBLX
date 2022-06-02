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

Lovense.debugmode = false;
Lovense.AutoObtainHost = true;
Lovense.Host = "";

function Lovense.GetHost()
	local Req = game:HttpGet("https://api.lovense.com/api/lan/getToys")
	local Response = HttpService:JSONDecode(Req);

	local domain = Response.domain;
	local port = Response.httpsPort;

	if Lovense.debugmode == true then
        print("[Lovense] Response: " .. Response.Body)
		print("[Lovense] Device ID: " .. Response.deviceId);
		print("[Lovense] Platform: " .. Response.platform);
		print("[Lovense] Domain: " .. Response.domain);
		print("[Lovense] Port: " .. Response.httpsPort);
	end

    if domain == nil then
        return "Error"
    else
        return domain .. ":" .. port
    end
end

if Lovense.AutoObtainHost == true then
	Lovense.Host = Lovense.GetHost();
else
    return "Error"
end

function Lovense.GetToyInfo()
	local Req = game:HttpGet(Lovense.Host .. "/GetToys")
	local Response = HttpService:JSONDecode(Req);
	if Lovense.debugmode == true then
		print(Response.data)
	else
		--
	end
	return Response.data
end

function Lovense.Domain()
	print(Lovense.Host);
end
function Lovense.GetBattery()
	local Req = game:HttpGet(Lovense.Host .. "/Battery");
	local Response = HttpService:JSONDecode(Req);
	print("Battery Output: " .. Response.battery);
	return Response.battery
end

function Lovense.Vibrate(speed, length)
	local Req = game:HttpGet(Lovense.Host .. "/AVibrate?v=" .. speed .. "&sec=" .. length);
	local Response = HttpService:JSONDecode(Req);

	print("[Lovense] Started vibrating at speed " .. speed .. " for " .. length .. " seconds.");

	if Lovense.debugmode == true then
		print(Response.data);
	else
		--
	end
end

function Lovense.Rotate(speed, length)
	local Req = game:HttpGet(Lovense.Host .. "/ARotate?v=" .. speed .. "&sec=" .. length);
	local Response = HttpService:JSONDecode(Req);

	print("[Lovense] Started rotating at speed " .. speed .. " for " .. length .. " seconds.");

	if Lovense.debugmode == true then
		print(Response.data)
	else
		--
	end
end

return Lovense
