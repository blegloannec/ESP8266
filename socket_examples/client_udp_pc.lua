local socket = require("socket")

local udp = assert(socket.udp())
assert(udp:sendto("coucou", "192.168.1.14", 80))
--io.write(assert(udp:receive()))
