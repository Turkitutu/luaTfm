map = [[<C><P DS="m;17,350,77,366,138,380,216,360,310,361,392,372,482,372,578,379,682,377,751,356" D="x_transformice/x_maps/x_rentree2015/map-classe.jpg" /><Z><S><S P="0,0,0.5,0.2,15,0,0,0" L="147" H="10" lua="0" Y="369" T="0" m="" X="67" /><S P="0,0,0.3,0.2,0,0,0,0" L="155" H="10" Y="379" T="0" m="" X="433" /><S P="0,0,0.3,0.2,-2,0,0,0" L="200" H="10" Y="383" T="0" m="" X="608" /><S P="0,0,0.3,0.2,-20,0,0,0" L="80" H="10" Y="382" T="0" m="" X="157" /><S P="0,0,0.3,0.2,0,0,0,0" L="160" H="10" Y="369" T="0" m="" X="274" /><S P="0,0,0.5,0.2,-15,0,0,0" L="120" H="10" Y="365" T="0" m="" X="744" /><S P="0,0,0.3,0.2,40,0,0,0" L="10" H="10" Y="381" T="0" m="" X="512" /><S P="0,0,0.3,0.2,50,0,0,0" L="14" H="10" Y="372" T="0" m="" X="354" /><S P="0,0,0,0,0,0,0,0" L="10" H="400" Y="200" T="0" m="" X="-5" /><S P="0,0,0,0,0,0,0,0" L="10" H="400" Y="200" T="0" m="" X="805" /><S L="800" o="9b612c" X="400" H="127" Y="395" T="12" P="0,0,0.3,0.2,0,0,0,0" /></S><D><P C="ffd73d" Y="332" T="19" P="0,0" X="765" /><P C="ff8630" Y="331" T="19" P="0,0" X="41" /><DS Y="318" X="400" /></D><O /></Z></C>]]
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
timeNewRound=false
NewGame=false
square={{x1=320,x2=380,y1=95 ,y2=155,id=1,a=""},{x1=381,x2=440,y1=95 ,y2=155,id=2,a=""},{x1=441,x2=500,y1=95 ,y2=155,id=3,a=""},{x1=320,x2=380,y1=156,y2=214,id=4,a=""},{x1=381,x2=440,y1=156,y2=214,id=5,a=""},{x1=441,x2=500,y1=156,y2=214,id=6,a=""},{x1=320,x2=380,y1=215,y2=274,id=7,a=""},{x1=381,x2=440,y1=215,y2=274,id=8,a=""},{x1=441,x2=500,y1=215,y2=274,id=9,a=""}}
chair={{x1=0,x2=80,y1=250,y2=330,boolean=false,player="Space",bl=false},{x1=720,x2=800,y1=250,y2=330,boolean=false,player="Space",bl=false}}
idsWin={{1,2,3},{4,5,6},{7,8,9},{1,5,9},{3,5,7},{1,4,7},{2,5,8},{3,6,9}}
jointTables={{point1={x=331,y=127},point2={x=491,y=127}},{point1={x=331,y=187},point2={x=491,y=187}},{point1={x=331,y=247},point2={x=491,y=247}},{point1={x=491,y=264},point2={x=331,y=105}},{point1={x=331,y=265},point2={x=491,y=106}},{point1={x=351,y=111},point2={x=351,y=264}},{point1={x=412,y=111},point2={x=412,y=264}},{point1={x=471,y=111},point2={x=471,y=264}}}
tb_moves={200,250,300,350,400,450,500,550,600}
welcome_msg = "<rose>Welcome to <j>Tic-Tac-Toc game. !</j></rose><br><fc>Type !help to display info about the minigame.</fc>"
t=0
tt=5
t_win=true
canSpace=false
csp=false
cspt=0
mice = 0
nameW=""
adminRoom={}


if tfm.get.room.name:match("%*?.-%*(.-)$") then
  adminRoom[tfm.get.room.name:match("%*?.-%*(.-)$")] = true
end


