client = net.createConnection(net.TCP,0)

client:connect(4321,"192.168.1.12")

function on_recv(sock,data)
   print("Received: " .. data)
end

client:on("receive",on_recv)
 
for i=2,6 do
   client:send(i .. "\n")
   print("Sent: " .. i)
end
client:send("0\n")
client:close()
