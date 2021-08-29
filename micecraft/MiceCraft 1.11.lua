roomName=tfm.get.room.name
testing = false
if roomName:sub(1,2) == "*"..roomName:sub(1,2).char(3) then
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
tm={["s"]=true,["t"]=os.time()}
impi={"15cd2233748.png","15cd2234e5b.png","15cd22367da.png"} --
imgPss={["Grass"]="15af19e8cd2.png",["TNT"]="15af19ee5ae.png",["pickaxe_1"]="15aeda65421.png",["torch"]="15aeda62ab7.png",["dirt"]="15cd22367d1.png"}
xyItem = {["pickaxe_1"]={x=0,y=1},["torch"]={x=-3,y=-4}}
TuS="<ch>"
for i=1,8 do
    TuS=TuS.."<a href='event:UseS_"..i.."'>key "..i.."</a>\n\n"
end
maxO={["Grass"]=64,["dirt"]=64,["TNT"]=5,["pickaxe_1"]=20}
TypeO={["Grass"]=6,["dirt"]=5,["TNT"]=12}
dpO={["Grass"]=0,["dirt"]=1,["TNT"]=12}
dpOO={["Grass"]=24,["dirt"]=24,["TNT"]=21}
TimeO={["Grass"]=6,["dirt"]=3,["TNT"]=10}

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.newGame([[<C><P aie="" H="400" F="0" L="1600" DS="m;1560,330,40,330" /><Z><S /><D /><O /></Z></C>]])


function addData(n)
	data[n]={Object={["Grass"]=0,["dirt"]=20,["TNT"]=0,["pickaxe_1"]=15,PickaxeBl_1=true,PickaxeNum1=0,["torch"]=0,TorchBl=true},pieces={[1]=100,[2]=100,[3]=100},si="Grass",key=1,AMR=nil,hearth={p=6,t=0},mouse={x=6,y=0},shop={CanP=true,page=1}}
	SLOT[n]={["s1"]="pickaxe_1",["s2"]="",["s3"]="dirt",["s4"]="",["s5"]="",["s6"]="",["s7"]="",["s8"]=""}
end

function mapS(n)
	mapsO={["dirt"]={{20,380},{60,380},{100,380},{140,380},{180,380},{220,380},{260,380},{300,380},{340,380},{740,380},{700,380},{660,380},{620,380},{580,380},{540,380},{500,380},{460,380},{420,380},{380,380},{860,380},{900,380},{940,380},{980,380},{1020,380},{1060,380},{1140,380},{1180,380},{1220,380},{1100,380},{1260,380},{1300,380},{1340,380},{1380,380},{1420,380},{1460,380},{1500,380},{1540,380},{1580,380}},["Grass"]={{140,340},{140,300},{180,260},{140,260},{100,260},{60,220},{100,220},{140,220},{180,220},{220,220},{220,180},{180,180},{140,180},{100,180},{60,180},{100,140},{140,140},{180,140},{140,100},{420,180},{420,220},{460,180},{460,220},{500,220},{500,180},{540,180},{540,220},{580,180},{580,220},{1540,220},{1540,180},{1500,180},{1460,180},{1420,180},{1420,220},{1460,220},{1500,220},{1380,180},{1380,220},{1180,180},{1180,220},{1140,220},{1100,220},{1060,220},{1060,180},{1100,180},{1140,180},{1020,180},{1020,220},{1140,140},{1100,140},{1060,140},{1100,100},{1420,140},{1460,140},{1500,140},{1460,100},{460,260},{500,260},{540,260},{1060,260},{1100,260},{1140,260},{1100,300},{1100,340},{500,300},{500,340},{460,140},{500,140},{540,140},{500,100},{1420,260},{1460,260},{1500,260},{1460,300},{1460,340},{740,180},{860,180},{780,220},{820,220},{700,180},{740,220},{900,180},{860,220},{780,260},{820,260},{820,300},{780,300},{780,340},{820,340}}}
	for ty, i in pairs(mapsO) do
		yy = mapsO[ty]
		for i=1, #yy do
			table.insert(ObjectsPhy, {x=mapsO[ty][i][1],y=mapsO[ty][i][2],i=id_ob,player="",type=ty,typei=nil,time=0,bl=false,namep=""})
			tfm.exec.addPhysicObject(id_ob,mapsO[ty][i][1],mapsO[ty][i][2],{type=TypeO[ty], height=wh_Object, width=wh_Object, angle=0, friction=8, restitution=0, dynamic=false,foreground=true,color="0xE61414",miceCollision=true})
			id_ob=id_ob+1
		end
	end
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

