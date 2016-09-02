local socket = require("socket")

-- create a TCP socket and bind it
local server = assert(socket.bind("*", 4321))

local ip, port = server:getsockname()
print("Server up at " .. ip .. ":" .. port)

-- loop forever waiting for clients
while 1 do
  -- wait for a connection from any client
   local client = server:accept()
   print("New client!")
  -- make sure we don't block waiting for this client's line
  -- client:settimeout(10)
  -- receive the line
  while 1 do
     local line, err = client:receive()
     -- if there was no error, answer to the client
     if not err then
	local n = tonumber(line)
	if n ~= 0 then client:send(n^2 .. "\n")
	else
	   -- done with client, close the object
	   client:close()
	   print("Done with that client.")
	   break
	end
     end
  end
end
