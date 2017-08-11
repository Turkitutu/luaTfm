admin="Your Username"

data={}
system.disableChatCommandDisplay ("q",true)

function AddArea(id,x,y,i,bl,t)
    ui.addTextArea((id*3)+1,"<p align='center'>"..tostring(data[i].name).."</p>",t,(bl and x or x+48),y,115,20,1,0x00B2FF,0.9,true,true)
    ui.addTextArea((id*3)+2,"<p align='center'>"..(t == admin and "<a href='event:Add_"..i.."'><vp>+</vp></a> " or "")..""..tostring(data[i].score)..""..(t == admin and " <a href='event:rem_"..i.."'><r>-</r></a>" or "").."</p>",t,(bl and x+123 or x),y,40,20,1,0x00B2FF,0.9,true,true)
end

function PopupPlayers()
    for n in pairs(tfm.get.room.playerList)do
        for i=1,#data do
            v = data[i]
            y = i < 11 and (30*i) or i > 10 and ((30*(i-10))-10)
            b = i < 11 and false or i > 10 and true
            AddArea(i, (i > 10 and 7 or 629), y+i, i, b, n)
        end
    end
end

function eventNewPlayer(n)
    table.insert(data,{score=0,name=n})
    PopupPlayers()
end

function eventTextAreaCallback(id,name,event)
    if event:sub(1,4) == "Add_" then
        data[tonumber(event:sub(5))].score=data[tonumber(event:sub(5))].score+1
        PopupPlayers()
    elseif event:sub(1,4) == "rem_" then
        data[tonumber(event:sub(5))].score=data[tonumber(event:sub(5))].score-1
        PopupPlayers()
    end
    if event == "test" then PopupPlayers() end
end
table.foreach(tfm.get.room.playerList,eventNewPlayer)

function eventPlayerLeft(n)
    for i=1,60 do
        ui.removeTextArea(i)
    end
    for i=1,#data do
        if data[i] ~= nil then
            if data[i].name == n then
                table.remove(data,i)
            end
        end
    end
    PopupPlayers()
end

function eventChatCommand(n,cmd)
    if cmd:sub(0,1) == "q" and n == admin then
        ui.addTextArea(-100,"<p align='center'><j>["..tfm.get.room.name.."]</j>: "..cmd:sub(3).."</p>",nil,177,377,460,30,1,0x00B2FF,0.9,true,true)
    end
end