function ConSy(ty) 
  local co, s = idsWin, square
  local a1,a2,a3,type="","","",""
  local aX={"","",""}
  local aO={"","",""}
  for i=1,#co do
    for j,v in pairs(s) do
      if     s[j].id == co[i][1] and s[j].a == "X"  then aX[1]=co[i][1]
      elseif s[j].id == co[i][2] and s[j].a == "X"  then aX[2]=co[i][2]
      elseif s[j].id == co[i][3] and s[j].a == "X"  then aX[3]=co[i][3]
      elseif s[j].id == co[i][1] and s[j].a == "O"  then aO[1]=co[i][1]
      elseif s[j].id == co[i][2] and s[j].a == "O"  then aO[2]=co[i][2]
      elseif s[j].id == co[i][3] and s[j].a == "O"  then aO[3]=co[i][3]
      end
      if aX[1] ~= "" and aX[2] ~= "" and aX[3] ~= "" then
        if ty == "type" then return 1
        elseif ty == "id" then return i
        end
      elseif aO[1] ~= "" and aO[2] ~= "" and aO[3] ~= "" then
        if ty == "type" then return 2
        elseif ty == "id" then return i
        end
      end
    end
    aX={"","",""}
    aO={"","",""}
  end
end

function WinPlayer(n,id)
  local jo = jointTables
  chair[1].bl,chair[2].bl=false,false
  ui.removeTextArea(100, nil)
  tfm.exec.addJoint(1,0,0,{type=0,point1=jo[id].point1.x..","..jo[id].point1.y,point2=jo[id].point2.x..","..jo[id].point2.y,line=4,color=(n == 1 and "0xF52E2E" or "0x5CA4D4"),foreground=true})
  NewGame=true
end


function eventLoop(time,m)
  if NewGame then
    t=t+1
  if t == 5 and t_win then
    tfm.exec.addJoint(1,0,0,{type=0,point1=0,0,point2=0,0,line=4,color=nil,foreground=true})
    nameW = chair[ConSy("type")].player
    tfm.exec.chatMessage("<vb>"..nameW.."<rose> Won the Game!!</rose>")
    tfm.exec.giveCheese(nameW)
    tfm.exec.playerVictory(nameW)
    ui.addTextArea(50,"<p align='center'><font size ='40'>"..nameW.." Won the Game</font></p>",nil,94,148,615,95,nil,nil,0,false)
    for i=1,9 do
      ui.removeTextArea(i, nil)
    end
    t_win=false
  elseif t == 20 then
    for i=1,9 do
      ui.removeTextArea(i, nil)
    end
    tfm.exec.addJoint(1,0,0,{type=0,point1=0,0,point2=0,0,line=4,color=nil,foreground=true})
    ui.addTextArea(50,"<p align='center'><font size ='35'>Next round starts in "..tt.." seconds</font></p>",nil,94,148,615,95,nil,nil,0,false)
  elseif t == 30 then
    ui.removeTextArea(50, nil)
    tfm.exec.newGame(map)
    tfm.exec.chatMessage("<rose>New round !</rose>")
  end
  if t > 5 and t < 19 then
    for i=0,20 do
      tfm.exec.displayParticle(21,math.random(0,800),math.random(0,400),0,math.random(1.1),0,math.random(0.22))
      tfm.exec.displayParticle(22,math.random(0,800),math.random(0,400),0,math.random(1.1),0,math.random(0.22))
      tfm.exec.displayParticle(23,math.random(0,800),math.random(0,400),0,math.random(1.1),0,math.random(0.22))
      tfm.exec.displayParticle(24,math.random(0,800),math.random(0,400),0,math.random(1.1),0,math.random(0.22))
    end
  end
  if t == 22 or t == 24 or t == 26 or t == 28 then
    tt=tt-1
    ui.addTextArea(50,"<p align='center'><font size ='35'>Next round starts in "..tt.." seconds</font></p>",nil,94,148,615,95,nil,nil,0,false)
  end
  end
  if csp then
    cspt = cspt + 1
    if cspt == 2 then
      canSpace = true
      cspt = 0
      csp = false
    end
  end
end

function eventPlayerWon(n,timeElapsed, timeElapsedSinceRespawn)
  tfm.exec.respawnPlayer(n)
