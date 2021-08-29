admin = {"Turkitutu"}
Ground={[0]="Dirt",[1]="grass",[2]="glowstone",[3]="stone",[4]="OakWood"}
data={}
ObjectsPhy={}
id_ob=0
wh_Object=40

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disablePhysicalConsumables(true)

function Admin(name)
for i,admin in ipairs(admin) do
if name==admin then
return true
end
end
return false
end

function addData(n)
data[n]={Object={dirt=62,TNT=10},si=0}
end

function n_item(n,type)
if type == 1 then
return " <font size='9'><br><b> "..data[n].Object.dirt.."</b></font>"
elseif  type == 3 then
return " <font size='9'><br><b> "..data[n].Object.TNT.."</b></font>"
else
return ""
end
end

function Item(n)
x=200
k=10
for i=1,8 do
ui.addTextArea(k, n_item(n,i), n, x, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
x=x+44
k=k+1
end
end

function SelectItem(n,id)
Item(n)
k=(id == 10 and 200 or id == 11 and 244 or id == 12 and 288 or id == 13 and 332 or id == 14 and 376 or id == 15 and 420 or id == 16 and 464 or id == 17 and 508)
i_text=(id == 10 and 1 or id == 11 and 2 or id == 12 and 3 or id == 13 and 4 or id == 14 and 5 or id == 16 and 6 or id == 17 and 7)
ui.addTextArea(id, n_item(n,i_text), n, k, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
data[n].si=id-10
end

function eventNewPlayer(n)
addData(n)
system.bindMouse(n,true)
for i,keys in pairs({49,50,51,52,53,54,55,56}) do
tfm.exec.bindKeyboard(n, keys, true, true)
end
Item(n)
SelectItem(n,10)
tfm.exec.addPhysicObject(-1,218,373,{type=6, height=30, width=30, angle=0,color='0x271E17', friction=8, restitution=0, dynamic=false,foreground=true,miceCollision=false})
end



tfm.exec.addPhysicObject(1,400,200,{type=12, height=400, width=800, angle=0,color='0x271E17', friction=8, restitution=0, dynamic=false,foreground=true,miceCollision=false})
ui.addTextArea(1,"<font size='40'><font color='#C4C8C9'><a href='event:Play'><p align='center'>Play", name, 270, 215, 255, 55, 0x71716F,0x71716F, nil, 1)
ui.addTextArea(2,"<font size='30'><font color='#C4C8C9'><a href='event:about'><p align='center'>about", name, 270, 290, 120, 50, 0x71716F,0x71716F, nil, 1)
ui.addTextArea(3,"<font size='30'><font color='#C4C8C9'><a href='event:skins'><p align='center'>skins", name, 407, 290, 120, 50, 0x71716F,0x71716F, nil, 1)
ui.addTextArea(4,"<font size='100'><font color='#C4C8C9'><font='Impact'><p align='center'>Micecraft", name, 150, 50, 500, 110, 0x0, nil)

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

function addTNT(id,x,y)
tfm.exec.addPhysicObject(id,x,y,{type=12, height=40, width=40, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,color="0xE61414",miceCollision=true})
ui.addTextArea(id+1000,"<font color='#000001' ><p align='center'>TNT",nil,x-15,y-7,30,15,12961221,12961221,1,false,false)
table.insert(ObjectsPhy, {x=x,y=y,i=id_ob,player=n,type="TNT",time=6,bl=false,namep=""})
tfm.exec.displayParticle(0, x,y, (math.random(30)-15)/5, (math.random(10)-5)/5, 0, 0)
end

function PhysicObject(n,x,y)
local yp = tfm.get.room.playerList[n].y
local xp = tfm.get.room.playerList[n].x
bl=true
    for i,p in pairs(ObjectsPhy) do
        if x == ObjectsPhy[i].x and y == ObjectsPhy[i].y then
            bl=false
	    end
    end
if (x > (xp-100) and x < (xp+100)) and (y > (yp-100) and y < (yp+100)) then
	if data[n].Object.dirt > 0 and bl and data[n].si == 0 then
		    tfm.exec.addPhysicObject(id_ob,x,y,{type=6, height=wh_Object, width=wh_Object, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,miceCollision=true})
	        table.insert(ObjectsPhy, {x=x,y=y,i=id_ob,player=n,type="dirt",time=6,bl=false,namep=""})
	        tfm.exec.displayParticle(0, x,y, (math.random(30)-15)/5, (math.random(10)-5)/5, 0, 0)
	        id_ob=id_ob+1
	        data[n].Object.dirt=data[n].Object.dirt-1
	        Item(n)
	        SelectItem(n,10)
	elseif data[n].Object.dirt > 2 and bl and data[n].si == 0 then
		    addTNT(id_ob,x,y)
            Item(n)
            SelectItem(n,3)
	        id_ob=id_ob+1
	        data[n].Object.TNT=data[n].Object.TNT-1

		
    end
	if data[n].si == 1 and not bl then
	    for i,p in pairs(ObjectsPhy) do
		    if x == ObjectsPhy[i].x and y == ObjectsPhy[i].y then
			    O=ObjectsPhy[i]
				if O.namep == "" then
			    if not O.bl then
			    if O.type == "dirt" then
                    O.bl = true
					O.namep = n
				end
				else
				--- شات مساج - يقوم شخصاً ما بهدم هذه القطعة بالفعل
				end
				--- شات مساج -- يجب عليك انتظار حتى يتم هدم القطعة الاخرى
				end
				if O.type == "TNT" then
				----
			    end
			end
		end
	end
else
------- شات مساج -- لا يمكن البناء من مسافة بعيدة
end
end

function eventMouse(n,posX,posY)
    PhysicObject(n,RML(posX),RML(posY))
end

function eventLoop (m,j)
    for i=1,#ObjectsPhy do
	    O=ObjectsPhy[i]
		if ObjectsPhy[i] ~= nil then
	    if O.bl and O.time >= 0 then
		    O.time=O.time-1
			DP(24,O.x,O.y)
		end
		if O.time == 0 and O.namep ~= "" then
		    if O.type == "dirt" then
			    data[O.namep].Object.dirt=data[O.namep].Object.dirt+1
	            Item(O.namep)
                tfm.exec.removePhysicObject(O.i)
	            SelectItem(O.namep,data[O.namep].si+10)
		        DP(24,O.x,O.y)
		        removeObTable(i)
			elseif O.type == "TNT" then
			    data[O.namep].Object.dirt=data[O.namep].Object.dirt+1
	            Item(O.namep)
                tfm.exec.removePhysicObject(O.i)
	            SelectItem(O.namep,data[O.namep].si+12)
		        DP(24,O.x,O.y)
		        removeObTable(i)
			end
		end
		end
	end
end

function eventTextAreaCallback(id,name,callback)
if callback=="skins" then
ui.addTextArea(1,"<font size='30'><font color='#C4C8C9'><a href='event:Return'><p align='center'>Return to menu", name, 270, 350, 255, 40, 0x71716F,0x71716F,1,true)
ui.addTextArea(2,"<font size='30'><font color='#C4C8C9'>Steve", name, 200, 100, 100, 100, 0x0, name, 1)
ui.addTextArea(3,"<font size='30'><font color='#C4C8C9'> Alex", name, 500, 100, 100, 100, 0x0, name, 1)
ui.addTextArea(4,"<font size='80'><font color='#C4C8C9'><font='Impact'><p align='center'>Skins", name, 150, 20, 500, 200, 0x0, name)
ui.addTextArea(5,"<font size='30'><font color='#C4C8C9'>", name, 165, 150, 150, 175, 0x71716F,0x71716F,1,true)
ui.addTextArea(6,"<font size='30'><font color='#C4C8C9'>", name, 465, 150, 150, 175, 0x71716F,0x71716F,1,true)
end
if callback=="Return" then
ui.addTextArea(1,"<font size='40'><font color='#C4C8C9'><a href='event:Play'><p align='center'>Play", name, 270, 215, 255, 55, 0x71716F,0x71716F, nil, 1)
ui.addTextArea(2,"<font size='30'><font color='#C4C8C9'><a href='event:about'><p align='center'>about", name, 270, 290, 120, 50, 0x71716F,0x71716F, nil, 1)
ui.addTextArea(3,"<font size='30'><font color='#C4C8C9'><a href='event:skins'><p align='center'>skins", name, 407, 290, 120, 50, 0x71716F,0x71716F, nil, 1)
ui.addTextArea(4,"<font size='100'><font color='#C4C8C9'><font='Impact'><p align='center'>Micecraft", name, 150, 50, 500, 110, 0x0, nil)
ui.removeTextArea(5,name)
ui.removeTextArea(6,name)
end
if callback=="about" then
ui.addTextArea(1,"<font size='30'><font color='#C4C8C9'><a href='event:Return'><p align='center'>Return to menu", name, 270, 350, 255, 40, 0x71716F,0x71716F,1,true)
ui.addTextArea(2,"<font size='10'><font color='#C4C8C9'>", name, 200, 150, 400, 175, 0xB2AFAA,0xB2AFAA,1,true)
ui.addTextArea(4,"<font size='90'><font color='#C4C8C9'><font='Impact'><p align='center'>about", name, 150, 30, 500, 100, 0x0, nil)
ui.removeTextArea(3,name)
end
if callback=="Play" then
if Admin(name) then
for n,p in pairs(tfm.get.room.playerList) do
eventNewPlayer(n)
end
for n,k in pairs({1,2,3,4,5,6,7,8,666}) do
ui.removeTextArea(k, nil)
tfm.exec.removePhysicObject(1) 
ui.addTextArea(18, "<font size='20'><a href='event:invintory'><p align='center'>...", nil, 556, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
end
end
end
if callback=="invintory" then
ui.addTextArea(20, "", name, 200, 60, 394, 250, 0xCAC7C1, 0x000000, 1, true)
ui.addTextArea(21, "", name, 550, 124, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(22, "", name, 205, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(23, "", name, 205, 113, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(25, "", name, 205, 72, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(27, "", name, 400, 102, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(28, "", name, 205, 195, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(29, "", name, 205, 154, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(30, "", name, 251, 72, 90, 153, 0x000000, 0x0d0d0d, 1, true)
ui.addTextArea(30, "<font size='25'><font color='#414141'>Crafting", name, 389, 63, 115, 38, 0xCAC7C1, 0xCAC7C1, 1, true)
ui.addTextArea(31, "", name, 205, 154, 30, 30, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(32, "", name, 255, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(33, "", name, 450, 150, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(34, "", name, 400, 150, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(35, "", name, 450, 102, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(36, "", name, 205, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(37, "", name, 550, 124, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(38, "", name, 400, 102, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(39, "", name, 455, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(40, "", name, 405, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(41, "", name, 355, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(42, "", name, 305, 267, 35, 35, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(43, "", name, 450, 150, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(45, "", name, 205, 113, 30, 30, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(46, "", name, 255, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(48, "", name, 355, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(49, "", name, 400, 150, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(50, "", name, 450, 102, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(51, "", name, 305, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(52, "", name, 405, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(53, "", name, 455, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(54, "", name, 503, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(55, "", name, 552, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(56, "<font size='20'><a href='event:uninvintory'><p align='center'>...", name, 556, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.removeTextArea(18, name)
end
if callback=="uninvintory" then 
for n,k in pairs({20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56}) do
ui.removeTextArea(k, name)
ui.addTextArea(18, "<font size='20'><a href='event:invintory'><p align='center'>...", name, 556, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
end
end
end

function eventKeyboard(name, key, down, x, y)
    if key >= 49 and key <= 56 then
        SelectItem(name,key-39)
    end
end


ui.addTextArea(666,"<font size='9'><font color='#C4C8C9'>version 1.0.0", nil, 730, 375, 150, 50, 0x0, nil, 1,true)


--1593c276aa5.png