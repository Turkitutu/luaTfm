testing = false
if tfm.get.room.name:sub(3) == "Let Us Alone" then
testing = true
tfm.exec.chatMessage=print
end

add=ui.addTextArea
random = math.random
admin = {Turkitutu=true}
data={}
SLOT={}
ObjectsPhy={}
id_ob=0
id_Piece=0
wh_Object=40
ids={}
ids["nil"]={}
ids_P={}
piece={}
impi={"15cd2233748.png","15cd2234e5b.png","15cd22367da.png"}

TuS="<ch>"
for i=1,8 do
    TuS=TuS.."<a href='event:UseS_"..i.."'>key "..i.."</a>\n\n"
end

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.newGame(7087918)


function addData(n)
data[n]={Object={dirt=50,TNT=5,Torch=true,Pickaxe=true},pieces={[1]=0,[2]=0,[3]=0},si="dirt",key=1,AMR=nil,hearth={p=6,t=0},mouse={x=6,y=0}}
SLOT[n]={["s1"]="dirt",["s2"]="TNT",["s3"]="pickaxe",["s4"]="torch",["s5"]="nil",["s6"]="nil",["s7"]="nil",["s8"]="nil"}
end

function n_item(n,type)
local text = ""
if type == "dirt" then
text = data[n].Object.dirt.."/64"
elseif  type == "TNT" then
text = data[n].Object.TNT.."/5"
end
return text
end


function ImgIco(n)
pssX={330,246,202,290}
pssY={359,364,364,365}
imgPss={["dirt"]="15aeda62ab7.png",["TNT"]="15aeda65421.png",["pickaxe"]="15af19e8cd2.png",["torch"]="15af19ee5ae.png",}
for i=1,4 do
if ids[n][i] ~= nil then
tfm.exec.removeImage(ids[n][i])
ids[n][i]=nil
end
if SLOT[n]["s"..i] ~= nil then
ids[n][i] = tfm.exec.addImage(imgPss[SLOT[n]["s"..i]], "&1", pssX[i], pssY[i], n)
end
end
end

function Item(n)
x=200
for i=1,8 do
add(i,(testing and "<p align='center'>\n<font size='9'>"..SLOT[n]["s"..i].."" or ""), n, x, 364, 35, 35, 0x545454, 0x8B8C7E, 0.5, true)
x=x+44
end
add(9, "<a href='event:open_shop'><p align='center'>Shop", n, 556, 380, 40, 35, 0x545454, 0x8B8C7E, 0.5, true)
add(10, "<a href='event:open_profile'><p align='center'>Profile", n, 147, 380, 40, 35, 0x545454, 0x8B8C7E, 0.5, true)
end 

