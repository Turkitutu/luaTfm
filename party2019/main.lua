
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)

winners = {}

cmds = {'c', 'kill', 'md', 'mv', 'rv', 'send', 'winners', 'start', 'ru'}
for i=1, #cmds do
    system.disableChatCommandDisplay(cmds[i], true)
end

admins = {["Turkitutu#0000"]=true, ["Wassimevicw#0000"]=true, ["Unlocker001#0000"]=true, ["Heniyengui#0000"]=true}
countdown = {"167fecd72d2.png", "167fecd05d4.png", "167fecc9b2f.png", "167fecc3e9e.png", "167fecbddc9.png", "167fecb6783.png", "167fecaf8e0.png", "167feca846e.png", "167feca0096.png", "167fec97db5.png"}
contests = {
    "<bv>: مسابقة الظلال</bv>\n<n>https://docs.google.com/forms/d/e/1FAIpQLScotpn5JUhQzxp5oiI8UKqARYG0kVPb-FAS-YNRFs7-vUJSqw/viewform",
    "<bv>: مسابقة الأخطاء السبعة</bv>\n<n>https://docs.google.com/forms/d/e/1FAIpQLSe2eqWhnuJKJ4SHoJpZt4I506F9dfurCu6KLPocJAxyPQ5m_g/viewform",
    "<bv>:  مسابقة المتاهة<bv>\n<n>https://docs.google.com/forms/d/e/1FAIpQLScrJUVkk2e2s77ioRY_Ayb57TbUnCyHyv7Q25KkMj_06OFAcg/viewform"
}
contestT = 8
contestN = 1
players={}
blockPlayer={}
canChosse = false
mice = 0
player = ""
last_player = ""
number = 0

canTP = {}

function title(name)
    return name:sub(1,1):upper()..name:sub(2):lower()
end

for i=1,#winners do
    blockPlayer[winners[i]] = true
end

function mapImages(n)
    tfm.exec.addImage("167f5716c71.png", "_49", (1000-650)/2, 0, n)
    tfm.exec.addImage("167f55b6604.png", "!50", (1000-650)/2, 0, n)
    tfm.exec.addImage("16804726586.png", "!100", 5, 120, n)
    --tfm.exec.addImage("167feb8a893.png", "_101", 465, 355, n)
    tfm.exec.addImage("16f5d7eb0b1.png", "_101", 400, 380, n)

end

function eventNewPlayer(n)
    mapImages(n)
    tfm.exec.respawnPlayer(n)
    if admins[n] then
        system.bindMouse(n, true)
        tfm.exec.bindKeyboard(n, 17, true, true)
        tfm.exec.bindKeyboard(n, 17, false, true)
        canTP[n] = false
    end
    table.insert(players,n)
    mice = mice +1
end

function eventPlayerLeft(n)
  for i=1,#players do
    if players[i] == n then
      table.remove(players,i)
    end
  end
  mice = mice -1
end


function eventNewGame()
    mapImages(nil)
end

function eventPlayerDied(n)
    tfm.exec.respawnPlayer(n)
end

function DP(id,x,y)
  for i=1, 20 do
    tfm.exec.displayParticle(id, x,y, (math.random(30)-15)/5, (math.random(10)-5)/5, 0, 0)
  end
end


