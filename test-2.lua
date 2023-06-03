removeHooks()
prefix = "!" -- prefix


--====== DONT CHANGE ANYTHING ======
farhankebab = true
siapasangka = false
range = 0
block = 0
delay = 150

addHook("onvariant", "ajojing", function(var)
    if var[0] == "OnConsoleMessage" then
        if var[1]:find("`$"..prefix.."setid%s(%d+)````") then
            block = var[1]:match("`$"..prefix.."setid%s(%d+)````")
            say("ID Block Has Been Set to : "..block)
        elseif var[1]:find("`$"..prefix.."warp%s(%w+)````") then
            world = var[1]:match("`$"..prefix.."warp%s(%w+)````")
            say("Warping to "..world:upper())
            sendPacket("action|join_request\nname|"..world.."\ninvitedWorld|0", 3)
        elseif var[1]:find("`$"..prefix.."collect%s(%d+)````") then
            range = var[1]:match("`$"..prefix.."collect%s(%d+)````")
            say("Set Auto Collect Range to "..range)
        elseif var[1]:find("`$"..prefix.."delay%s(%d+)````") then
            delay = var[1]:match("`$"..prefix.."delay%s(%d+)````")
            say("Set Delay to "..delay)
        elseif var[1]:find("`$"..prefix.."pnb````") then
            if not siapasangka then
                say("Turn On PNB")
                siapasangka = true
            else
                say("Turn Off PNB")
                siapasangka = false
            end
        elseif var[1]:find("`$"..prefix.."duar````") then
            say("`4Script Terminated..")
            farhankebab = false
            siapasangka = false
            removeHooks()
        end
    end
end)

function reyhan()
    collectSet(true,range)
    sleep(2000)
    while siapasangka do
        if findItem(block) > 0 then
            place(block,0,-2)
            sleep(delay)
            repeat
                punch(0,-2)
                sleep(delay)
            until getTile(math.floor(getBot().x / 32),math.floor(getBot().y / 32) - 2).fg == 0 or getTile(math.floor(getBot().x / 32),math.floor(getBot().y / 32) - 2).bg == 0
        else
            say("Block not Found,Turn Off PNB")
            sleep(1000)
            break
        end
    end
    siapasangka = false
    sleep(5000)
end

while farhankebab do
    sleep(2000)
    if siapasangka then
        reyhan()
    else
        sleep(1000)
    end
end