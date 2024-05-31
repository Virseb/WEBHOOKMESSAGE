local webhk = {}
local function hook(url,msg)
local webhookUrl = tostring(url)

local HttpService = game:GetService("HttpService")
local messageData = {
    content = tostring(msg)
}

local jsonData = HttpService:JSONEncode(messageData)

local requestFunction = (syn and syn.request) or http_request or request
local success, err = pcall(function()
    requestFunction({
        Url = webhookUrl,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = jsonData
    })
end)

if success then
    
else
    warn("Failed wtf: " .. tostring(err))
end
end

return webhk
