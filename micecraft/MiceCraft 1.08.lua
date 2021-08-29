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
maxO={["Grass"]=64,["dirt"]=64,["TNT"]=5}
TypeO={["Grass"]=6,["dirt"]=5,["TNT"]=12}
dpO={["Grass"]=0,["dirt"]=1,["TNT"]=12}
dpOO={["Grass"]=24,["dirt"]=24,["TNT"]=21}
TimeO={["Grass"]=6,["dirt"]=3,["TNT"]=10}

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.newGame(7087918)


function addData(n)
data[n]={Object={["Grass"]=0,["dirt"]=20,["TNT"]=0,["pickaxe_1"]=10,PickaxeBl_1=true,PickaxeNum1=0,["torch"]=0,TorchBl=true},pieces={[1]=0,[2]=0,[3]=0},si="Grass",key=1,AMR=nil,hearth={p=6,t=0},mouse={x=6,y=0},shop="",page=1}
SLOT[n]={["s1"]="pickaxe_1",["s2"]="Grass",["s3"]="dirt",["s4"]="",["s5"]="",["s6"]="",["s7"]="",["s8"]=""}
end

mapsO={{x=620, y=300},{x=620, y=340},{x=620, y=260},{x=580, y=220},{x=540, y=220},{x=540, y=180},{x=580, y=140},{x=580, y=180},{x=620, y=140},{x=620, y=180},{x=620, y=220},{x=660, y=220},{x=700, y=220},{x=700, y=180},{x=660, y=140},{x=660, y=260},{x=580, y=260},{x=1020, y=300},{x=1020, y=260},{x=1060, y=260},{x=980, y=260},{x=940, y=220},{x=940, y=180},{x=980, y=140},{x=1020, y=140},{x=1060, y=140},{x=1020, y=100},{x=1100, y=180},{x=1100, y=220},{x=1060, y=220},{x=1060, y=180},{x=1020, y=180},{x=1020, y=220},{x=980, y=220},{x=980, y=180},{x=1380, y=340},{x=1380, y=300},{x=1380, y=260},{x=1340, y=260},{x=1420, y=260},{x=1460, y=180},{x=1420, y=140},{x=1380, y=140},{x=1340, y=140},{x=1300, y=180},{x=1300, y=220},{x=1380, y=100},{x=1340, y=180},{x=1420, y=180},{x=1380, y=180},{x=1420, y=220},{x=1340, y=220},{x=1380, y=220},{x=260, y=340},{x=260, y=300},{x=260, y=260},{x=300, y=260},{x=220, y=260},{x=340, y=220},{x=340, y=180},{x=180, y=220},{x=180, y=180},{x=220, y=140},{x=260, y=140},{x=300, y=140},{x=260, y=100},{x=260, y=180},{x=220, y=180},{x=260, y=220},{x=300, y=220},{x=300, y=180},{x=220, y=220}}

for i=1,#mapsO do
table.insert(ObjectsPhy,{x=mapsO[i].x,y=mapsO[i].y,i=id_ob,player="",type="Grass",typei=nil,time=0,bl=false,namep=""})
tfm.exec.addPhysicObject(id_ob,mapsO[i].x,mapsO[i].y,{type=6, height=wh_Object, width=wh_Object, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,color="0xE61414",miceCollision=true})
id_ob=id_ob+1
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
if j == "TNT" then
add(id+1000,"<font color='#000001' ><p align='center'>TNT",nil,x-15,y-7,30,15,12961221,12961221,1,false,false)
end
tfm.exec.addPhysicObject(id,x,y,{type=TypeO[j], height=wh_Object, width=wh_Object, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,color="0xE61414",miceCollision=true})
end

function addOP(id,j,x,y,n)
if j == "TNT" then
add(id+1000,"<font color='#000001' ><p align='center'>TNT",nil,x-15,y-7,30,15,12961221,12961221,1,false,false)
end
tfm.exec.addPhysicObject(id,x,y,{type=TypeO[j], height=wh_Object, width=wh_Object, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,color="0xE61414",miceCollision=true})
table.insert(ObjectsPhy,{x=x,y=y,i=id,player=n,type=j,typei=nil,time=0,bl=false,namep=""})
tfm.exec.displayParticle(dpO[j],x,y, (random(30)-15)/5, (random(10)-5)/5, 0, 0)
SelectItem(n,data[n].key)
end 


