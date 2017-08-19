admin = "Turkitutu"
admins={}


tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
admins[admin] = true
t = 0
time_n_g = 3
select_t = 0
cha = 0
bool_n_g = false
Host = ""
competitor = ""
t_m_text = ""
challenge1 = nil
challenge2 = nil
players={}
lastPlayer=""
mice = 0
st_p = false

function rand_p(type)
	pl={}
	for i=1,#players do
		if type == 1 then
			if players[i] ~= lastPlayer then
				table.insert(pl,players[i])
			end
		elseif type == 2 then
			if players[i] ~= Host then
				table.insert(pl,players[i])
			end
		elseif type == 3 then
			table.insert(pl,players[i])
		end
	end
	return pl[math.random(#pl)]
end

random_cha1 = {
	{a="تتعذب حتى الموت",b="تموت محروق"},
	{a="تقتل ابوك",b="تقتل امك"},
	{a="تنقذ صديقك و تموت",b="تنقذ نفسك و يموت صديقك"},
	{a="تأكل زج مخلل",b="تأكل صرصور مقلي"},
	{a="تزحف افعى كبيرة على وجهك",b="تنام بغرفة ممتلئة بالصراصير"},
	{a="تعيد الدراسة من أولى ابتدائي",b="تاكل 50 نملة"},
	{a="تخونك زوجتك مع صديقك",b="تخونك زوجتك مع اخوك"},
	{a="تذهب الى غابة ممتلئة بالحيونات الوحشية",b="ترمي نفسك في بحر عميق"},
	{a="تمشي على النار",b="تمشي على مسامير"},
	{a="تقبل خنزير",b="تاكل صرصور كبير"},
	{a="تروح مدرسة عاري",b="تقتل اهلك"},
	{a="تأخذ سلفي مع ماسي",b="تأخذ سلفي مع ريونالدو"},
	{a="ترسب بالامتحان",b="تغش"},
	{a="تأكل ذباب الى الابد",b="تأكل لحم انسان"},
	{a="تسافر الى المستقبل و لا تملك شيئ",b="تسافر للماضي و لديك كل شي"},
	{a="تسقط من برج",b="تسقط من جبن"},
	{a="تلمس وسخ الحصان",b="تلمس وسخ بقرة"},
	{a="تتزوج بنت/ولد قبيح/ة بصفات سلبية",b="تتزوج بنت/ولد جميل/ة بصفات اجابية"},
	{a="تنتحر مشنوق",b="تنتحر محروق"},
	{a="تعيش مع الجن طول حياتك",b="تعيش مع الفضائين طول حياتك"},
	{a="تبقى بغرفة بها اسد",b="تقع من مكان عالي"},
	{a="تكون فائق الذكاء",b="تكون فائق الجمال"},
	{a="تنام في النهار وتعمل في الليل",b="تنام في الليل وتعمل في النهار"},
	{a="تنخطف عائلتك",b="تنخطف أنت"},
	{a="تاكل أكره اكلة لديك",b="تاكل افضل أكلة لديك مع صرصور"},
	{a="تسافر إلى دولة فقيرة لكنك غني",b="تسافر إلى دولة غنية لكنك فقير"},
	{a="تبقى شهرين بدون انترنت",b="تنام 3 أيام في الشارع"},
	{a="تدرس مع طالب تكرهه",b="يدرسك أستاذ تكرهه"},
	{a="أن تتدمر بلدك وحدها",b="أن يتدمر العالم بالكامل و تبقى بلدك"},
	{a="فقير وعندك أصدقاء",b="غني وما عندك أصدقاء"},
	{a="تكون قصير ونحيف",b="تكون طويل وسمين"},
	{a="صاحبك يكون منحوس للأبد وأنت محظوظ لمدة 24 ساعة",b="أن تكون منحوس للأبد وصاحبك محظوظ للأبد"},
	{a="تقطع يدك وتنجو",b="تقتل شخص و تنجو"},
	{a="تحلق نص دقنك",b="تحلق نص شعرك"}
}

random_cha2 = {
	"قم بالزواج بإحدى اللاعبين الموجودين بالقرية","20 مرة %s قبل",
	"قم بتكرار الجملة التالية 10 مرات في الفانيلا  : <br>انا شخص غبي لا اعرف شيئاً","إرتدي ملابس الجنـس المختلف لمدة 20 جولة بالقرية",
	"قبل شخصًا من الجـنس المختلف 5 مرات أمام الجميع","إعد الإتصال باللعبة 5 مرات",
	"أخلع ملابسك لمدة 3 جولات","أدخل الى محادثة المساعدين و أزعج <br>اي مساعد عربي و عندما يرد عليك<br> اخبره انه تحدي",
	"اخبر شخص عشوائي من الفيلاج اكرهك","اجمل 5 قطع جبن بالرسينغ",
	"انشئ موضوع بالمقهى و اكتب به : احب الدجاج","انتحر 25 مرة",
	"مرتين %s نفذ مايقوله لك","%s تزوج",
	"قم برمي 10 دجاجات و 10 حيوان اخر بالروم","قم برمي قبر 10 مرات",
	"قم برمي 10 دجاجات و 10 حيوان اخر بالروم","اذهب الى القرية وابقى بها مدة 3 دقائق",
	"قم برمي 10 دجاجات و 10 حيوان اخر بالروم","قم برمي قبر 10 مرات",
	"قم برمي 10 دجاجات و 10 حيوان اخر بالروم","قم برمي قبر 10 مرات",
}


area_acn = function(text)
	ui.addTextArea(1, "", n, 200, 15, 400, 30, 0x142b2e, 0x8a583c, 1, true)
	ui.addTextArea(2, "<p align='center'>"..text:gsub("<blue>","<font color='#007CFF'>"):gsub("</blue>","</font>").."</p>", n, 200, 25, 400, 30, 0x142b2e, 0x8a583c, 0, true)
end

popup_t = function(n,id,title,text,bt1,bt2)
	ui.addTextArea(3, "\n<p align='center'>"..text.."</p>", n, 259, 184, 287, 73, 0x142b2e, 0x8a583c, 1, true)
	ui.addTextArea(4, "", n, 270, 236, 122, 13, 0x0b0c0d, 0x0b0c0d, 1, true)
	ui.addTextArea(5, "", n, 267, 233, 122, 14, 0x97a6aa, 0x97a6aa, 1, true)
	ui.addTextArea(6, "", n, 268, 234, 123, 14, 0x314e57, 0x314e57, 1, true)
	ui.addTextArea(7, "", n, 412, 233, 123, 14, 0x97a6aa, 0x97a6aa, 1, true)
	ui.addTextArea(8, "", n, 415, 236, 122, 13, 0x0b0c0d, 0x0b0c0d, 1, true)
	ui.addTextArea(9, "", n, 413, 234, 123, 14, 0x314e57, 0x314e57, 1, true)
	ui.addTextArea(10, "", n, 257, 163, 292, 16, 0x3f2b1d, 0x1f1813, 1, true)
	ui.addTextArea(11, "<p align='center'>"..title.."</p>", n, 258, 161, 294, 19, 0x324650, 0x000000, 0, true)
	ui.addTextArea(12, "<p align='center'><a href='event:pt_as1_"..tostring(id).."'>"..bt1.."</a></p>", n, 266, 231, 128, 19, 0x324650, 0x000000, 0, true)
	ui.addTextArea(13, "<p align='center'><a href='event:pt_as2_"..tostring(id).."'>"..bt2.."</a></p>", n, 410, 231, 128, 19, 0x324650, 0x000000, 0, true)
end

popup_list_p = function(name)
	local list = "\n"
	for n in pairs(tfm.get.room.playerList) do if n ~= Host then list = list.."<a href='event:se_"..n.."'>"..n.."</a>\n" end end
	ui.addTextArea(14, "<p align='center'>"..list.."</p>", name, 342, 78, 116, 243, 0x142b2e, 0x8a583c, 1, true)
	ui.addTextArea(15, "", name, 339, 60, 122, 15, 0x3f2b1d, 0x1f1813, 1, true)
	ui.addTextArea(16, "<p align='center'>تحديد لاعب</p>", name, 337, 59, 127, 21, 0x324650, 0x000000, 0, true)
end

addPopup = function(n,id,text)
	ui.addPopup(id,2,".",n, 300, 100, 200, true)
	ui.addTextArea(17, "", n, 297, 90, 206, 18, 0x3f2b1d, 0x1f1813, 1, true)
	ui.addTextArea(18, "<p align='center'>"..text.."</p>", n, 297, 90, 206, 25, 0x3f2b1d, 0x1f1813, 0, true)
end
-- لم اجد المشكلة
popup_l_a = function(type)
	for i=20,41 do ui.removeTextArea(i) end
	for n in pairs(tfm.get.room.playerList)do
	       tqq=(cha == 1 and "الخيار" or cha == 2 and "التحدي")
	       tqf=(cha == 1 and "إختر" or cha == 2 and "أقبل")
		if type == 1 then
			ui.addTextArea(20, "", n, 185, 75, 429, 243, 0x142b2e, 0x8a583c, 1, true)
			ui.addTextArea(21, "", n, 453, 80, 50, 100, 0x142b2e, 0x8a583c, 1, true)
			ui.addTextArea(22, "", n, 295, 70, 50, 100, 0x142b2e, 0x8a583c, 1, true)
			ui.addTextArea(23, "", n, 315, 79, 156, 20, 0x142b2e, 0x142b2e, 1, true)
			ui.addTextArea(24, "\n<p align='center'>"..challenge1.."</p>", n, 410, 109, 192, 180, 0x142b2e, 0x8a583c, 1, true)
			ui.addTextArea(25, "", n, 181, 59, 437, 18, 0x3f2b1d, 0x1f1813, 1, true)
			ui.addTextArea(26, "\n<p align='center'>"..challenge2.."</p>", n, 197, 109, 192, 180, 0x142b2e, 0x8a583c, 1, true)
			ui.addTextArea(27, "", n, 388, 192, 22, 21, 0x3f2b1d, 0x1f1813, 1, true)
			ui.addTextArea(28, "", n, 410, 99, 192, 15, 0x3f2b1d, 0x1f1813, 1, true)
			ui.addTextArea(29, "", n, 197, 99, 192, 15, 0x3f2b1d, 0x1f1813, 1, true)
			ui.addTextArea(30, "<p align='center'>لو خيروك</p>", n, 181, 59, 437, 21, 0x324650, 0x0, 0, true)
			ui.addTextArea(31, "<p align='center'>"..tqq.." الأول</p>", n, 414, 97, 188, 21, 0x324650, 0x0, 0, true)
			ui.addTextArea(32, "<p align='center'>"..tqq.." الثاني</p>", n, 199, 96, 188, 21, 0x324650, 0x0, 0, true)
			ui.addTextArea(33, "<p align='center'>أو</p>", n, 385, 193, 30, 31, 0x324650, 0x0, 0, true)
		elseif type == 2 then
			ui.addTextArea(20, "", n, 185, 79, 429, 243, 0x142b2e, 0x8a583c, 1, true)
			ui.addTextArea(21, "", n, 346, 69, 50, 100, 0x142b2e, 0x8a583c, 1, true)
			ui.addTextArea(22, "", n, 210, 83, 156, 20, 0x142b2e, 0x142b2e, 1, true)
			ui.addTextArea(23, "", n, 181, 59, 437, 18, 0x3f2b1d, 0x1f1813, 1, true)
			ui.addTextArea(24, "\n<p align='center'>"..(select_t == 1 and challenge1 or select_t == 2 and challenge2).."</p>", n, 304, 110, 192, 180, 0x142b2e, 0x8a583c, 1, true)
			ui.addTextArea(25, "", n, 304, 95, 192, 15, 0x3f2b1d, 0x1f1813, 1, true)
			ui.addTextArea(26, "<p align='center'>لو خيروك</p>",il, 181, 59, 437, 21, 0x324650, 0x000000, 0, true)
			ui.addTextArea(27, "<p align='center'> اختار المنافس "..tqq.." رقم "..select_t.."<p>", nil, 306, 93, 188, 21, 0x324650, 0x000000, 0, true)
		end
		if n == competitor and select_t == 0 then
			ui.addTextArea(34, "", n, 445, 264, 123, 14, 0x97a6aa, 0x97a6aa, 1, true)
			ui.addTextArea(35, "", n, 446, 266, 123, 14, 0x0b0c0d, 0x0b0c0d, 1, true)
			ui.addTextArea(36, "", n, 445, 265, 123, 14, 0x314e57, 0x314e57, 1, true)
			ui.addTextArea(37, "", n, 230, 264, 123, 14, 0x97a6aa, 0x97a6aa, 1, true)
			ui.addTextArea(38, "", n, 233, 267, 122, 13, 0x0b0c0d, 0x0b0c0d, 1, true)
			ui.addTextArea(39, "", n, 231, 265, 123, 14, 0x314e57, 0x314e57, 1, true)
			ui.addTextArea(40, "<p align='center'><a href='event:sel_2'>"..tqf.."</a></p>", n, 229, 261, 124, 20, 0x314e57, 0x314e57, 0, true)
			ui.addTextArea(41, "<p align='center'><a href='event:sel_1'>"..tqf.."</a></p>", n, 444, 262, 124, 20, 0x314e57, 0x314e57, 0, true)
		end
	end
end

function Answer_popup_t(n,id,answer)
	if id == 1 then
		if answer == "as1" then
			area_acn("...يتم إختيار منافس عشوائياً")
		       t_m_t(nil,function() competitor =  rand_p(2) area_acn("كلاعب منافس <j>"..competitor.."</j> تم إختيار") popup_t(competitor,4,"لو خيروك","إختر نوعية اللعبة","إختيارات","تحديات")   end,1)
		elseif answer == "as2" then	   
			popup_list_p(n)
		end
	elseif id == 2 then
		tqq=(cha == 1 and "الخيار" or cha == 2 and "التحدي")
		if answer == "as1" then
			if cha == 1 then
				aa=math.random(#random_cha1)
				challenge1 = random_cha1[aa].a
				challenge2 = random_cha1[aa].b
			elseif cha == 2 then
				challenge1 = random_cha2[math.random(#random_cha2)]:format(rand_p(3))
				ra = random_cha2[math.random(#random_cha2)]:format(rand_p(3))
				while (challenge1 == ra) do
					ra = random_cha2[math.random(#random_cha2)]:format(rand_p(3))
				end
				challenge2 = ra
			end
			popup_l_a(1)
			t_m_t(nil,function() area_acn("...يتم وضع إختيارات عشوائياً") popup_l_a(1) 	for i,ii in pairs({1,2,17,18}) do ui.removeTextArea(ii) end  end,3)
		elseif answer == "as2" then	   
			addPopup(n,1,"أكتب "..tqq.." الأول")
			area_acn(""..tqq.." الأول  <j>"..Host.."</j> يكتب المضيف")
		end
	elseif id == 3 then
		if answer == "as1" then
			area_acn("<r>جولات 3</r>لم ينفذ المنافس التحدي :( سيتم عقابه لـ ")
			for i=20,41 do ui.removeTextArea(i) end 
			eventNewGame()
		elseif answer == "as2" then
			area_acn("<vp>لقد نفد المنافس التحدي إنه جريء حقًا !")
			for i=20,41 do ui.removeTextArea(i) end 
			eventNewGame()
		end
	elseif id == 4 then
		cha = tonumber(answer:sub(3))
		t_m_t(nil,function() se_co() end,1)
		tqq=(cha == 1 and "الخيارات" or cha == 2 and "التحديات")
		area_acn("<bl>"..tqq.."</bl> اختار المنافس اللعب بـ")
	end
end

function t_n_g()
	if bool_n_g then
		if t_m_text ~= nil then area_acn((time_n_g > 2 and "ثواني" or "ثانية").." <vp>"..time_n_g.."</vp> "..t_m_text.."") end
		if time_n_g == -1 then
			bool_n_g = false
			aa()
		end
		time_n_g=time_n_g-1
	end
end

function t_m_t(text,codes,time)
	bool_n_g=true
	t_m_text=text
	time_n_g=time
	aa = codes
end

function eventLoop(t1,t2)
	t = t+1
	if t == 2 then  t=0
		t_n_g()
	end
	tfm.exec.movePlayer(Host,62, 200,offset,0,0,offset)
	tfm.exec.movePlayer(competitor,742, 200,offset,0,0,offset)
	
	if st_p then
		if mice >= 2 then
			eventNewGame()
			st_p = false
		else
			st_p = true
		end
	end
end

function se_co()
	type=(cha == 1 and "الخيارات" or cha == 2 and "التحديات")
	t_m_t(nil,function() area_acn("...بإضافة "..type.." <j>"..Host.."</j> يقوم المضيف") popup_t(Host,2,type.." وضع",type.." حدد طريقة وضع ","عشوائياً","يدوياً") end,1)
end

function eventTextAreaCallback(id,n,event)
	if event:sub(0,3) == "pt_" then
		Answer_popup_t(n,tonumber(event:sub(8)),event:sub(4,6))
		for id=3,13 do ui.removeTextArea(id,n) end
	elseif event:sub(0,3) == "se_" then
		competitor = event:sub(4)
		for i=14,16 do ui.removeTextArea(i,n) end
		popup_t(competitor,4,"لو خيروك","إختر نوعية اللعبة","خيارات","تحديات")
		area_acn("كلاعب منافس <j>"..competitor.."</j> تم إختيار")
	elseif event:sub(0,4) == "sel_" then
		select_t = tonumber(event:sub(5))
		popup_l_a(2)
		if cha == 2 then
			area_acn("...يُنجز التحدي الأن <j>"..competitor.."</j> المُنافس")
			popup_t(Host,3,"التحدي","هل قام المنافس بالتحدي المطلوب منه؟","لا","نعم")
		elseif cha == 1 then
			t_m_t(nil,function() eventNewGame() end,5)
		end
	end
end

function eventPopupAnswer(id,name,answer)
	type=(cha == 1 and "الخيار" or cha == 2 and "التحدي")
	if id == 1 then
		challenge1 = answer
		addPopup(name,2,"أكتب "..type.." الثاني")
		area_acn(""..type.." الثاني  <j>"..Host.."</j> يكتب المضيف")
	end
	if id == 2 then
		challenge2 = answer
		popup_l_a(1)
		for i,ii in pairs({1,2,17,18}) do ui.removeTextArea(ii) end
	end
end

function eventNewGame()
       lastPlayer=Host
	tfm.exec.killPlayer (competitor)
	tfm.exec.killPlayer (Host)
	for i=20,41 do ui.removeTextArea(i) end 
	time_n_g = 3
	select_t = 0
	cha = 0
	Host = ""
	competitor = ""
	challenge1 = nil
	challenge2 = nil
	if mice >= 2 then
               st_p = false
		t_m_t(nil,function() t_m_t("سيتم إختيار المضيف في غضون",function() Host=rand_p(1) area_acn("الأن بإختيار المنافس <j>"..Host.."</j> يقوم المضيف") popup_t(Host,1,"تحديد لاعب","حدد طريقة الإختيار","عشوائياً","يدوياً") end,5) end,5)
	else
              st_p = true
		area_acn("1/2 جاري انتظار اللاعبين")
	end
end

function eventChatCommand(n,c)
	local args={}
	for s in c:gmatch("%S+") do
		table.insert(args, s)
	end
	cmd=args[1]:lower()
	
	if cmd == "skip" and admins[n] then
		for i=20,41 do ui.removeTextArea(i) end 
		for i,ii in pairs({1,2,17,18}) do ui.removeTextArea(ii) end
		bool_n_g=false
		t_m_text=""
		time_n_g=0
		area_acn("تم تخطي اللعبة")
               tfm.exec.chatMessage("تم تخطي اللعبة <vp>:[لو خيروك]</vp>")
		t_m_t(nil,function() eventNewGame() end,1)
	elseif cmd == "admin" and  admin ==  n then
              admins[args[2]] = true
	elseif cmd == "unadmin" and  admin == n then
              admins[args[2]] = false
	end
end

function eventPlayerDied(n)
	tfm.exec.respawnPlayer (n)
end

function eventNewPlayer(n)
	tfm.exec.respawnPlayer (n)
	table.insert(players,n)
	mice = mice +1
end

table.foreach(tfm.get.room.playerList,eventNewPlayer)

function eventPlayerLeft(n)
	for i=1,#players do
		if players[i] == n then
			table.remove(players,i)
		end
	end
	mice = mice -1
	if n == Host or n == competitor then
		for i=20,41 do ui.removeTextArea(i) end 
		for i,ii in pairs({1,2,17,18}) do ui.removeTextArea(ii) end
		bool_n_g=false
		t_m_text=""
		time_n_g=0
		t_m_t(nil,function() eventNewGame() end,1)
		area_acn("الغرفة "..n.." تم تخطي اللعبة بسبب مغادرة")
		tfm.exec.chatMessage("الغرفة "..n.." تم تخطي اللعبة بسبب مغادرة <vp>:[لو خيروك]</vp>")
	end
end

function eventPlayerWon(n,timeElapsed,timeElapsedSinceRespawn)
    tfm.exec.respawnPlayer (n)
end
tfm.exec.newGame(7236609)
