admin = {"Turkitutu"}

function Admin(name)
for i,admin in ipairs(admin) do
if name==admin then
return true
end
end
return false
end

Ground={[0]="Dirt",[1]="grass",[2]="glowstone",[3]="stone",[4]="OakWood"}

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disablePhysicalConsumables(true)

tfm.exec.addPhysicObject(1,400,200,{type=12, height=400, width=800, angle=0,color='0x271E17', friction=8, restitution=0, dynamic=false,foreground=true,miceCollision=false})
ui.addTextArea(1,"<font size='40'><font color='#C4C8C9'><a href='event:Play'><p align='center'>Play", name, 270, 215, 255, 55, 0x71716F,0x71716F, nil, 1)
ui.addTextArea(2,"<font size='30'><font color='#C4C8C9'><a href='event:about'><p align='center'>about", name, 270, 290, 120, 50, 0x71716F,0x71716F, nil, 1)
ui.addTextArea(3,"<font size='30'><font color='#C4C8C9'><a href='event:skins'><p align='center'>skins", name, 407, 290, 120, 50, 0x71716F,0x71716F, nil, 1)
ui.addTextArea(4,"<font size='100'><font color='#C4C8C9'><font='Impact'><p align='center'>Micecraft", name, 150, 50, 500, 110, 0x0, nil)

function Item(n)
ui.addTextArea(10, " <font size='9'></a>️<br><b> 40", n, 200, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.addTextArea(11, "", n, 245, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.addTextArea(12, "", n, 289, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.addTextArea(13, "", n, 334, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.addTextArea(14, "", n, 378, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.addTextArea(15, "", n, 422, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.addTextArea(16, "", n, 512, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
ui.addTextArea(17, "", n, 467, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
end

function SelectItem(n,id)
Item(n)
k=(id == 10 and 200 or id == 11 and 245 or id == 12 and 289 or id == 13 and 334 or id == 14 and 378 or id == 15 and 422 or id == 16 and 512 or id == 17 and 467)
ui.addTextArea(id, "", n, k, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
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
for n,k in pairs({1,2,3,4,5,6,7,8,666}) do
ui.removeTextArea(k, nil)
tfm.exec.removePhysicObject(1) 
Item(nil)
ui.addTextArea(18, "<font size='20'><a href='event:invintory'><p align='center'>...", nil, 556, 359, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
tfm.exec.addPhysicObject(19,218,373,{type=6, height=30, width=30, angle=0,color='0x271E17', friction=8, restitution=0, dynamic=false,foreground=true,miceCollision=false})
end
end
end
if callback=="invintory" then
ui.addTextArea(20, "", name, 200, 60, 394, 250, 0xCAC7C1, 0x000000, 1, true)
ui.addTextArea(21, "", name, 550, 124, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(22, "", name, 205, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(23, "", name, 205, 113, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(25, "", name, 205, 72, 30, 30, 0x8B8883, 0x383939, 1, true)
ui.addTextArea(26, "", name, 205, 72, 30, 30, 0x8b8883, 0x383939, 1, true)
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
ui.addTextArea(44, "", name, 251, 72, 90, 153, 0x000000, 0x0d0d0d, 1, true)
ui.addTextArea(45, "", name, 205, 113, 30, 30, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(46, "", name, 255, 267, 35, 35, 0x8b8883, 0x383939, 1, true)
ui.addTextArea(47, "", name, 205, 195, 30, 30, 0x8b8883, 0x383939, 1, true)
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

for name in pairs(tfm.get.room.playerList) do
for keys, k in pairs({49,50,51,52,53,54,55,56}) do
tfm.exec.bindKeyboard(name, k, true, true)
end
end
function eventKeyboard(name, key, down, x, y)
if key == 49 then
SelectItem(name,10)
elseif key == 50 then
SelectItem(name,11)
elseif key == 51 then
SelectItem(name,12)
elseif key == 52 then
SelectItem(name,13)
elseif key == 53 then
SelectItem(name,14)
elseif key == 54 then
SelectItem(name,15)
elseif key == 55 then
SelectItem(name,16)
elseif key == 56 then
SelectItem(name,17)
end
end


ui.addTextArea(666,"<font size='9'><font color='#C4C8C9'>version 1.0.0", nil, 730, 375, 150, 50, 0x0, nil, 1,true)