function n_item(n,type)
local text = ""
if type == "Grass" or type == "dirt" or type == "TNT" or type == "pickaxe_1" then
text = data[n].Object[type]..(type ~= "pickaxe_1" and "/"..maxO[type] or "")
end
return text
end


function ImgIco(n)
pssX={330,246,202,290}
pssY={359,364,364,365}
imgPss={["Grass"]="15aeda62ab7.png",["TNT"]="15aeda65421.png",["pickaxe_1"]="15af19e8cd2.png",["torch"]="15af19ee5ae.png"}
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
            RefreshOP(O.i,O.type,O.x,O.y)
		end
    end
tfm.exec.chatMessage("<vp>[MiceCraft]</vp> <font color='#009AFF'> Welcome to MiceCraft :D</font>",n)
end

table.foreach(tfm.get.room.playerList,eventNewPlayer)

function eventNewGame()

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
			break
	    end
    end
	
if (posX > (xp-100) and posX < (xp+100)) and (posY > (yp-100) and posY < (yp+100)) then
    if data[n].si == "Grass" or data[n].si == "dirt" or data[n].si == "TNT" then
        if data[n].Object[data[n].si] > 0 and bl then
			data[n].Object[data[n].si]=data[n].Object[data[n].si]-1
            addOP(id_ob,data[n].si,X,Y,n)
            id_ob=id_ob+1
        end
	elseif data[n].si == "pickaxe_1" then
	    if data[n].Object["pickaxe_1"] > 0 and not bl then
	        for i,p in pairs(ObjectsPhy) do
		        if X == ObjectsPhy[i].x and Y == ObjectsPhy[i].y then
			        O=ObjectsPhy[i]
					if O.namep == "" and not O.bl then
				        if data[n].Object.PickaxeBl_1 then
				            if O.type == "Grass" or O.type == "dirt" or O.type == "TNT" then
						        O.time=TimeO[O.type]
                                O.bl = true 
					            O.namep = n
							  	O.typei=1
                                data[n].Object.PickaxeNum1=data[n].Object.PickaxeNum1+1
                                if data[n].Object.PickaxeNum1 == 3 then
								    data[n].Object["pickaxe_1"]=data[n].Object["pickaxe_1"]-1
								    data[n].Object.PickaxeNum1=0
								end
							   	data[n].Object.PickaxeBl_1=false
						   	end
						else
						    tfm.exec.chatMessage("<j>[MiceCraft]</j><r> You must to wait until the first ground is destroyed.</r>",n)
						end
					end
				end
			end
		end
	elseif data[n].si == "torch" then
	    if not bl then
	        for i,p in pairs(ObjectsPhy) do
		        if X == ObjectsPhy[i].x and Y == ObjectsPhy[i].y then
			        O=ObjectsPhy[i]
				    if O.namep == "" and not O.bl and O.type == "TNT" then
						if data[n].Object.TorchBl then
				     	    O.time=8
                            O.bl = true
					        O.namep = n
						    O.typei=2
							data[n].Object.TorchBl=false
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
    if type == "Grass" then 
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
    elseif type == "dirt" then
        a = random(1,100)
        if a >= 50 and a <= 60 then iPiece = 1     -- 10% 
        elseif a >= 76 and a <= 80 then iPiece = 2 -- 4% 
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
			if O.typei == 1 then DP(dpOO[O.type],O.x,O.y)
			elseif O.type == "TNT" and O.typei == 2 then tfm.exec.displayParticle(13,O.x,O.y, (random(30)-15)/5, (random(10)-5)/5, 0, 0)
			end
		end
		if O.time == 0 and O.namep ~= "" then
            if O.typei == 1 then
                if data[O.namep].Object[O.type] < maxO[O.type] then ---------------- عدم امتلاك الادوات عندما تتجاوز الحد الاقصى من الاساس
                    data[O.namep].Object[O.type]=data[O.namep].Object[O.type]+1
                    SelectItem(O.namep,data[O.namep].key)
                end
                DP(dpOO[O.type],O.x,O.y)
                data[O.namep].Object.PickaxeBl_1=true
                removeOP(O.i)
            else
			    if O.type == "TNT" then
			        for Y=1,#ObjectsPhy do
	                    V=ObjectsPhy[Y]
						tfm.exec.explosion (O.x+20, O.y+20, 20, 150, false)
				    	if (V.x == O.x+40 and V.y == O.y) or (V.x == O.x-40 and V.y == O.y) or (V.x == O.x and V.y == O.y+40) or (V.x == O.x and V.y == O.y-40) then
                            V.time=0 
                            V.bl = true 
			                V.namep = O.namep 
		     	     		V.typei = 1
					    end
			        end
			        DP(10,O.x,O.y)
		            DP(3,O.x,O.y)
                    data[O.namep].Object.TorchBl=true
                    removeOP(O.i)
			   	end
			end
		end
		end
	end
