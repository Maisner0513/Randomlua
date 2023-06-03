local packet = {}
packet.type = 18
packet.netid = GetLocal().netid
packet.flags = 8
packet.int_x = 2
for i = 1, 500 do
   for i = 0, 800 do
      SendPacketRaw(packet)
      if packet.int_x == 2 then
         packet.int_x = 0
      elseif packet.int_x == 0 then
         packet.int_x = 2
      end
   end
   sleep(90)
end