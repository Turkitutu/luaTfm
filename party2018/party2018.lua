tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disablePhysicalConsumables(true)

admins={["Turkitutu#0000"]=true,["Unlocker001#0000"]=true}
tfm.exec.disablePhysicalConsumables(true)
canParty = false

for n,i in pairs(admins) do
tfm.exec.movePlayer(n,106, 388)
end

Countries = { 
  [1]={name="الإمارات العربية المتحدة، عمان", GMT=4},
  [2]={name="السعودية، العراق، الكويت، قطر، البحرين، اليمن، الصومال ،جيبوتي", GMT=3},
  [3]={name="مصر، السودان، فلسطين، سوريا، لبنان، ليبيا، الاردن", GMT=2},
  [4]={name="الجزائر، تونس", GMT=1},
  [5]={name="المغرب، موريتانيا", GMT=0},
}



function Time_2018(tbl)
    _t = tbl.GMT
    _t = (_t < 0 or _t > 0 and _t*-1 or _t)
    time2018 = os.time{year=2018, month=1, day=1, hour=0+(_t),min=0 , sec=0}
    time = time2018 - os.time()
    return {["H"]=os.date("%H", time),["M"]=os.date("%M", time),["S"]=os.date("%S", time),["D"]=os.date("%d", time)}
end


function eventLoop()
  text = ""
  for n,p in pairs(Countries)do
    a_ = Time_2018({GMT=p.GMT}) 
    if a_["D"] ~= "30" and a_["D"] ~= "31" then
      if a_["H"] == "00" and tonumber(a_["M"]) < 5 then
        text = text.."<font color='#E0AF7E'>"..p.name.."<r><br>"..a_["H"]..":"..a_["M"]..":"..a_["S"].."<br><br></r>"
      else
        text = text.."<font color='#E0AF7E'>"..p.name.."<br>"..a_["H"]..":"..a_["M"]..":"..a_["S"].."<br><br>"
      end
      if a_["H"] == "00" and tonumber(a_["M"]) < 1 then
        if a_["S"] ~= "00" then
          ui.addTextArea(2,"<br><br><font size='100'><p align='center'><b>"..(tonumber(a_["S"]) > 10 and "<font color='#C29871'>" or "<r>")..a_["S"],nil,300,160,500,200,nil,nil,0,false)
        else
          canParty = true
          ui.addTextArea(2,"<font face='Tahoma'><br><br><font size='65'><p align='center'><font color='#DC294A'>2018<br><j>! سنةٌ جدِيدةٌ سعيدةٌ<br><font size='50'><vp>كلُ عامٍ و أنتم بخيرٍ<br><font size='25'><n><font color='#E0AF7E'>"..p.name,nil,263,110,560,300,nil,nil,0,false)
          n=0
          for n in pairs(tfm.get.room.playerList) do
            tfm.exec.movePlayer(n, n == 0 and 990 or 106, 388)
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

ui.addTextArea(1,"<font size='12'><p align='center'>"..text,nil,850,140,320,327,nil,nil,0,false)
  if not canParty then
    ui.addTextArea(3,"<p align='center'><font size='30'><font color='#E0AF7E'>حفل رأس سنة 2018</p>",nil,300,353,500,60,1,1,0,false)
  else
    ui.removeTextArea(3)
  end
end


function eventChatCommand(n,c)
    local args={}
    for s in c:gmatch("%S+") do
        table.insert(args, s)
    end
    if admins[n] and args[1]=="mv" then
        tfm.exec.movePlayer(args[2],500, 320)
    end

    if admins[n] and args[1] == "rv" then
        tfm.exec.respawnPlayer(args[2])
    end
    if admins[n] and args[1] == "kill" then
        tfm.exec.killPlayer(args[2])
    end
end

tfm.exec.newGame('7348004')

-- • # [*Let Us Alone] ui.addTextArea(1,"<br><br><font size='100'><p align='center'>60",nil,152,80,500,200,nil,nil,0,true)
