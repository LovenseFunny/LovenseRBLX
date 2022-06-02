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
Lovense.AutoObtainHost = true;
Lovense.Host = "";

function squeeze(d,p)
    return d .. ":" .. p;
end

function Lovense.GetHost()
	local Req = game:HttpGet("https://api.lovense.com/api/lan/getToys")
	local Response = HttpService:JSONDecode(Req);

	local domain = Response.domain;
	local port = Response.httpsPort;

    if domain == nil then
        return "Error"
    end

	if Lovense.debugmode == true then
		print("[Lovense] Device ID: " .. Response.deviceId);
		print("[Lovense] Platform: " .. Response.platform);
		print("[Lovense] Domain: " .. Response.domain);
		print("[Lovense] Port: " .. Response.httpsPort);
	end

	return squeeze(domain,port)
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
		print(Response.Body)
	else
		--
	end
	return Response.Body
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
		print(Response.Body);
	else
		--
	end
end

function Lovense.Rotate(speed, length)
	local Req = game:HttpGet(Lovense.Host .. "/ARotate?v=" .. speed .. "&sec=" .. length);
	local Response = HttpService:JSONDecode(Req);

	print("[Lovense] Started rotating at speed " .. speed .. " for " .. length .. " seconds.");

	if Lovense.debugmode == true then
		print(Response.Body)
	else
		--
	end
end

return Lovense
