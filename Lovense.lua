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

HttpService = game:GetService("HttpService")
Lovense.debugmode = false;
Lovense.Host = "";

function Lovense.GetToys()
	local Req = HttpService:GetAsync(Lovense.Host .. "/GetToys")
	local Response = HttpService:JSONDecode(Req);
	
	--Lovense.Host = Response.domain .. Response.httpsPort;
	
	wait(3)

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
	local Req = HttpService:GetAsync(Lovense.Host .. "/Battery");
	local Response = HttpService:JSONDecode(Req);
	print("Battery Output: " .. Response.battery);
end

function Lovense.Vibrate(speed, length)
	local Req = HttpService:GetAsync(Lovense.Host .. "/AVibrate?v=" .. speed .. "&sec=" .. length);
	local Response = HttpService:JSONDecode(Req);

	print("[Lovense] Started vibrating at speed " .. speed .. " for " .. length .. " seconds.");

	if Lovense.debugmode == true then
		print(Response.data);
	else
		--
	end
end

function Lovense.Rotate()
	local Req = HttpService:GetAsync(Lovense.Host .. "/ARotate?v=" .. speed .. "&sec=" .. length);
	local Response = HttpService:JSONDecode(Req);

	print("[Lovense] Started rotating at speed " .. speed .. " for " .. length .. " seconds.");

	if Lovense.debugmode == true then
		print(Response.data)
	else
		--
	end
end

return Lovense
