tfm.exec.chatMessage=print
admin = {Turkitutu=true}
data={}
ObjectsPhy={}
id_ob=0
wh_Object=40
imgIcon={}
Ico1,Ico2,Ico3,Ico4={},{},{},{}

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.setRoomMaxPlayers(15)
tfm.exec.newGame(7087918)


function addData(n)
data[n]={Object={dirt=50,TNT=22,Torch=true,Pickaxe=true},si=1,hearth={p=6,t=0}}
end

function n_item(n,type)
if type == 1 then
return "<p align='center'><font size='9'><br><b> "..data[n].Object.dirt.."</b></font>"
elseif  type == 3 then
return "<p align='center'><font size='9'><br><b> "..data[n].Object.TNT.."</b></font>"
else
return ""
end
end


function ImgIco(n)
tfm.exec.removeImage(Ico1[n])
Ico1[n] = tfm.exec.addImage("15aeda62ab7.png", "!999", 330, 359, n) 
tfm.exec.removeImage(Ico2[n])
Ico2[n] = tfm.exec.addImage("15aeda65421.png", "!999", 246, 364, n)
tfm.exec.removeImage(Ico3[n])
Ico3[n] = tfm.exec.addImage("15af19e8cd2.png", "!999", 202, 364, n)
tfm.exec.removeImage(Ico4[n])
Ico4[n] = tfm.exec.addImage("15af19ee5ae.png", "!999", 290, 364, n)
end