function eventChatCommand(n,c)
    local args={}
    local player = ""
    local dc = false
    for s in c:gmatch("%S+") do
        table.insert(args, s)
    end


    local cmd = args[1]:lower()
    if args[2] then
        player = title(args[2]:gsub("me", n):gsub("all", "*"))
    end

    if admins[n] and cmd=="mv" then
        if player == "*" then
            for i in next, tfm.get.room.playerList do
                tfm.exec.movePlayer(i, math.random(300, 700), 335)
            end
        else
            tfm.exec.movePlayer(player, 500, 335)
        end
        dc = true
    end

    if admins[n] and cmd=="md" then
        if player == "*" then
            for i in next, tfm.get.room.playerList do
                tfm.exec.movePlayer(i, math.random(300, 700), 400)
            end
        else
            tfm.exec.movePlayer(player, 500, 400)
        end
        dc = true
    end

    if admins[n] and cmd == "rv" then
        tfm.exec.respawnPlayer(player)
        dc = true
    end
    if admins[n] and cmd == "kill" then
        if player == "*" then
            for i in next, tfm.get.room.playerList do
                tfm.exec.killPlayer(i)
            end
        else
            tfm.exec.killPlayer(player)
        end
        dc = true
    end
    if admins[n] and cmd == "c" then
        tfm.exec.chatMessage('<n>'..c:sub(#cmd+1)..' : </n><bv>'..n..' «2019»</bv>')
    end

    if admins[n] and cmd == "send" then
        if player == "1" or player == "2" or player == "3" then
            contestT = 0
            contestN = tonumber(player)
        end
        dc = true
    end

    if admins[n] and cmd == "start" then
        mice = 0
        player = ""
        last_player = ""
        number = math.random(40,50)
        canChosse = true
        tfm.exec.chatMessage("<rose>!!بدات القرعة ")
        dc = true
    end
    if admins[n] and cmd == "winners" then
        local list = ""
        for name in next, blockPlayer do
            list = list..", "..name
        end
        tfm.exec.chatMessage(list:sub(2), n)
        print(list:sub(2))
        dc = true
    end
    if dc then
        for i in next, admins do
            tfm.exec.chatMessage('['..n..'] «!'..c..'»', i)
        end
    end
end



function eventKeyboard(n, key, down, x, y)
    if key == 17 and admins[n] then
        if down then
            canTP[n] = true
        else
            canTP[n] = false
        end
    end
end


function eventMouse(n, x, y)
    if admins[n] and canTP[n] then
        tfm.exec.movePlayer(n, x, y)
    end
end


table.foreach(tfm.get.room.playerList, eventNewPlayer)
xml = [[
<C><P L="1000" H="465" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" H="3000" L="3000" o="0" X="500" c="4" Y="200" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="997" o="0" H="10" X="499" Y="469" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="0" H="482" X="1003" Y="243" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="0" H="520" X="4" Y="260" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="997" o="0" H="10" X="506" Y="0" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" H="10" L="1000" o="0" X="500" c="3" Y="345" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" H="340" L="200" o="0" X="79" c="4" N="" Y="174" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" H="340" L="200" o="0" X="923" c="4" N="" Y="179" T="12" /></S><D><DS Y="451" X="499" /></D><O /></Z></C>
]]
tfm.exec.newGame(xml:gsub('\n', ""))





-------------------------------------------------------------------------------------

Countries = { 
  [1]={name="الإمارات العربية المتحدة -\n عمان -", GMT=4},
  [2]={name="السعودية و قطر -\nالكويت و البحرين -\nاليمن و العراق -", GMT=3},
  [3]={name="مصر، السودان و لبنان -\nفلسطين و سوريا -\nليبيا و الاردن -", GMT=2},
  [4]={name="الجزائر، تونس و المغرب", GMT=1},
}




function Time_2019(tbl)
    _t = tbl.GMT
    _t = (_t < 0 or _t > 0 and _t*-1 or _t)
    time2019 = os.time{year=2019, month=1, day=1, hour=0+(_t),min=0 , sec=0}
    time = time2019 - os.time()
    return {["H"]=os.date("%H", time),["M"]=os.date("%M", time),["S"]=os.date("%S", time),["D"]=os.date("%d", time)}
end
countdownId = 0

t = 0
g=0
tt=0
function eventLoop()
    text = ""
    for n,p in pairs(Countries)do
        a_ = Time_2019({GMT=p.GMT}) 
        if a_["D"] ~= "30" and a_["D"] ~= "31" then
            if a_["H"] == "00" and tonumber(a_["M"]) < 5 then
                text = text.."<n>"..p.name.."<r><br>«"..a_["H"]..":"..a_["M"]..":"..a_["S"].."»  <br><br></r>"
            else
                text = text.."<n>"..p.name.."<br>«"..a_["H"]..":"..a_["M"]..":"..a_["S"].."»  <br><br>"
            end
            if a_["H"] == "00" and tonumber(a_["M"]) < 1 then
                if a_["S"] ~= "00" and tonumber(a_["S"]) <= 10 then
                    tfm.exec.removeImage(countdownId)
                    countdownId = tfm.exec.addImage(countdown[tonumber(a_["S"])], "!102", 458, 150)
                elseif tonumber(a_["S"]) < 1 then
                    canParty = true
                    n=0
                    tfm.exec.removeImage(countdownId)
                    for n in pairs(tfm.get.room.playerList) do
                        if n == 0 then n=1 elseif n == 1 then n=0 end
                    end
                end
            end
        end

        if canParty then
            for k,v in pairs(tfm.get.room.playerList) do
                tfm.exec.setNameColor(k,'0x'..math.random(0x000000,0xFFFFFF))
            end
        end
    end
    ui.addTextArea(1,"<font size='12'><p align='right'>"..text,nil,670,140,320,327,nil,nil,0,false)

    t = t + 1
    if t == 2 then
        if contestT < 7 then
            tfm.exec.chatMessage(contests[contestN])
            contestT = contestT + 1
        end
        t = 0
    end



  if canChosse then
    g=g+1
  end
    if canChosse and g == 1 then
      g=0
      playerList = {}
      for n,p in pairs (players) do
        if not blockPlayer[p] then
          table.insert(playerList, p)
        end
      end
      player = playerList[math.random(#playerList)]
      while (player == last_player) do
        player = playerList[math.random(#playerList)]
      end
      tfm.exec.addShamanObject(0,tfm.get.room.playerList[player].x, tfm.get.room.playerList[player].y-35, 0, 0, 0, true)
      if tt == number then
        tfm.exec.movePlayer(player, 500, 335)
        for n in next, tfm.get.room.playerList do
            tfm.exec.playEmote(n, ({0,2,4,5,7,24,16})[math.random(7)])
        end
        blockPlayer[player] = false
        DP(3,500, 335)
        tfm.exec.chatMessage("<ch> بالقرعة <j>"..player.."</j> لقد فاز")
        canChosse = false
      else
        last_player = player
        tt=tt+1
      end
    end
end