end

function shopItems(n)
shopItem={
		[1]={
		    ["Grass"]={"Grass",data[n].Object["Grass"].."/64",1,2,3,1},["dirt"]={"dirt",data[n].Object["dirt"].."/64",1,2,5,3},["TNT"]={"TNT",data[n].Object["TNT"].."/5",2,3,8,2}},
		[2]={
		    ["pickaxe_1"]={"pickaxe_1",data[n].Object["pickaxe_1"].."",1,4,2,1},["1"]={"","",1,0,1,0},["2"]={"","",1,0,1,0}}
		}
return shopItem
end

function open_shop(n,id)
list=shopItems(n)
    if id == 1 then
        tu.create.shop(1,1,list[id]["Grass"],list[id]["dirt"],list[id]["TNT"],n,250,80,true,true)
		data[n].shop=id
	elseif id == 2 then
        tu.create.shop(1,2,list[id]["pickaxe_1"],list[id]["1"],list[id]["2"],n,250,80,true,true) 
		data[n].shop=id
	elseif id == 3 then
        --tu.create.shop(1,3,"?/?","<a href='event:UseO_torch'>Use</a>  -  Buy","?/?","???","?/?","???",n,250,80,true,true)
        data[n].shop=id
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
		    SLOT[n][i]= ""
			break
		end 
    end
    SLOT[n]["s"..tonumber(event:sub(6))] = data[n].AMR
    ui.removeTextArea(60,n)
    data[n].AMR = nil
    data[n].key = tonumber(event:sub(6))
	SelectItem(n,tonumber(event:sub(6)))
