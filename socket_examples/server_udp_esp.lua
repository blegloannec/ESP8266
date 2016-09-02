led = 4
led_on = false
gpio.mode(led,gpio.OUTPUT)
gpio.write(led,gpio.HIGH)

function switch_led()
   if led_on then gpio.write(led,gpio.HIGH)
   else gpio.write(led,gpio.LOW) end
   led_on = not led_on
end

function srv_action(sck,msg)
   print("Received: " .. msg)
   switch_led()
end

server = net.createServer(net.UDP,30)
server:listen(80)
server:on("receive",srv_action)
--server:close()
