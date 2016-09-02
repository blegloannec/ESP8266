local socket = require("socket")

local client = assert(socket.connect("*", 4321))
local ip, port = client:getsockname()
print("Connected (using " .. ip .. ":" .. port .. ").")

for i=2,6 do
   client:send(i .. "\n")
   print("Sent: " .. i)
   local line, err = client:receive()
   if not err then print("Received:" .. line) end
end
client:send("0\n")