function SelectItem(n,id)
Item(n)
k={200,244,288,332,376,420,464,508}
add(id, (testing and "<p align='center'>\n<font size='9'>"..SLOT[n]["s"..id].."" or ""), n, k[id], 364, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
data[n].si=SLOT[n]["s"..id]
ImgIco(n)
x=200
for i=1,8 do
add(i+100, "<p align='center'><font size='8'><b><v>"..n_item(n,SLOT[n]["s"..i]), n, x, 352, 35, 20, 0x545454, 0x8b8c7e, 0, true)
x=x+44
end
end


function eventNewPlayer(n)
tfm.exec.respawnPlayer (n)
if data[n] == nil then
addData(n)
end
ids[n]={}
system.bindMouse(n,true)
for i,keys in pairs({49,50,51,52,53,54,55,56,32}) do
tfm.exec.bindKeyboard(n, keys, true, true)
end
SelectItem(n,data[n].key)
    for i,p in pairs(ObjectsPhy) do
	    O=ObjectsPhy[i]
		if O ~= nil then
            RefreshOP(O.i,(O.type == "dirt" and 1 or O.type == "TNT" and 2),O.x,O.y)
		end
    end
tfm.exec.chatMessage("<vp>[MiceCraft]</vp> <font color='#009AFF'> Welcome to MiceCraft :D</font>",n)
end

table.foreach(tfm.get.room.playerList,eventNewPlayer)

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
	tfm.exec.displayParticle(id, x,y, (random(30)-15)/5, (random(10)-5)/5, 0, 0)
end
end

function RefreshOP(id,j,x,y)
t={6,12}
tp={"dirt","TNT"}
dp={0,13}
if j == 2 then
add(id+1000,"<font color='#000001' ><p align='center'>TNT",nil,x-15,y-7,30,15,12961221,12961221,1,false,false)
end
tfm.exec.addPhysicObject(id,x,y,{type=t[j], height=wh_Object, width=wh_Object, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,color="0xE61414",miceCollision=true})
end

function addOP(id,j,x,y,n)
t={6,12}
tp={"dirt","TNT"}
dp={0,13}
if j == 2 then
add(id+1000,"<font color='#000001' ><p align='center'>TNT",nil,x-15,y-7,30,15,12961221,12961221,1,false,false)
end
tfm.exec.addPhysicObject(id,x,y,{type=t[j], height=wh_Object, width=wh_Object, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,color="0xE61414",miceCollision=true})
table.insert(ObjectsPhy,{x=x,y=y,i=id,player=n,type=tp[j],typei=nil,time=0,bl=false,namep=""})
tfm.exec.displayParticle(dp[j],x,y, (random(30)-15)/5, (random(10)-5)/5, 0, 0)
SelectItem(n,data[n].key)
end




function eventMouse(n,posX,posY)
data[n].mouse.x,data[n].mouse.y=posX,poxY
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
	
if (posX > (xp-100) and posX < (xp+100)) and (posY > (yp-100) and posY < (yp+100)) then
    if data[n].si == "dirt" then
        if data[n].Object.dirt > 0 and bl then
			data[n].Object.dirt=data[n].Object.dirt-1
            addOP(id_ob,1,X,Y,n)
            id_ob=id_ob+1
        end
	elseif data[n].si == "pickaxe" then
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
	elseif data[n].si == "TNT" then
        if data[n].Object.TNT > 0 and bl then
			data[n].Object.TNT=data[n].Object.TNT-1
            addOP(id_ob,2,X,Y,n)
            id_ob=id_ob+1
        end
	elseif data[n].si == "torch" then
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
else 
tfm.exec.chatMessage("<j>[MiceCraft]</j><r> You can't use this tool far away.</r>",n)
end
end

function ShowPiece(type,x,y)
    local a,iPiece=nil,nil
    if type == "dirt" then
        a = random(1,100)
        if a >= 35 and a <= 59 then iPiece = 1     -- 24%
        elseif a >= 60 and a <= 72 then iPiece = 2 -- 12%
        elseif a >= 75 and a <= 80 then iPiece = 3 -- 5%
        else iPiece = 0 end		
    elseif type == "TNT" then
        a = random(1,100)
        if a >= 45 and a <= 60 then iPiece = 1     -- 15%
        elseif a >= 69 and a <= 80 then iPiece = 2 -- 11%
        elseif a >= 83 and a <= 90 then iPiece = 3 -- 7%
        else iPiece = 0 end			
    end
    if iPiece ~= 0 then
	    id_Piece=id_Piece+1
        table.insert(piece,{x=x,y=y,i=id_Piece,type=iPiece})
        if testing then add(id_Piece+10000000000,"",nil,x,y,5,5,(iPiece == 1 and "0x090909" or iPiece == 2 and "0x50FF00" or iPiece == 3 and "0x00BEFF"),1,1,false,false) end
		ids_P[id_Piece] = tfm.exec.addImage(impi[iPiece],'!1',x-5,y-5)
    end
end

function removeOP(id)
    for i=1,#ObjectsPhy do
	    O=ObjectsPhy[i]
		if O ~= nil then
			if O.i == id then
			    tfm.exec.removePhysicObject(id)
				ShowPiece(O.type,O.x,O.y)
			    table.remove(ObjectsPhy,i)
				ui.removeTextArea(id+1000,nil)
				break
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

function eventLoop(m,j)
    for i=1,#ObjectsPhy do
	    O=ObjectsPhy[i]
		if O ~= nil then
	    if O.bl and O.time > 0 then
		        O.time=O.time-1
		    if O.type == "dirt" and O.typei == 1 then DP(24,O.x,O.y)
			elseif O.type == "TNT" and O.typei == 1 then tfm.exec.displayParticle(13,O.x,O.y, (random(30)-15)/5, (random(10)-5)/5, 0, 0)
			elseif O.type == "TNT" and O.typei == 2 then DP(21,O.x,O.y)
			end
		end
		if O.time == 0 and O.namep ~= "" then
		    if O.type == "dirt" then
			    if data[O.namep].Object.dirt < 62 then
			        data[O.namep].Object.dirt=data[O.namep].Object.dirt+1
				end
	            SelectItem(O.namep,data[O.namep].key)
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
				    	tfm.exec.explosion (O.x+20, O.y+20, 20, 150, false)
			    	end
			        if data[O.namep].Object.TNT < 5 then
			            data[O.namep].Object.TNT=data[O.namep].Object.TNT+1
			    	end
	                SelectItem(O.namep,data[O.namep].key)
			    	DP(10,O.x,O.y)
		            DP(3,O.x,O.y)
                    data[O.namep].Object.Torch=true
                    removeOP(O.i)
			   	elseif O.typei == 2 then
			        if data[O.namep].Object.TNT < 62 then
			            data[O.namep].Object.TNT=data[O.namep].Object.TNT+1
			    	end
	                SelectItem(O.namep,data[O.namep].key)
		            DP(21,O.x,O.y)
                    data[O.namep].Object.Pickaxe=true
                    removeOP(O.i)
			   	end
			end
		end
		end
	end
end

function open_shop(n,id)
    if id == 1 then
        tu.create.shop(1,1,"",data[n].Object.dirt.."/64","<a href='event:UseO_dirt'>Use</a>  -  Buy","",data[n].Object.TNT.."/5","<a href='event:UseO_TNT'>Use</a>  -  Buy","","?/?","???  -  ???",n,250,80,true,true) 
	elseif id == 2 then
        tu.create.shop(1,2,"","?/?","<a href='event:UseO_pickaxe'>Use</a>  -  Buy","","?/?","???","","?/?","???",n,250,80,true,true) 
	elseif id == 3 then
        tu.create.shop(1,3,"","?/?","<a href='event:UseO_torch'>Use</a>  -  Buy","","?/?","???","","?/?","???",n,250,80,true,true) 
	end
end

function eventTextAreaCallback(id,n,event)
tu.remove.shop(id,n,event);
if event=="open_shop" then 
	open_shop(n,1)
elseif event == "open_profile" then
	tfm.exec.chatMessage("<j>Not available :(</j>",n)
elseif event == "shop_Tapic_1" then
	open_shop(n,1)
elseif event == "shop_Tapic_2" then
	open_shop(n,2)
elseif event == "shop_Tapic_3" then
	open_shop(n,3)
end
if event:sub(0,5) == "UseO_" then
    data[n].AMR=event:sub(6)
    add(60, TuS, n, 387, 103, 32, 200, 0x383939, 0x0d0d0d, 1, true)
elseif event:sub(0,5) == "UseS_" then
    for i,p in pairs (SLOT[n]) do
        if p == data[n].AMR then
		    SLOT[n][i]= "nil"
			break
		end
    end
    SLOT[n]["s"..tonumber(event:sub(6))] = data[n].AMR
    ui.removeTextArea(60,n)
    data[n].AMR = nil
    data[n].key = tonumber(event:sub(6))
	SelectItem(n,tonumber(event:sub(6)))
end
end

function eventKeyboard(name, key, down, xp, yp)
    if key >= 49 and key <= 56 then
        SelectItem(name,key-48)
        data[name].key=key-48
    end
    if key == 32 then
	    for i=1,#piece do
            t = piece[i]
            if t ~= nil then
			    if (xp > (t.x-15)) and (xp < (t.x+15)) and (yp > (t.y-15)) and (yp < (t.y+15)) then
			        if testing then ui.removeTextArea(t.i+10000000000,nil) end
                    data[name].pieces[t.type] = data[name].pieces[t.type] + 1
                    tfm.exec.removeImage(ids_P[t.i])
                    table.remove(piece,i)
			    end
			end
		end 
    end
end

tu = {
    create = {
        p = {},
            shop = function(id,s, text1,m1,bt1,text2,m2,bt2,text3,m3,bt3,n,x,y,U1,U2)
            add(9 ..id.. 40 .. 200,""..(s == 1 and "" or "<a href='event:shop_Tapic_1'>").."<p align='center'>Blocks",n,x+3,y-(s == 1 and 27 or 22),50,50,(s == 1 and 6776420 or 9144451),3684665,1,true)
            add(9 ..id.. 40 .. 201,""..(s == 2 and "" or "<a href='event:shop_Tapic_2'>").."<p align='center'>Pickaxes",n,x+61,y-(s == 2 and 27 or 22),50,50,(s == 2 and 6776420 or 9144451),3684665,1,true)
            add(9 ..id.. 40 .. 202,""..(s == 3 and "" or "<a href='event:shop_Tapic_3'>").."<p align='center'>Torchs",n,x+119,y-(s == 3 and 27 or 22),50,50,(s == 3 and 6776420 or 9144451),3684665,1,true)
            add(9 ..id.. 40 .. 203,"           <a href='event:shopClose_".. 9 ..id.. 40 .."'>X</a>",n,x+279,y+11,50,20,9144451,3684665,1,true)
            add(9 ..id.. 40 .. 204,"",n,x,y,300,250,9144451,3684665,1,true)
            add(9 ..id.. 40 .. 205, "<p align='right'><t>\n"..data[n].pieces[1].."\n\n"..data[n].pieces[2].."\n\n"..data[n].pieces[3].."", n, x+238, y-1, 39, 100, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 206,"Previous",n,x+13,y+228,50,20,-1,9144451,0,true)
            add(9 ..id.. 40 .. 207,"Next",n,x+253,y+228,30,20,-1,9144451,1,true)
            add(9 ..id.. 40 .. 208,text1,n,x+82,y+43,110,37,6776420,6776420,1,true)
            add(9 ..id.. 40 .. 209,"",n,x+33,y+38,47,47,6776420,5592146,1,true)
            add(9 ..id.. 40 .. 210,text2,n,x+156,y+105,110,37,6776420,6776420,1,true)
            add(9 ..id.. 40 .. 211,"",n,x+113,y+100,47,47,6776420,5592146,1,true)
            add(9 ..id.. 40 .. 212,text3,n,x+82,y+167,110,37,6776420,6776420,1,true)
            add(9 ..id.. 40 .. 213,"",n,x+33,y+162,47,47,6776420,5592146,1,true)
            add(9 ..id.. 40 .. 214, "<p align='center'>"..m1, n, x+31, y+74, 50, 19, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 215, "<p align='center'>"..m2, n, x+111, y+136, 50, 19, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 216, "<p align='center'>"..m3, n, x+31, y+198, 50, 19, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 217, "<p align='center'>"..bt1, n, x+90, y+67, 100, 27, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 218, "<p align='center'>"..bt2, n, x+168, y+130, 100, 27, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 219, "<p align='center'>"..bt3, n, x+90, y+192, 100, 27, 0x324650, 0x000000, 0, true)
            ids[n][10] = tfm.exec.addImage(impi[1], "&1", 528, 97, n) 
            ids[n][11] = tfm.exec.addImage(impi[2], "&2", 529, 121, n)
            ids[n][12] = tfm.exec.addImage(impi[3], "&3", 528, 147, n)
            tu.create.p[tostring("9"..id.."40")] = 9 ..id.. 40; end,
            remove = function(id, n)
            for k=200,219 do
                ui.removeTextArea(tu.create.p[id] .. k, n);
			end 
            ui.removeTextArea(tu.create.p[id] .. 40, n);
            ui.removeTextArea(60, n);
            for s, k in pairs({10,11,12}) do
                tfm.exec.removeImage(ids[n][k]);
			end end,
			},
    remove = {
        shop = function(Id, name, callback)
            if string.sub(callback, 0, 10) == "shopClose_"  then
                tu.create.remove(callback:sub(11), name);
            end end ;}
	}
			


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



add(1, "", nil, 200, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
add(2, "", nil, 244, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
add(3, "", nil, 288, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)
add(4, "", nil, 332, 359, 35, 35, 0x898989, 0xFBFBFB, 0.5, true)

tfm.exec.addImage("15aeda62ab7.png", "&1", 330, 359, nil) -- شعلة
tfm.exec.addImage("15aeda65421.png", "&2", 246, 364, nil) -- فأس
tfm.exec.addImage("15af19e8cd2.png", "&3", 202, 364, nil) -- عشب
tfm.exec.addImage("15af19ee5ae.png", "&4", 290, 364, nil) -- TNT


---- قلوب
tfm.exec.addImage("1593c276aa5.png", "&1", 198, 337, nil)
tfm.exec.addImage("1593c276aa5.png", "&2", 217, 337, nil)
tfm.exec.addImage("1593c276aa5.png", "&3", 236, 337, nil)
tfm.exec.addImage("1593c276aa5.png", "&4", 255, 337, nil)
tfm.exec.addImage("1593c276aa5.png", "&5", 274, 337, nil)
tfm.exec.addImage("1593c276aa5.png", "&6", 293, 337, nil)


--]]

function hearths_img(n,number)

end

---https://pastebin.com/u6DXe2vi