function or_in(v,w)
	local a = false
		for p,n in pairs(w) do
			if v == n then
				a=true
			end        
		end
	return a
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
	if or_in(type,{"Grass","dirt","TNT","pickaxe_1"}) then
		text = data[n].Object[type]..(type ~= "pickaxe_1" and "/"..maxO[type] or "")
	end
	return text
end


function ImgIco(n)
	pssX={202,246,290,335,379,423,467,511}
	for i=1,8 do
		if SLOT[n]["s"..i] ~= nil then
			if ids[n][i] ~= nil then
					tfm.exec.removeImage(ids[n][i])
					ids[n][i]=nil
			end
			if imgPss[SLOT[n]["s"..i]] ~= nil then
				if xyItem[SLOT[n]["s"..i]] ~= nil then
					pos = xyItem[SLOT[n]["s"..i]]
				    ids[n][i] = tfm.exec.addImage(imgPss[SLOT[n]["s"..i]], "&1", pssX[i]+pos.x, 367+pos.y, n)
				else
					ids[n][i] = tfm.exec.addImage(imgPss[SLOT[n]["s"..i]], "&1", pssX[i], 367, n)
				end
			end
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
	--tfm.exec.chatMessage("<vp>[MiceCraft]</vp> <font color='#009AFF'> Welcome to MiceCraft :D</font>",n)
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
    if or_in(data[n].si,{"Grass","dirt","TNT"}) then
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
				            if or_in(O.type,{"Grass","dirt","TNT"}) then
						        O.time=TimeO[O.type]
                                O.bl = true 
					            O.namep = n
							  	O.typei=1
                                data[n].Object.PickaxeNum1=data[n].Object.PickaxeNum1+1
                                if data[n].Object.PickaxeNum1 == 4 then
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
    for i,p in pairs (SLOT[n]) do
        if data[n].Object[p] == 0 then
		    SLOT[n][i]= ""
		end 
    end
    SelectItem(n,data[n].key)
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

function eventLoop(m,j)
    if tm["s"] and tm["t"] < os.time()-500 then
	    mapS()
	    tm["s"] = false
	end
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
		    ["pickaxe_1"]={"pickaxe_1",data[n].Object["pickaxe_1"].."",2,3,2,2},["1"]={"","",1,1,1,1},["2"]={"","",1,1,1,1}}
		}
return shopItem
end

function open_shop(n,id)
list=shopItems(n)
    if id == 1 then
        tu.create.shop(1,1,list[id]["Grass"],list[id]["dirt"],list[id]["TNT"],n,250,80,true,true)
		data[n].shop.page=id
	elseif id == 2 then
        tu.create.shop(1,2,list[id]["pickaxe_1"],list[id]["1"],list[id]["2"],n,250,80,true,true) 
		data[n].shop.page=id
	elseif id == 3 then
        --tu.create.shop(1,3,"?/?","<a href='event:UseO_torch'>Use</a>  -  Buy","?/?","???","?/?","???",n,250,80,true,true)
        --data[n].shop.page=id
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
	data[n].shop.page = 1
elseif event == "shop_Tapic_2" then
	open_shop(n,2)
	data[n].shop.page = 2
elseif event == "shop_Tapic_3" then
	open_shop(n,3)
	data[n].shop.page = 3
end
if event:sub(0,5) == "UseO_" then
    data[n].AMR=event:sub(6)
    data[n].shop.CanP = false
    tu.remove.shop(9140203,n,"shopClose_9140");
    add(60, TuS, n, 387, 103, 45, 200, 0x383939, 0x0d0d0d, 1, true) 
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
	open_shop(n,data[n].shop.page)
	data[n].shop.CanP = true