end

function eventNewGame()
  ui.setMapName("<rose>#xo </rose><v>Module")
  for i=1,9 do
    square[i].a=""
  end
  for i=1,2 do
    chair[i].boolean=false
    chair[i].bl=false
    chair[i].player="Space"
  end
  NewGame=false
  t_win=true
  nameW=""
  t=0
  tt=5
  timeNewRound=false
  RefrchNames(nil)
  for n,p in pairs(tfm.get.room.playerList) do
    tfm.exec.movePlayer(n,tb_moves[math.random(#tb_moves)],320)
    tfm.exec.setNameColor (n,0xFFCB00)
  end
  csp = true
end

function numberSquare(n,Nx,Ny) 
  for i,t in pairs(square) do
    if ((Nx >= square[i].x1 and Nx <= square[i].x2) and (Ny >= square[i].y1 and Ny <= square[i].y2)) then
        return square[i].id
    end
  end
end

function Menu(n)
  if (chair[1].player ~= "Space" and chair[2].player ~= "Space") and t < 5  then
    s=square
    ui.addTextArea(1,"<p align='center'>"..(s[1].a == "X" and "<font size='42' color='#F52E2E'>"..s[1].a.."" or s[1].a == "O" and "<font size='40' color='#5CA4D4'>"..s[1].a or "").."</p></font>",n,326,100,50,50,-1,16777215,0.9,false)
    ui.addTextArea(2,"<p align='center'>"..(s[2].a == "X" and "<font size='42' color='#F52E2E'>"..s[2].a.."" or s[2].a == "O" and "<font size='40' color='#5CA4D4'>"..s[2].a or "").."</p></font>",n,386,100,50,50,-1,16777215,0.9,false)
    ui.addTextArea(3,"<p align='center'>"..(s[3].a == "X" and "<font size='42' color='#F52E2E'>"..s[3].a.."" or s[3].a == "O" and "<font size='40' color='#5CA4D4'>"..s[3].a or "").."</p></font>",n,446,100,50,50,-1,16777215,0.9,false)
    ui.addTextArea(4,"<p align='center'>"..(s[4].a == "X" and "<font size='42' color='#F52E2E'>"..s[4].a.."" or s[4].a == "O" and "<font size='40' color='#5CA4D4'>"..s[4].a or "").."</p></font>",n,326.5,160,50,50,-1,16777215,0.9,false)
    ui.addTextArea(5,"<p align='center'>"..(s[5].a == "X" and "<font size='42' color='#F52E2E'>"..s[5].a.."" or s[5].a == "O" and "<font size='40' color='#5CA4D4'>"..s[5].a or "").."</p></font>",n,386.5,160,50,50,-1,16777215,0.9,false)
    ui.addTextArea(6,"<p align='center'>"..(s[6].a == "X" and "<font size='42' color='#F52E2E'>"..s[6].a.."" or s[6].a == "O" and "<font size='40' color='#5CA4D4'>"..s[6].a or "").."</p></font>",n,446.5,160,50,50,-1,16777215,0.9,false)
    ui.addTextArea(7,"<p align='center'>"..(s[7].a == "X" and "<font size='42' color='#F52E2E'>"..s[7].a.."" or s[7].a == "O" and "<font size='40' color='#5CA4D4'>"..s[7].a or "").."</p></font>",n,326.5,220,50,50,-1,16777215,0.9,false)
    ui.addTextArea(8,"<p align='center'>"..(s[8].a == "X" and "<font size='42' color='#F52E2E'>"..s[8].a.."" or s[8].a == "O" and "<font size='40' color='#5CA4D4'>"..s[8].a or "").."</p></font>",n,386.5,220,50,50,-1,16777215,0.9,false)
    ui.addTextArea(9,"<p align='center'>"..(s[9].a == "X" and "<font size='42' color='#F52E2E'>"..s[9].a.."" or s[9].a == "O" and "<font size='40' color='#5CA4D4'>"..s[9].a or "").."</p></font>",n,446.5,220,50,50,-1,16777215,0.9,false)
  end
end

function RefrchNames(n)
  ui.addTextArea(10,"<p align='center'>["..chair[1].player.."]",n,-5,340,90,20,nil,nil,0,true)
  tfm.exec.setNameColor (chair[1].player,0xF52E2E)
  ui.addTextArea(20,"<p align='center'>["..chair[2].player.."]",n,720,340,90,20,nil,nil,0,true)
  tfm.exec.setNameColor (chair[2].player,0x5CA4D4)
end

function eventNewPlayer(n)
  mice = mice + 1
  for i,key in pairs({32}) do
    tfm.exec.bindKeyboard(n,key,true,true)  
    system.bindMouse(n,true)
  end
  Menu(n)
  RefrchNames(n)
  tfm.exec.respawnPlayer(n)
  tfm.exec.movePlayer(n,tb_moves[math.random(#tb_moves)],320)
  RP()
  tfm.exec.setNameColor (n,0xFFCB00)
  tfm.exec.chatMessage(welcome_msg,n)
  ui.addTextArea(-1, "<p align='center'><a href='event:show'>Menu »</a></p>", n, 10, 30, 60, 18, 0x142b2e, 0x8a583c, 1, true)
end

for n in pairs (tfm.get.room.playerList) do
  mice = mice + 1
  for i,key in pairs({32}) do
    tfm.exec.bindKeyboard(n,key,true,true)  
    system.bindMouse(n,true)
    tfm.exec.chatMessage(welcome_msg,n)
  end
  ui.addTextArea(-1, "<p align='center'><a href='event:show'>Menu »</a></p>", n, 10, 30, 60, 18, 0x142b2e, 0x8a583c, 1, true)
end



function open_help(n,page)
  if page == 1 then
    ui.addTextArea(-800, "<a href='event:help_cmd'>Commands</a>", n, 175, 123, 100, 20, 0x3f2b1d, 0x1f1813, 1, true)
    ui.addTextArea(-801, "\nWelcome to the <vp>Tic-Tac-Toc</vp> game.\n\n<fc><a href='event:help_own'>./room #discodance5xo*"..n.."</a></fc> to make your own room\nChoose a chair and press spacebar and Use the mouse to play the game.\n<p align='center'><font size='100'>#<font color='#F52E2E'>X<font color='#5CA4D4'>O</font></p>\n", n, 252, 103, 293, 220, 0x142b2e, 0x8a583c, 1, true)  elseif page == 2 then
    ui.addTextArea(-800, "<a href='event:help_open'>Home</a>", n, 207, 123, 100, 20, 0x3f2b1d, 0x1f1813, 1, true)
    ui.addTextArea(-801, "\n<p align='center'><font size='20'>Commands</p><p align='left'>\n<j>General commands :</j>\n  !help : Display info about the minigame.\n\n<fc>Room owner commands :</fc>\n  !pw [password] : Change the room password\n  !pw : disable Password \n  !skip : Skip the round\n", n, 252, 103, 293, 220, 0x142b2e, 0x8a583c, 1, true)
  end
  ui.addTextArea(-802, "<p align='center'>Help</p>", n, 248, 81, 305, 21, 0x3f2b1d, 0x1f1813, 1, true)
  ui.addTextArea(-803, "<p align='center'><a href='event:help_close'>X</a></p>", n, 529, 83, 29, 18, 0x324650, 0x000000, 0, true)
end


function eventTextAreaCallback(id,n,event)
  if event == "show" then
    ui.addTextArea(-1, "<p align='center'><j><a href='event:hide'>Menu «</a></j>  |  <a href='event:help_open'>Help</a>", n, 10, 30, 120, 18, 0x142b2e, 0x8a583c, 1, true)
  elseif event == "hide" then
    ui.addTextArea(-1, "<p align='center'><a href='event:show'>Menu »</a></p>", n, 10, 30, 60, 18, 0x142b2e, 0x8a583c, 1, true)
  elseif event == "help_open" then
    open_help(n,1)
  elseif event == "help_cmd" then
    open_help(n,2)
  elseif event == "help_close" then
    for i=800,803 do
      ui.removeTextArea(-1*i, n)
    end
  elseif event == "help_own" then
    tfm.exec.chatMessage("<fc>[•] </fc><n>./room #discodance5xo*"..n,n)
  end
end



function eventKeyboard(n,key,down,Px,Py)
  if key == 32 and canSpace then
    if ((Px > chair[1].x1 and Px < chair[1].x2) and (Py > chair[1].y1 and Py < chair[1].y2)) and not chair[1].boolean and n ~= chair[2].player then
        selectPlayer(n,1)
    elseif ((Px > chair[2].x1 and Px < chair[2].x2) and (Py > chair[2].y1 and Py < chair[2].y2)) and not chair[2].boolean and n ~= chair[1].player then
        selectPlayer(n,2)
    end
    RefrchNames(nil)
  end
end

function RP()
  if chair[1].player ~= "Space" or chair[2].player ~= "Space" then
    ui.addTextArea(100,"",nil,(chair[1].bl and 9 or 730),268,65,65,-1,-1,1,true)
  else
    ui.removeTextArea(100, nil)
  end
end

function eventMouse(n,Mx,My)
  id=numberSquare(n,Mx,My)
  s=square
  nn=0
  if (n == chair[1].player or n == chair[2].player) and (chair[1].player ~= "Space" and chair[2].player ~= "Space") and (id ~= nil) and square[id].a == "" and chair[n == chair[1].player and 1 or 2].bl then
    square[id].a=(n == chair[1].player and "X" or n == chair[2].player and "O")
    chair[(n == chair[1].player and 1 or 2)].bl=false
    chair[(n == chair[1].player and 2 or 1)].bl=true
    RP()
    Menu(nil)
    if ConSy("type") ~= nil and ConSy("id") ~= nil then
      WinPlayer(ConSy("type"),ConSy("id")) 
    end
    
    for i=1,#s do
      if s[i].a ~= "" then
        nn=nn+1
      end
    end
    if (nn == 9) and (ConSy("type") == nil and ConSy("id") == nil) then
      for i=1,9 do
        ui.removeTextArea(i, nil)
      end
      t=19
      NewGame=true
    end
  end
end

function selectPlayer(n,id)
  if id == 1 then
    tfm.exec.chatMessage("<vp>"..n.."</vp><j> is playing with <font color='#FF2300'>X</font></j> !")
  else
    tfm.exec.chatMessage("<vp>"..n.."</vp><j> is playing with <font color='#0094FF'>O</font></j> !")
  end
  chair[id].player=n
  chair[id].boolean=true
  RefrchNames(n)
  if chair[1].player ~= "Space" and chair[2].player ~= "Space" then
    canSpace=false
    Menu(nil)
    chair[1].bl=true
    RP()
  end
end


function eventPlayerDied(n) 
  Menu(n)
  RefrchNames(n)
  tfm.exec.respawnPlayer(n)
  RP()
  tfm.exec.setNameColor (n,0xFFCB00)
end

function eventPlayerLeft(n)
  if n == chair[1].player or n == chair[2].player then
    nameW = (n == chair[1].player and chair[2].player or chair[1].player)
    tfm.exec.chatMessage("<vb>"..nameW.."<rose> Won the Game!!</rose>")
    tfm.exec.giveCheese(nameW)
    tfm.exec.playerVictory(nameW)
    NewGame=true
    t=6
  end
  mice = mice - 1
end

function eventChatCommand(n,cmd) 
  if cmd == "skip" and n == "Turkitutu" then
    t=19
    NewGame=true
  end
  if cmd == "help" then
    eventTextAreaCallback(0,n,"help_open")
  end
  if adminRoom[n] then
    if cmd == "pw" then
      tfm.exec.setRoomPassword("")
      tfm.exec.chatMessage("Password disabled.")
    elseif cmd:sub(0,2) == "pw" then
      tfm.exec.setRoomPassword(cmd:sub(4))
      tfm.exec.chatMessage("[Password] : "..cmd:sub(4), n)
    elseif cmd == "skip" then
      t=19
      NewGame=true
    end
  end
end

tfm.exec.newGame(map)
