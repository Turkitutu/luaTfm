xml=[[<C><P D="x_bouboum/x_fond/x_f0.jpg" /><Z><S><S L="10" X="-5" H="400" Y="200" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" H="400" X="805" Y="200" T="12" P="0,0,0,0,0,0,0,0" /><S L="200" X="100" H="135" Y="385" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="200" H="135" X="300" Y="385" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="200" X="500" H="135" Y="385" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="200" H="135" X="700" Y="385" T="10" P="0,0,0.3,0,0,0,0,0" /></S><D /><O /></Z></C>]]
Admins= {Turkitutu=true, Unlocker001=true}
currentQuestion=1
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
system.disableChatCommandDisplay("mc")
system.disableChatCommandDisplay("rv")
system.disableChatCommandDisplay("st")
system.disableChatCommandDisplay("killall")---سوف ابحث عن اسئلة
-- اوك
questions={
    {
        q="كم من قطة جبن تفوز بها عند الفوز بالقرعة",
        a={"50","30","25","70"},
    },
    {
        q="من منظمو المُسابقة",
        a={"Unlocker001 & Turkitutu","Unlocker001","Turkitutu","Mixysl"},
    },
    {
        q="في أي ساعة تبدأ السنة الجديدة",
        a={"منتصف الليل","الحادية عشر ليلا","الثامنة صباحًا","الواحدة صباحًا"},
    },
    {
        q="ماهي جائزة الفوز بهذه مسابقة",
        a={"فراء","جبن","اداة شامان","حروف"},
    },
    {
        q="كم عدد اصابع رجل الفأر في ترانسفورمايس",
        a={"3","5","2","0"},
    },
    {
        q="ماهو أول لقب يُعطى لك في بداية ترانسفورمايس",
        a={"الفأر الصغير","الفأر الرمادي","الفأر البني","الفأر الجميل"},
    },
    {
        q="5x5+2 : ماهو ناتج العملية التالية",
        a={"27","20","35","54"},
    },
    {
        q="من هو نائب فريق الأدب العربيّ السابق",
        a={"Connow","Unlocker001","Laplusbellef","Thesadgirl"},
    },
    {
        q="من هو مدير البرمجيات التركيبية",
        a={"Pikashu","Tigrounette","Galaktine","Zou"},
    },
    {
        q="ماهو الزر الذي يفتح/يغلق المقهى ؟",
        a={">","Shift","/","حرف ث"},
    },
    {
        q="أي واحد من هؤلاء الفنانين رسم الموناليزا ؟",
        a={"ليوناردو دافنشي","كلود مونيه","تركي توتو","بابلو بيكاسو"},
    },
    { 
        q="ماذا كانت تسمى الجزائر قديمًا",
        a={"إكوزيم","نوميديا","افريقية","جزائر بني مزغنة"},
    },
    {
        q="في اي عام تأسس الفيس بوك",
        a={"2004","2010","1989","2015"},
    },
    {
        q="من مصممة الجرافيك للعبة ترانسفورمايس",
        a={"Melibellule","Tigrounette","Safwanrockz","Adazaelle"},
    },
    {
        q="10/10*5 ماهو ناتج العملية ",
        a={"5","0,2","10","0"},
    },
    {
        q="من مطور برمجيات لعبة ترانسفورمايس ؟",
        a={"Tigrounette","Melibellule","Adazaelle","Zou"},
    },
    {
        q="ما هي أكبر دولة عربية من حيث عدد السكان ؟",
        a={"مصر","الجزائر","الصومال","السعودية"},
    },
    {
        q="ما هو أول موسم في ترانسفورمايس ؟",
        a={"الهالوين","الكرسمس","الفالانتين","عيد الغطاس"},
    },
    {
        q="مااسم المحرك الفيزيائي للعبة ترانسفورمايس ؟",
        a={"Box2D","Java","Flash","Lua"}
    },
    {
        q="9x4+14 ماهو ناتج العملية ",
        a={"50","72","82","20"},
    },
    {
        q="بعد إنقاذ كم فأر في المستوى العادي يتم فتح المستوى الخارق؟",
        a={"4000","2000","1000","500"},
    },
    {
        q="ما هو الحد الأقصى لعدد الأزياء التي يمكن حفظها في المتجر ؟",
        a={"20","10","30","15"},
    },
    {
        q="ما عدد الفرست الذي يتم فيه فتح آخر لقب من الفرست؟",
        a={"40000","20000","5000","10000"},
    },
    {
        q="من هو أقوي الحيوانات ذاكرة ؟",
        a={"الجمل","الحصان","القرد","البقرة"},
    },
    {
        q="متى تحتفل ترانسفورمايس بعيد ميلادها؟",
        a={"1 مايو","5 يناير","13 فبراير","21 يونيو"},
    },
    {
        q="ماهو الغاز المستخدم لإطفاء الحرائق؟",
        a={"غاز ثاني اكسيد الكربون","غاز الأكسجين","غاز ثنائي الهيدروجين","غاز انلوكر"},
    },
    {
        q="اختر الكلمة المُشكلة بشكل صحيح",
        a={"شَرِبَ","شَرِبٌ","شًرُبٍ","شُرَبٍ"},
    },
    {
        q="؟ Colonel كيف نحصل على لقب",
        a={"جمع 250 بوتكامب","جمع 250 فرست","جمع 250 جبن","جمع 1000 فرست"},
    },
    {
        q="؟ Cfmbot من هو صاحب",
        a={"Sourdough","Hguhfmohamed","Zou","Tigrounette"},
    },
    {
        q="من هو أول مبرمج لوا بترانسفورمايس في المجتمع العربيّ ؟",
        a={"Safwanrockz","Turkitutu","Zagear","Bodykudo"},
    },
}
 
function table.shuffle(t)
    local t = t
    local n = #t
    local j
    for i = 1, n do
        j = math.random(i)
        t[j],t[i] = t[i],t[j]
    end
    return t
end


function eventChatCommand(n,c)
    local args={}
    for s in c:gmatch("%S+") do
        table.insert(args, s)
    end
    if Admins[n] and c:sub(0,2)=="mc" then
        tfm.exec.chatMessage("<J>"..c:sub(3).." <BV>["..n.."]")
    end
    if Admins[n] and args[1]=="st" then
        currentQuestion = tonumber(args[2])
    end
    if Admins[n] and c == "killall" then
        for n in pairs(tfm.get.room.playerList) do
            tfm.exec.killPlayer(n)
        end
    end
    if Admins[n] and args[1] == "rv" then
        tfm.exec.respawnPlayer(args[2])
    end
end
function displayQuestion(num)
    ui.addTextArea(1,"<p align='center'><font size='32'>"..questions[num].q.."</font></p>",nil,00,50,800,nil,0x324650,0x212F36,0,true)
      correctAnswer=questions[num].a[1]
      shuffledAnswers = table.shuffle(questions[num].a)
    for k,v in ipairs(shuffledAnswers) do
        ui.addTextArea(1+k,"<font color='#00000'><p align='center'><font size='18'>"..v.."</font></p>",nil,(k-1)*200,350,200,nil,0x324650,0x212F36,0,true)
    end
      tfm.exec.setGameTime(14)
      ap = ""
        for n in pairs(tfm.get.room.playerList)do
            ap=ap..", "..n
        end
        print(ap)
      print(currentQuestion)
end

function eventPopupAnswer(id,n,a)
    local fc = a:gsub("<", "&lt;")
    tfm.exec.chatMessage("<J>"..fc.." <BV>["..n.."]")
    ui.addPopup(id, 2, "Enter text", n, 0, 350, 300, true)
end
 
function eventLoop(time, remaining)
      if remaining<=0 and not VARIABLENAME then
        VARIABLENAME=true
        if questions[currentQuestion] then
            for k,v in ipairs(shuffledAnswers) do
                if v==correctAnswer then
                    correctAnswer=k
                end
            end
            for name,player in pairs(tfm.get.room.playerList) do
                if (not player.isDead) and not (player.x<correctAnswer*200 and player.x>(correctAnswer*200)-200) then
                    tfm.exec.killPlayer(name)
                end
            end
              currentQuestion=currentQuestion+1
            if questions[currentQuestion] then
                 VARIABLENAME=false
                 displayQuestion(currentQuestion)
            else
                VARIABLENAME=false
            end

          else
              for i=1,5 do ui.removeTextArea(i) end
              ui.addTextArea(1,"<p align='center'><font size='32'>That's all there is!</font></p>",nil,200,50,400,nil,0x324650,0x212F36,0,true)
          end
    end
end

function eventNewGame()
    for n in pairs(tfm.get.room.playerList) do
        if Admins[n] then
            tfm.exec.setNameColor(n, 0xF0173A)
        end
    end
end
 
tfm.exec.newGame(xml)
displayQuestion(currentQuestion)