end
if event:sub(0,4) == "Buy_" then
    type = event:sub(5)
    list=shopItems(n)
	list=list[data[n].shop.page][type]
    if (data[n].pieces[list[3]] >= list[5]) and (data[n].pieces[list[4]] >= list[6]) then
    	data[n].pieces[list[3]] = data[n].pieces[list[3]] - list[5]
    	data[n].pieces[list[4]] = data[n].pieces[list[4]] - list[6]
    	bb = (data[n].shop.page == 1 and 5 or 10)
        data[n].Object[type] = data[n].Object[type] + bb
        data[n].Object[type] = (data[n].Object[type] > maxO[type] and maxO[type] or data[n].Object[type])
    	open_shop(n,data[n].shop.page)
    	SelectItem(n,data[n].key)
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
	            for s, k in pairs({10,11,12,21,22,23,24,25,26,27,28,29}) do
	            	if ids[n][k] ~= nil then
	                	tfm.exec.removeImage(ids[n][k]);
	                	ids[n][k] = nil
	            	end
				end 
	            add(9 ..id.. 40 .. 200,""..(s == 1 and "" or "<a href='event:shop_Tapic_1'>").."<p align='center'>Blocks",n,x+3,y-(s == 1 and 27 or 22),50,50,(s == 1 and 6776420 or 9144451),3684665,1,true)
	            add(9 ..id.. 40 .. 201,""..(s == 2 and "" or "<a href='event:shop_Tapic_2'>").."<p align='center'>Pickaxes",n,x+61,y-(s == 2 and 27 or 22),56,50,(s == 2 and 6776420 or 9144451),3684665,1,true)
	            add(9 ..id.. 40 .. 202,""..(s == 3 and "" or "<a href='event:shop_Tapic_3'>").."<p align='center'>Torchs",n,x+125,y-(s == 3 and 27 or 22),50,50,(s == 3 and 6776420 or 9144451),3684665,1,true)
	            add(9 ..id.. 40 .. 203,"<p align='right'><a href='event:shopClose_".. 9 ..id.. 40 .."'>X</a>",n,x+279,y+11,50,20,9144451,3684665,1,true)
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
	            add(9 ..id.. 40 .. 217, "<p align='center'>"..(tb1[1] == "" and "Use  -  Buy" or data[n].pieces[tb1[3]] >= tb1[5] and data[n].pieces[tb1[4]] >= tb1[6] and data[n].Object[tb1[1]] < maxO[tb1[1]] and "<a href='event:UseO_"..tb1[1].."'>Use</a>  -  <vp><a href='event:Buy_"..tb1[1].."'>Buy</a>" or "<a href='event:UseO_"..tb1[1].."'>Use</a>  -  <r>Buy"), n, x+90, y+67, 100, 27, 0x324650, 0x000000, 0, true)
	            add(9 ..id.. 40 .. 218, "<p align='center'>"..(tb2[1] == "" and "Use  -  Buy" or data[n].pieces[tb2[3]] >= tb2[5] and data[n].pieces[tb2[4]] >= tb2[6] and data[n].Object[tb2[1]] < maxO[tb2[1]] and "<a href='event:UseO_"..tb2[1].."'>Use</a>  -  <vp><a href='event:Buy_"..tb2[1].."'>Buy</a>" or "<a href='event:UseO_"..tb2[1].."'>Use</a>  -  <r>Buy"), n, x+168, y+130, 100, 27, 0x324650, 0x000000, 0, true)
	            add(9 ..id.. 40 .. 219, "<p align='center'>"..(tb3[1] == "" and "Use  -  Buy" or data[n].pieces[tb3[3]] >= tb3[5] and data[n].pieces[tb3[4]] >= tb3[6] and data[n].Object[tb3[1]] < maxO[tb3[1]] and "<a href='event:UseO_"..tb3[1].."'>Use</a>  -  <vp><a href='event:Buy_"..tb3[1].."'>Buy</a>" or "<a href='event:UseO_"..tb3[1].."'>Use</a>  -  <r>Buy"), n, x+90, y+192, 100, 27, 0x324650, 0x000000, 0, true)
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
				pssX={292,372,292}
				pssY={122,185,246}
				tbs={tb1,tb2,tb3}
				for e=1,3 do
					if tbs[e][1] ~= "" then
						if xyItem[tbs[e][1]] ~= nil then
							ids[n][26+e] = tfm.exec.addImage(imgPss[tbs[e][1]], "&10", pssX[e]+pos.x, pssY[e]+pos.y, n)
						else
							ids[n][26+e] = tfm.exec.addImage(imgPss[tbs[e][1]], "&10", pssX[e], pssY[e], n)
						end
					end
				end
	            tu.create.p[tostring("9"..id.."40")] = 9 ..id.. 40; end,
	        remove = function(id, n)
	            if data[n].shop.CanP then
					data[n].shop.page=1
				end
	            for k=200,225 do
	                ui.removeTextArea(tu.create.p[id] .. k, n);
				end 
	            ui.removeTextArea(tu.create.p[id] .. 40, n);
	            ui.removeTextArea(60, n);
	            for s, k in pairs({10,11,12,21,22,23,24,25,26,27,28,29}) do
	            	if ids[n][k] ~= nil then
	                	tfm.exec.removeImage(ids[n][k]);
	                	ids[n][k] = nil
	            	end
				end 
			end,
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