end
if event:sub(0,4) == "Buy_" then
    type = event:sub(5)
    list=shopItems(n)
	list=list[data[n].shop][type]
    if (data[n].pieces[list[3]] >= list[4]) and (data[n].pieces[list[5]] >= list[6]) then
	    
    open_shop(n,data[n].shop)
    end
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
            shop = function(id,s, tb1,tb2,tb3,n,x,y,U1,U2)
            add(9 ..id.. 40 .. 200,""..(s == 1 and "" or "<a href='event:shop_Tapic_1'>").."<p align='center'>Blocks",n,x+3,y-(s == 1 and 27 or 22),50,50,(s == 1 and 6776420 or 9144451),3684665,1,true)
            add(9 ..id.. 40 .. 201,""..(s == 2 and "" or "<a href='event:shop_Tapic_2'>").."<p align='center'>Pickaxes",n,x+61,y-(s == 2 and 27 or 22),50,50,(s == 2 and 6776420 or 9144451),3684665,1,true)
            add(9 ..id.. 40 .. 202,""..(s == 3 and "" or "<a href='event:shop_Tapic_3'>").."<p align='center'>Torchs",n,x+119,y-(s == 3 and 27 or 22),50,50,(s == 3 and 6776420 or 9144451),3684665,1,true)
            add(9 ..id.. 40 .. 203,"           <a href='event:shopClose_".. 9 ..id.. 40 .."'>X</a>",n,x+279,y+11,50,20,9144451,3684665,1,true)
            add(9 ..id.. 40 .. 204,"",n,x,y,300,250,9144451,3684665,1,true)
            add(9 ..id.. 40 .. 205, "<p align='right'><t>\n"..data[n].pieces[1].."\n\n"..data[n].pieces[2].."\n\n"..data[n].pieces[3].."", n, x+238, y-1, 39, 100, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 206,"Previous",n,x+13,y+228,50,20,-1,9144451,0,true)
            add(9 ..id.. 40 .. 207,"Next",n,x+253,y+228,30,20,-1,9144451,1,true)
            add(9 ..id.. 40 .. 208,"",n,x+82,y+43,110,37,6776420,6776420,1,true)
            add(9 ..id.. 40 .. 209,"",n,x+33,y+38,47,47,6776420,5592146,1,true)
            add(9 ..id.. 40 .. 210,"",n,x+156,y+105,110,37,6776420,6776420,1,true)
            add(9 ..id.. 40 .. 211,"",n,x+113,y+100,47,47,6776420,5592146,1,true)
            add(9 ..id.. 40 .. 212,"",n,x+82,y+167,110,37,6776420,6776420,1,true)
            add(9 ..id.. 40 .. 213,"",n,x+33,y+162,47,47,6776420,5592146,1,true)
            add(9 ..id.. 40 .. 214, "<p align='center'>"..tb1[2], n, x+31, y+74, 50, 19, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 215, "<p align='center'>"..tb2[2], n, x+111, y+136, 50, 19, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 216, "<p align='center'>"..tb3[2], n, x+31, y+198, 50, 19, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 217, "<p align='center'><a href='event:UseO_"..tb1[1].."'>Use</a>  -  <a href='event:Buy_"..tb1[1].."'>Buy</a>", n, x+90, y+67, 100, 27, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 218, "<p align='center'><a href='event:UseO_"..tb2[1].."'>Use</a>  -  Buy", n, x+168, y+130, 100, 27, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 219, "<p align='center'><a href='event:UseO_"..tb3[1].."'>Use</a>  -  Buy", n, x+90, y+192, 100, 27, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 220, tb1[5], n, x+115, y+44, 27, 22, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 221, tb1[6], n, x+159, y+44, 26, 21, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 222, tb2[5], n, x+239, y+107, 26, 21, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 223, tb2[6], n, x+194, y+107, 27, 22, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 224, tb3[5], n, x+115, y+168, 27, 22, 0x324650, 0x000000, 0, true)
            add(9 ..id.. 40 .. 225, tb3[6], n, x+159, y+168, 26, 21, 0x324650, 0x000000, 0, true)
            ids[n][10] = tfm.exec.addImage(impi[1], "&1", x+278, 97, n) 
            ids[n][11] = tfm.exec.addImage(impi[2], "&2", x+279, 121, n)
            ids[n][12] = tfm.exec.addImage(impi[3], "&3", x+278, 147, n)
            ids[n][21] = tfm.exec.addImage(impi[tb1[3]], "&4", x+98, y+47, n)
            ids[n][22] = tfm.exec.addImage(impi[tb1[4]], "&5", x+141, y+47, n)
            ids[n][23] = tfm.exec.addImage(impi[tb2[3]], "&6", x+221, y+110, n)
            ids[n][24] = tfm.exec.addImage(impi[tb2[4]], "&7", x+177, y+110, n)
            ids[n][25] = tfm.exec.addImage(impi[tb3[3]], "&8", x+98, y+172, n)
            ids[n][26] = tfm.exec.addImage(impi[tb3[4]], "&9", x+141, y+172, n)
            tu.create.p[tostring("9"..id.."40")] = 9 ..id.. 40; end,
            remove = function(id, n)
			data[n].shop=1
            for k=200,225 do
                ui.removeTextArea(tu.create.p[id] .. k, n);
			end 
            ui.removeTextArea(tu.create.p[id] .. 40, n);
            ui.removeTextArea(60, n);
            for s, k in pairs({10,11,12,21,22,23,24,25,26}) do
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