function Item(n)
x=200
for i=1,8 do
ui.addTextArea(i,"", n, x, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.addTextArea(i+100, "<v>"..n_item(n,i), n, x, 359, 35, 35, 0x545454, 0x8B8C7E, 0.0, true,false)
x=x+44
end
ui.addTextArea(9, "<font size='20'><a href='event:inventory'><p align='center'>...", n, 556, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
end 

function SelectItem(n,id)
Item(n)
k={200,244,288,332,376,420,464,508}
ui.addTextArea(id, "", n, k[id], 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
data[n].si=id
ImgIco(n)
end


function eventNewPlayer(n)
tfm.exec.respawnPlayer (n)
imgIcon={}
if data[n] == nil then
addData(n)
end
system.bindMouse(n,true)
for i,keys in pairs({49,50,51,52,53,54,55,56}) do
tfm.exec.bindKeyboard(n, keys, true, true)
end
tfm.exec.addImage("15aeda62ab7.png", "!999", 330, 359, n) 
tfm.exec.addImage("15aeda65421.png", "!999", 246, 364, n)
tfm.exec.addImage("15af19e8cd2.png", "!999", 202, 364, n)
tfm.exec.addImage("15af19ee5ae.png", "!999", 290, 364, n)
SelectItem(n,1)
    for i,p in pairs(ObjectsPhy) do
	    O=ObjectsPhy[i]
		if O ~= nil then
            RefreshOP(O.i,(O.type == "dirt" and 1 or O.type == "TNT" and 2),O.x,O.y)
		end
    end
tfm.exec.chatMessage("<vp>[MiceCraft]</vp> <font color='#009AFF'> Welcome to MiceCraft :D</font>",n)
end

for n,p in pairs(tfm.get.room.playerList) do
eventNewPlayer(n)
end

function eventNewGame()

end

function RML(x)
c = math.floor(x/wh_Object)
d = wh_Object*c
e = x-d
f = wh_Object-e
if e >= wh_Object/2 then
return x+f-(wh_Object/2)
elseif e < wh_Object/2 then
return x-e+(wh_Object/2)
end
end

function removeObTable(i)
table.remove(ObjectsPhy,i)
end

function DP(id,x,y)
for i=1, 20 do
	tfm.exec.displayParticle(id, x,y, (math.random(30)-15)/5, (math.random(10)-5)/5, 0, 0)
end
end

function RefreshOP(id,j,x,y)
t={6,12}
tp={"dirt","TNT"}
dp={0,13}
if j == 2 then
ui.addTextArea(id+1000,"<font color='#000001' ><p align='center'>TNT",nil,x-15,y-7,30,15,12961221,12961221,1,false,false)
end
tfm.exec.addPhysicObject(id,x,y,{type=t[j], height=wh_Object, width=wh_Object, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,color="0xE61414",miceCollision=true})
end

function addOP(id,j,x,y,n)
t={6,12}
tp={"dirt","TNT"}
dp={0,13}
if j == 2 then
ui.addTextArea(id+1000,"<font color='#000001' ><p align='center'>TNT",nil,x-15,y-7,30,15,12961221,12961221,1,false,false)
end
tfm.exec.addPhysicObject(id,x,y,{type=t[j], height=wh_Object, width=wh_Object, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,color="0xE61414",miceCollision=true})
table.insert(ObjectsPhy, {x=x,y=y,i=id,player=n,type=tp[j],typei=nil,time=0,bl=false,namep=""})
tfm.exec.displayParticle(dp[j],x,y, (math.random(30)-15)/5, (math.random(10)-5)/5, 0, 0)
SelectItem(n,data[n].si)
end




function eventMouse(n,posX,posY)
X=RML(posX)
Y=RML(posY)
local yp = tfm.get.room.playerList[n].y
local xp = tfm.get.room.playerList[n].x
local bl=true
    for i,p in pairs(ObjectsPhy) do
        if X == ObjectsPhy[i].x and Y == ObjectsPhy[i].y then
            bl=false
	    end
    end
	
--if (posX > (xp-100) and posX < (xp+100)) and (posY > (yp-100) and posY < (yp+100)) then
    if data[n].si == 1 then
        if data[n].Object.dirt > 0 and bl then
			data[n].Object.dirt=data[n].Object.dirt-1
            addOP(id_ob,1,X,Y,n)
            id_ob=id_ob+1
        end
	elseif data[n].si == 2 then
	    if not bl then
	        for i,p in pairs(ObjectsPhy) do
		        if X == ObjectsPhy[i].x and Y == ObjectsPhy[i].y then
			        O=ObjectsPhy[i]
						if O.namep == "" and not O.bl then
						    if data[n].Object.Pickaxe then
						        if O.type == "dirt" then
							        O.time=6
                                    O.bl = true
					                O.namep = n
							    	O.typei=1
							    	data[n].Object.Pickaxe=false
						    	elseif O.type == "TNT" then
							        O.time=10
                                    O.bl = true
					                O.namep = n
							    	O.typei=2
							    	data[n].Object.Pickaxe=false
						    	end
							else
							    tfm.exec.chatMessage("<j>[MiceCraft]</j><r> You must to wait until the first ground is destroyed.</r>",n)
							end
						end
				end
			end
		end
	elseif data[n].si == 3 then
        if data[n].Object.TNT > 0 and bl then
			data[n].Object.TNT=data[n].Object.TNT-1
            addOP(id_ob,2,X,Y,n)
            id_ob=id_ob+1
        end
	elseif data[n].si == 4 then
	    if not bl then
	        for i,p in pairs(ObjectsPhy) do
		        if X == ObjectsPhy[i].x and Y == ObjectsPhy[i].y then
			        O=ObjectsPhy[i]
						if O.namep == "" and not O.bl and O.type == "TNT" then
						    if data[n].Object.Torch then
							    O.time=8
                                O.bl = true
					            O.namep = n
							    O.typei=1
								data[n].Object.Torch=false
							else
								tfm.exec.chatMessage("<j>[MiceCraft]</j><r> you must to wait until the TNT explode.</r>",n)
							end
						end
				end
			end
		end
    end
--else 
--tfm.exec.chatMessage("<j>[MiceCraft]</j><r> You can't use this tool far away.</r>",n)
--end
end

function removeOP(id)
    for i=1,#ObjectsPhy do
	    O=ObjectsPhy[i]
		if O ~= nil then
			if O.i == id then
			    tfm.exec.removePhysicObject(id)
			    table.remove(ObjectsPhy,i)
				ui.removeTextArea(id+1000,nil)
			end
		end
    end
end

function ATAV(x1,y1,x2,y2)
    k={0,40}
	local a=false
	local b=false
    for i=1,#k do
	    if x2 == x1+k[i] or x2 == x1-k[i] then a=true end
		if y2 == y1+k[i] or y2 == y1-k[i] then b=true end
	end
	if a and b then
	return true
	else
	return false
	end
end

function eventLoop (m,j)
    for i=1,#ObjectsPhy do
	    O=ObjectsPhy[i]
		if O ~= nil then
	    if O.bl and O.time > 0 then
		        O.time=O.time-1
		    if O.type == "dirt" and O.typei == 1 then DP(24,O.x,O.y)
			elseif O.type == "TNT" and O.typei == 1 then tfm.exec.displayParticle(13,O.x,O.y, (math.random(30)-15)/5, (math.random(10)-5)/5, 0, 0)
			elseif O.type == "TNT" and O.typei == 2 then DP(21,O.x,O.y)
			end
		end
		if O.time == 0 and O.namep ~= "" then
		    if O.type == "dirt" then
			    if data[O.namep].Object.dirt < 62 then
			        data[O.namep].Object.dirt=data[O.namep].Object.dirt+1
				end
	            SelectItem(O.namep,data[O.namep].si)
		        DP(24,O.x,O.y)
                data[O.namep].Object.Pickaxe=true
                removeOP(O.i)
			elseif O.type == "TNT" then
			    if O.typei == 1 then
				    for Y=1,#ObjectsPhy do
	                    V=ObjectsPhy[Y]
						--if ATAV(O.x,O.y,V.x,V.y) then
						if (V.x == O.x+40 and V.y == O.y) or (V.x == O.x-40 and V.y == O.y) or (V.x == O.x and V.y == O.y+40) or (V.x == O.x and V.y == O.y-40) then
					        if V.type == "dirt" then
					            DP(24,V.x,V.y)
                                V.time=0 
                                V.bl = true 
					            V.namep = O.namep 
								V.typei = 1
					    	elseif V.type == "TNT" then 
					    		V.time=0
                                V.bl = true
					            V.namep = O.namep
								V.typei = 1
					    	end
					    end
				    	for na,pp in pairs(tfm.get.room.playerList) do 
					        if (pp.x > O.x-70) and (pp.x < O.x+70) and (pp.y > O.y-70) and (pp.y < O.y+70) then
					    	    tfm.exec.killPlayer(na)
					    	end
				    	end
			    	end
			        if data[O.namep].Object.TNT < 32 then
			            data[O.namep].Object.TNT=data[O.namep].Object.TNT+1
			    	end
	                SelectItem(O.namep,data[O.namep].si)
			    	DP(10,O.x,O.y)
		            DP(3,O.x,O.y)
                    data[O.namep].Object.Torch=true
                    removeOP(O.i)
			   	elseif O.typei == 2 then
			        if data[O.namep].Object.TNT < 62 then
			            data[O.namep].Object.TNT=data[O.namep].Object.TNT+1
			    	end
	                SelectItem(O.namep,data[O.namep].si)
		            DP(21,O.x,O.y)
                    data[O.namep].Object.Pickaxe=true
                    removeOP(O.i)
			   	end
			end
		end
		end
	end
end

function eventTextAreaCallback(id,name,callback) -- تم
if callback=="inventory" then 
--[[
ui.addTextArea(10, "", name, 200, 60, 394, 250, 0xCAC7C1, 0x000000, 1, true)
ui.addTextArea(11, "", name, 550, 124, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(12, "", name, 205, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(13, "", name, 205, 113, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(14, "", name, 205, 72, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(15, "", name, 400, 102, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(16, "", name, 205, 195, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(17, "", name, 205, 154, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(18, "", name, 251, 72, 90, 153, 0x000000, 0x0d0d0d, 1, true)
ui.addTextArea(19, "<font size='25'><font color='#414141'>Crafting", name, 389, 63, 115, 38, 0xCAC7C1, 0xCAC7C1, 1, true)
ui.addTextArea(20, "", name, 205, 154, 30, 30, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(21, "", name, 255, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(22, "", name, 450, 150, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(23, "", name, 400, 150, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(24, "", name, 450, 102, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(25, "", name, 205, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(26, "", name, 550, 124, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(27, "", name, 400, 102, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(28, "", name, 455, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(29, "", name, 405, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(30, "", name, 355, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(31, "", name, 305, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(32, "", name, 450, 150, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(33, "", name, 205, 113, 30, 30, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(34, "", name, 255, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(35, "", name, 355, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(36, "", name, 400, 150, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(37, "", name, 450, 102, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(38, "", name, 305, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(39, "", name, 405, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(40, "", name, 455, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(41, "", name, 503, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(42, "", name, 552, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(43, "<font size='20'><a href='event:uninventory'><p align='center'>...", name, 556, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.removeTextArea(9, name)
--]]
tfm.exec.chatMessage("Not available :(",n)
elseif callback=="uninventory" then 
for i=10,43 do
ui.removeTextArea(i,name)
end
ui.addTextArea(9, "<font size='20'><a href='event:inventory'><p align='center'>...", name, 556, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
end
end

function eventKeyboard(name, key, down, x, y)
    if key >= 49 and key <= 56 then
        SelectItem(name,key-48)
    end
end

function eventPlayerDied(n)
--if data[n].hearth.p > 0 then
tfm.exec.respawnPlayer(n)
--data[n].hearth=data[n].hearth.p-1
--end
end


--[[
--http://images.atelier801.com/1593c276aa5.png  --قلب


--http://images.atelier801.com/15aeda62ab7.png
--http://images.atelier801.com/15aeda65421.png
--http://images.atelier801.com/15af19ee5ae.png
--http://images.atelier801.com/15af19e8cd2.png



ui.addTextArea(1, "", nil, 200, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
ui.addTextArea(2, "", nil, 244, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
ui.addTextArea(3, "", nil, 288, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
ui.addTextArea(4, "", nil, 332, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)

tfm.exec.addImage("15aeda62ab7.png", "&1", 330, 359, nil) -- شعلة
tfm.exec.addImage("15aeda65421.png", "&2", 246, 364, nil) -- فأس
tfm.exec.addImage("15af19e8cd2.png", "&3", 202, 364, nil) -- عشب
tfm.exec.addImage("15af19ee5ae.png", "&4", 290, 364, nil) -- TNT



--]]
