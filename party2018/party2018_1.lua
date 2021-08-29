
tfm.exec.disablePhysicalConsumables(true)
admins={Turkitutu=true,Unlocker001=true}
players={}
blockPlayer={Turkitutu=true,Gbnami=true,Abodddddd=true,Zouzouzoune=true,Taynytone=true,Farahee=true,Kingkomand2o=true,Error_404=true,Nanananiko=true,Hdyangy=true,Xmazen=true,Mryamoo=true,Moltkeh=true,Viveedinadz=true,Blida_09=true,Mixysl=true,Minocha0=true,Ahmadmide=true,Roysl=true}
canChosse = false
mice = 0
player = ""
last_player = ""
number = 0

function eventNewPlayer(n)
  tfm.exec.respawnPlayer (n)
  table.insert(players,n)
  mice = mice +1
end

table.foreach(tfm.get.room.playerList,eventNewPlayer)



function DP(id,x,y)
  for i=1, 20 do
    tfm.exec.displayParticle(id, x,y, (math.random(30)-15)/5, (math.random(10)-5)/5, 0, 0)
  end
end


function eventPlayerLeft(n)
  for i=1,#players do
    if players[i] == n then
      table.remove(players,i)
    end
  end
  mice = mice -1
end

t=0
tt=0
function eventLoop()
if canChosse then
  t=t+1
end
  if canChosse and t == 1 then
    t=0
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
    ui.addTextArea(1,"<p align='center'><font size='25'>: يتم الإختيار عشوائيًا<br><br><font size='30'><j>"..player.."</p>",nil,264,20,266,150,1,1,0.8,true)
    print("n:"..number)
    print("tt:"..tt)
    if tt == number then
      ui.addTextArea(1,"<p align='center'><font size='25'>: الفائز بالقرعة هو<br><br><font size='30'><v>"..player.."</p>",nil,264,20,266,150,1,1,0.8,true)
      tfm.exec.movePlayer(player, 399, 207)
      DP(3,399, 207)
      canChosse = false
    else
      last_player = player
      tt=tt+1
    end
  end
end


function eventChatCommand(n,c)
  local args={}
  for s in c:gmatch("%S+") do
    table.insert(args, s)
  end
  cmd=args[1]:lower()

  if args[1] == "start" and admins[n] then
    number = math.random(40,50)
    canChosse = true
  end
    if admins[n] and args[1]=="mv" then
        tfm.exec.movePlayer(args[2],500, 320)
    end

    if admins[n] and args[1] == "rv" then
        tfm.exec.respawnPlayer(args[2])
    end
end





--- ui.addTextArea(1,"<p align='center'><font size='25'>: الفائز بالقرعة هو<br><br><font size='30'><v>Unlocker001</p>",nil,264,20,266,150,1,1,0.8,true)

--  ui.addTextArea(1,"<p align='center'><font size='25'>: يتم الإختيار عشوائيًا<br><br><font size='30'><j>test</p>",nil,264,20,266,150,1,1,0.8,true)