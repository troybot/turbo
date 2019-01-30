 BOT_NAME = redis:get(boss..'bot:name')
do 
local function run(msg, matches) 
local r =  matches[1]
local r2 = matches[2]
local r3 = matches[3]
local r4 = matches[4]
---------------[bot out]---------------------------
if r == BOT_NAME and r2 == 'غادر' and is_sudo(msg) then
sendMsg(msg.to.id,msg.id_,'اوك باي 😢💔💯','html')
botrem(msg)
end   
if (r == "وضع اسم للبوت✔" or r== 'ضع اسم للبوت ✔') and is_sudo(msg) then
if not we_sudo(msg) then return "انت لست مطور ❌" end
redis:setex(boss..'namebot:witting'..msg.from.id,300,true)
return"~> حسنا عزيزي ✔\n~> الان ارسل الاسم  للبوت "
end
-------[/start and welcom and save user id ]-----------
if r=="/start" and msg.to.type == 'pv'  then
if we_sudo(msg) then
local text = '🎖¦ آهہ‏‏لآ عزيزي آلمـطـور 🍃\n💰¦ آنتهہ‏‏ آلمـطـور آلآسـآسـي هہ‏‏نآ 🛠\n...\n\n🚸¦ تسـتطـيع‏‏ آلتحگم بگل آلآوآمـر آلمـمـوجودهہ‏‏ بآلگيبورد\n⚖️¦ فقط آضـغط ع آلآمـر آلذي تريد تنفيذهہ‏‏'

local keyboard = {
 {"ضع اسم للبوت ✔️","وضع صوره للترحيب "},
 {"تعطيل التواصل ✖️","تفعيل التواصل ✔️"},
 {"المطورين 🕵‍♂","ايدي 🆔","الاحصائيات ♻️"},
 {"اضف رد عام 🔱","الردود العامه 💬"},
 {"الملفات 🗂","اذاعه عام بالتوجيه 🔊"},
 {"اذاعه ☑️","اذاعه عام 📢","اذاعه خاص 📩"},
 {"تحديث ♻️","قائمه العام 📄","قناة السورس ✔️"},
 {"تحديث السورس 🛠"},
 {"الغاء الامر ❌"}}
return send_inline_key(msg.from.id,text,keyboard)
else
 redis:sadd(boss..'users',msg.from.id)
local text = [[💯¦ مـرحبآ آنآ بوت آسـمـي ]]..BOT_NAME..[[ 🎖
💰¦ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
📛¦ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
🚸¦ فقط آلمـطـور يسـتطـيع تفعيل آلبوت
⚖️¦ مـعرف آلمـطـور  : ]]..SUDO_USER..[[

👨🏽‍🔧]]
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="آلمـطـور ™",url="t.me/"..xsudouser}}}
return send_inline_key(msg.from.id,text,nil,inline)
end end
if (msg.to.type == "pv") and is_sudo(msg) then -- ارسال الرساله بالخاص عبر رد على التوجيه
if msg.reply_id then
function get_msg_id(arg, data)
function replay_fwd(arg,data)
if data.forward_info_ then
function infousers(arg,data)
if data.username_ then user_name = '@'..data.username_ else user_name = data.first_name_ end
sendMsg(arg.user_id,0,'['..r..']','md')
sendMsg(msg.from.id,msg.id_,"📬¦ تم آرسـآل آلرسـآل‏‏هہ 🌿\n🎟¦ آلى : "..user_name.." 🏌🏻",'html') end
tdcli_function({ID ='GetUser',user_id_ = data.forward_info_.sender_user_id_}, infousers, {user_id=data.forward_info_.sender_user_id_})  end end
tdcli_function({ID ='GetMessage',chat_id_=msg.chat_id_,message_id_=data.id_},replay_fwd,nil) end
tdcli_function({ID ='GetMessage',chat_id_=msg.chat_id_,message_id_=msg.reply_to_message_id_},get_msg_id,nil)
end end
if (msg.to.type == "pv") and not we_sudo(msg) and not redis:get(boss..'lock_twasel') and msg.from.id ~= our_id then -- ارسال رساله للاعضاء الي يدخلون خاص
sendMsg(msg.to.id,0,"🗯¦ تم آرسـآل رسـآلتگ آلى آلمـطـور\n📬¦ سـآرد عليگ في آقرب وقت\n🏌 "..SUDO_USER,'md')
forwardMessages(SUDO_ID,msg.to.id,{[0] = msg.id_},0)
end
if (r=="تيست" or r=="test") and is_sudo(msg) then return "💯 البوت شـغــال 🚀" end
if (r== "ايدي" or r=="ايدي 🆔") and msg.to.type == "pv" then return  "\n"..msg.from.id.."\n"  end
if r== "قناة السورس 📡" and msg.to.type == "pv" then
local inline = {{{text="قنآهہ‏‏ آلسـورس : بوبي ✔",url="t.me/aws_c9"}}}
return send_inline_key(msg.from.id,'  [قناة السورس : بوبي](t.me/aws_c9)',nil,inline)
end
if (r== "الاحصائيات 📈" or r=="الاحصائيات") and is_sudo(msg) then
local group = redis:smembers(boss..'group:ids')
local pv = redis:smembers(boss..'users')
return 'الاحصائيات : 📈 \n\n👥*¦* عدد المجموعات المفعله : '..#group..'\n👤*¦* عدد المشتركين في البوت : '..#pv..'\n📡'
end
---------------[End Function data] -----------------------
if r=="اضف رد عام" or r=="اضف رد عام ➕" then
if not we_sudo(msg) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
redis:setex(boss..'addrd_all:'..msg.to.id..msg.from.id,300 , true)
redis:del(boss..'allreplay:'..msg.to.id..msg.from.id)
return "📭¦ حسننا الان ارسل كلمة الرد العام 🍃\n"
end
------------------------------------------------------
if msg.text and not msg.text~='الغاء الامر ✖️' and not msg.text~='الغاء الامر'  and not msg.text~='الغاء' then
if redis:get(boss..'namebot:witting'..msg.from.id) then --- استقبال اسم البوت 
redis:del(boss..'namebot:witting'..msg.from.id)
redis:set(boss..'bot:name',msg.text)
reload_plugins() 
return "📭¦ تم تغير اسم البوت  ✋🏿\n🗯¦ الان اسمه `"..msg.text.."` \n✓"
end
if redis:get(boss..'addrd_all:'..msg.to.id..msg.from.id) then -- استقبال الرد لكل المجموعات
if not redis:get(boss..'allreplay:'..msg.to.id..msg.from.id) then-- استقبال كلمه الرد لكل المجموعات
redis:hdel(boss..'replay_photo:group:',msg.text)
redis:hdel(boss..'replay_voice:group:',msg.text)
redis:hdel(boss..'replay_animation:group:',msg.text)
redis:hdel(boss..'replay_audio:group:',msg.text)
redis:hdel(boss..'replay_sticker:group:',msg.text)
redis:hdel(boss..'replay_video:group:',msg.text)
redis:setex(boss..'allreplay:'..msg.to.id..msg.from.id,300,msg.text)
return "📜¦ جيد , يمكنك الان ارسال جوا ب الردالعام \n🔛¦ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] ✓\n-" 
end
if redis:get(boss..'allreplay:'..msg.to.id..msg.from.id) then -- استقبال جواب الرد لكل المجموعات
redis:hset(boss..'replay:all', redis:get(boss.."allreplay:"..msg.to.id..msg.from.id),msg.text)
redis:del(boss..'addrd_all:'..msg.to.id..msg.from.id)
return '(['..redis:get(boss..'allreplay:'..msg.to.id..msg.from.id)..'])\n  ✓ تم اضافت الرد لكل المجموعات 🚀 '
end end
-------------------------------------------------------------
if redis:get(boss..'addrd:'..msg.to.id..msg.from.id) then -- استقبال الرد للمجموعه فقط
if not redis:get(boss..'replay1'..msg.to.id..msg.from.id) then  -- كلمه الرد
redis:hdel(boss..'replay:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_photo:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_voice:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_animation:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_audio:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_sticker:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_video:group:'..msg.to.id,msg.text)
redis:setex(boss..'replay1'..msg.to.id..msg.from.id,300,msg.text)
return "📜¦ جيد , يمكنك الان ارسال جواب الرد \n🔛¦ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] ✓\n-" 
end
if redis:get(boss..'replay1'..msg.to.id..msg.from.id) then -- جواب الرد
redis:hset(boss..'replay:'..msg.to.id, redis:get(boss.."replay1"..msg.to.id..msg.from.id),msg.text)
redis:del(boss..'addrd:'..msg.to.id..msg.from.id)
return '(['..redis:get(boss..'replay1'..msg.to.id..msg.from.id)..'])\n  ✓ تم اضافت الرد 🚀 \n-'
end end
if redis:get(boss..'delrd:'..msg.from.id) then
redis:del(boss..'delrd:'..msg.from.id)
local names = redis:hget(boss..'replay:'..msg.to.id,msg.text)
local photo =redis:hget(boss..'replay_photo:group:'..msg.to.id,msg.text)
local voice = redis:hget(boss..'replay_voice:group:'..msg.to.id,msg.text)
local animation = redis:hget(boss..'replay_animation:group:'..msg.to.id,msg.text)
local audio = redis:hget(boss..'replay_audio:group:'..msg.to.id,msg.text)
local sticker = redis:hget(boss..'replay_sticker:group:'..msg.to.id,msg.text)
local video = redis:hget(boss..'replay_video:group:'..msg.to.id,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return '💬*¦* هذا الرد ليس مضاف في قائمه الردود 📛'
else
redis:hdel(boss..'replay:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_photo:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_voice:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_audio:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_animation:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_sticker:group:'..msg.to.id,msg.text)
redis:hdel(boss..'replay_video:group:'..msg.to.id,msg.text)
return '(['..msg.text..'])\n  ✓ تم مسح الرد 🚀 '
end end
if redis:get(boss..'delrdall:'..msg.from.id) then
redis:del(boss..'delrdall:'..msg.from.id)
local names = redis:hget(boss..'replay:all',msg.text)
local photo =redis:hget(boss..'replay_photo:group:',msg.text)
local voice = redis:hget(boss..'replay_voice:group:',msg.text)
local animation = redis:hget(boss..'replay_animation:group:',msg.text)
local audio = redis:hget(boss..'replay_audio:group:',msg.text)
local sticker = redis:hget(boss..'replay_sticker:group:',msg.text)
local video = redis:hget(boss..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return '💬*¦* هذا الرد ليس مضاف في قائمه الردود 📛'
else
redis:hdel(boss..'replay:all',msg.text)
redis:hdel(boss..'replay_photo:group:',msg.text)
redis:hdel(boss..'replay_voice:group:',msg.text)
redis:hdel(boss..'replay_audio:group:',msg.text)
redis:hdel(boss..'replay_animation:group:',msg.text)
redis:hdel(boss..'replay_sticker:group:',msg.text)
redis:hdel(boss..'replay_video:group:',msg.text)
return '(['..msg.text..'])\n  ✓ تم مسح الرد 🚀 '
end end end
if r== 'مسح الردود' then
if not is_owner(msg) then return"♨️ للمدراء فقط ! 💯" end
local names = redis:hkeys(boss..'replay:'..msg.to.id)
local photo =redis:hkeys(boss..'replay_photo:group:'..msg.to.id)
local voice = redis:hkeys(boss..'replay_voice:group:'..msg.to.id)
local animation = redis:hkeys(boss..'replay_animation:group:'..msg.to.id)
local audio = redis:hkeys(boss..'replay_audio:group:'..msg.to.id)
local sticker = redis:hkeys(boss..'replay_sticker:group:'..msg.to.id)
local video = redis:hkeys(boss..'replay_video:group:'..msg.to.id)
if #names==0 and #photo==0 and #voice==0 and #animation==0 and #audio==0 and #sticker==0 and #video==0 then
return '🚸*¦* لا يوجد ردود ليتم مسحها \n❕'
end
for i=1, #names do redis:hdel(boss..'replay:'..msg.to.id,names[i]) end
for i=1, #photo do redis:hdel(boss..'replay_photo:group:'..msg.to.id,photo[i]) end
for i=1, #voice do redis:hdel(boss..'replay_voice:group:'..msg.to.id,voice[i]) end
for i=1, #animation do redis:hdel(boss..'replay_animation:group:'..msg.to.id,animation[i]) end
for i=1, #audio do redis:hdel(boss..'replay_audio:group:'..msg.to.id,audio[i]) end
for i=1, #sticker do redis:hdel(boss..'replay_sticker:group:'..msg.to.id,sticker[i]) end
for i=1, #video do redis:hdel(boss..'replay_video:group:'..msg.to.id,video[i]) end
return "✓ تم مسح كل الردود 🚀"
end
if r== 'مسح الردود العامه' then
if not is_sudo(msg) then return"♨️ للمطورين فقط ! 💯" end
local names = redis:hkeys(boss..'replay:all')
local photo =redis:hkeys(boss..'replay_photo:group:')
local voice = redis:hkeys(boss..'replay_voice:group:')
local animation = redis:hkeys(boss..'replay_animation:group:')
local audio = redis:hkeys(boss..'replay_audio:group:')
local sticker = redis:hkeys(boss..'replay_sticker:group:')
local video = redis:hkeys(boss..'replay_video:group:')
for i=1, #names do redis:hdel(boss..'replay:all',names[i]) end
for i=1, #photo do redis:hdel(boss..'replay_photo:group:',photo[i]) end
for i=1, #voice do redis:hdel(boss..'replay_voice:group:',voice[i]) end
for i=1, #animation do redis:hdel(boss..'replay_animation:group:',animation[i]) end
for i=1, #audio do redis:hdel(boss..'replay_audio:group:',audio[i]) end
for i=1, #sticker do redis:hdel(boss..'replay_sticker:group:',sticker[i]) end
for i=1, #video do redis:hdel(boss..'replay_video:group:',video[i]) end
return "✓ تم مسح كل الردود العامه🚀"
end
if r== 'مسح رد عام' then
if not is_sudo(msg) then return"♨️ للمطورين فقط ! 💯" end
redis:set(boss..'delrdall:'..msg.from.id,true) return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الرد لمسحها من  المجموعات 🍃"
end
if r== 'مسح رد' then
if not is_owner(msg) then return"♨️ للمدراء فقط ! 💯" end redis:set(boss..'delrd:'..msg.from.id,true)
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الرد لمسحها من  للمجموعه 🍃"
end
if r== 'الردود' and is_owner(msg) then
local names = redis:hkeys(boss..'replay:'..msg.to.id)
local photo =redis:hkeys(boss..'replay_photo:group:'..msg.to.id)
local voice = redis:hkeys(boss..'replay_voice:group:'..msg.to.id)
local animation = redis:hkeys(boss..'replay_animation:group:'..msg.to.id)
local audio = redis:hkeys(boss..'replay_audio:group:'..msg.to.id)
local sticker = redis:hkeys(boss..'replay_sticker:group:'..msg.to.id)
local video = redis:hkeys(boss..'replay_video:group:'..msg.to.id)
if #names==0 and #photo==0 and #voice==0 and #animation==0 and #audio==0 and #sticker==0 and #video==0 then return '🚸*¦* لا يوجد ردود مضافه حاليا \n❕' end
local ii = 1
local message = '💬*¦* ردود البوت في المجموعه  :\n\n'
for i=1, #photo do message = message ..ii..' - *{* '..photo[i]..' *}_*( صوره 🏞 ) \n' ii = ii + 1 end
for i=1, #names do message = message ..ii..' - *{* '..names[i]..' *}_*( نص 🗯 ) \n' ii = ii + 1 end
for i=1, #voice do message = message ..ii..' - *{* '..voice[i]..' *}_*( بصمه 🎙 ) \n' ii = ii + 1 end
for i=1, #animation do message = message ..ii..' - *{* '..animation[i]..' *}_*( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio do message = message ..ii..' - *{* '..audio[i]..' *}_*( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' ii = ii + 1 end
for i=1, #video do message = message ..ii..' - *{* '..video[i]..' *}_*( فيديو  🎞 ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end
if (r== 'الردود العامه' or r=='الردود العامه 🗨') and is_sudo(msg) then
local names = redis:hkeys(boss..'replay:all')
local photo =redis:hkeys(boss..'replay_photo:group:')
local voice = redis:hkeys(boss..'replay_voice:group:')
local animation = redis:hkeys(boss..'replay_animation:group:')
local audio = redis:hkeys(boss..'replay_audio:group:')
local sticker = redis:hkeys(boss..'replay_sticker:group:')
local video = redis:hkeys(boss..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #animation==0 and #audio==0 and #sticker==0 and #video==0 then return '🚸*¦* لا يوجد ردود مضافه حاليا \n❕' end
local ii = 1
local message = '💬*¦* الردود العامه في البوت :   :\n\n'
for i=1, #photo do message = message ..ii..' - *{* '..photo[i]..' *}_*( صوره 🏞 ) \n' ii = ii + 1 end
for i=1, #names do message = message ..ii..' - *{* '..names[i]..' *}_*( نص 🗯 ) \n' ii = ii + 1 end
for i=1, #voice do message = message ..ii..' - *{* '..voice[i]..' *}_*( بصمه 🎙 ) \n' ii = ii + 1 end
for i=1, #animation do message = message ..ii..' - *{* '..animation[i]..' *}_*( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio do message = message ..ii..' - *{* '..audio[i]..' *}_*( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' ii = ii + 1 end
for i=1, #video do message = message ..ii..' - *{* '..video[i]..' *}_*( فيديو  🎞 ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end
if not redis:get(boss..'group:add'..msg.to.id) then return end
if r=="اضف رد" then
if not is_owner(msg) then return"♨️ للمدراء فقط ! 💯" end
redis:setex(boss..'addrd:'..msg.to.id..msg.from.id,300,true) redis:del(boss..'replay1'..msg.to.id..msg.from.id)
return "📭¦ حسننا , الان ارسل كلمه الرد \n-"
end
if r== "اسمي"  then return  "\n" ..check_name(msg.from.first_name).."\n" 
elseif r== "معرفي" then return  "@["..(msg.from.username or " ---").."]\n" 
elseif r== "ايديي" or r=="ايدي 🆔" then return "🧟‍♂*¦* آضـغط على آلآيدي ليتم آلنسـخ\n\n @["..msg.from.username.."] ~⪼ ( `"..msg.from.id.."` )"
elseif r=="صورتي" then
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.from.id,offset_ = 0,limit_ = 1}, function(arg, data)
if data.photos_[0] then sendPhoto(msg.to.id,msg.id_,0,1,nil,data.photos_[0].sizes_[1].photo_.persistent_id_,"",dl_cb,nil)
else sendMsg(msg.to.id,msg.id_,"🚸¦ لا يوجد صوره في بروفايلك ...\n-",'md')
end end, nil)
elseif r=="اريد رابط الحذف" or r=="اريد رابط حذف" or r=="رابط حذف" or r=="رابط الحذف" then
return [[
~> رابط حذف حـساب التليجرام 

 https://telegram.org/deactivate
]] 
end
if msg.text and redis:get(boss..'replay'..msg.to.id) and msg.to.type == "channel" then
-- by @boss
local su = {"نعم حبيبي المطور 🌝❤","يابعد روح "..BOT_NAME.." 😘❤️","هلا بمطوري العشق أمرني"}
local  ss97 = {"ها حياتي😻","عيونه 👀 وخشمه 👃🏻واذانه👂🏻","باقي ويتمدد 😎","ها حبي 😍","ها عمري 🌹","اجيت اجيت كافي لتصيح 🌚👌","هياتني اجيت 🌚❤️","نعم حبي 😎","هوه غير يسكت عاد ها شتريد 😷","احجي بسرعه شتريد 😤","ها يا كلبي ❤️","هم صاحو عليه راح ابدل اسمي من وراكم 😡","لك فداك "..BOT_NAME.." حبيبي انت اموووح 💋","دا اشرب جاي تعال غير وكت 😌","كول حبيبي أمرني 😍","احجي فضني شرايد ولا اصير ضريف ودكلي جرايد لو مجلات تره بايخه 😒😏","اشتعلو اهل "..BOT_NAME.." شتريد 😠","بووووووووو 👻 ها ها فزيت شفتك شفتك لا تحلف 😂","طالع مموجود 😒","هااا شنوو اكو حاته بالكروب وصحت عليه  😍💕","انت مو قبل يومين غلطت عليه؟  😒","راجع المكتب حبيبي عبالك "..BOT_NAME.." سهل تحجي ويا 😒","ياعيون "..BOT_NAME.." أمرني 😍","لك دبدل ملابسي اطلع برااااا 😵😡 ناس متستحي","سويت هواي شغلات سخيفه بحياتي بس عمري مصحت على واحد وكلتله انجب 😑","مشغول ويا ضلعتي  ☺️","مازا تريد منه 😌🍃",}
local bs = {"مابوس 🌚💔","اآآآم͠ــ.❤️😍ــو͠و͠و͠آ͠آ͠ح͠❤️عسسـل❤️","الوجه ميساعد 😐✋","ممممح😘ححح😍😍💋",}
local ns = {"🌹 هــلــℌelℓoووات🌹عمـ°🌺°ــري🙊😋","هْـٌﮩٌﮧٌ﴿🙃﴾ﮩٌـ୭ٌ୭ـْلوُّات†😻☝️","هلاوو99وووات نورت/ي ❤️🙈","هلووات 😊🌹",}
local sh = {"اهلا عزيزي المطور 😽❤️","هلوات . نورت مطوري 😍",}
local lovm = {"اكرهك 😒👌🏿","دي 😑👊🏾","اعشكك/ج مح 😍💋","اي احبك/ج 😍❤️","ماحبك/ج 😌🖖","امـــوت فيك ☹️","اذا كتلك/ج احبك/ج شراح تستفاد/ين 😕❤️","ولي ماحبك/ج 🙊💔",}
local thb = {"اموت عليه-ه 😻😻","فديته-ه 😍❤️","لا ماحبه-ه 🌚💔","اكرهه 💔🌚","يييع 😾👊🏿","مادري افڱﮩﮩﮩر🐸💔"}
local song = {"عمي يبو البار 🤓☝🏿️ \nصبلي لبلبي ترى اني سكران 😌 \n وصاير عصبي 😠 \nانه وياج يم شامه 😉 \nوانه ويــــاج يم شامه  شد شد  👏🏿👏🏿 \nعدكم سطح وعدنه سطح 😁 \n نتغازل لحد الصبح 😉 \n انه وياج يم شامه 😍 \n وانه وياج فخريه وانه وياج حمديه 😂🖖🏿\n ","اي مو كدامك مغني قديم 😒🎋 هوه ﴿↜ انـِۨـۛـِۨـۛـِۨيـُِـٌِہۧۥۛ ֆᵛ͢ᵎᵖ ⌯﴾❥  ربي كامز و تكلي غنيلي 🙄😒🕷 آإرۈحُـ✯ـہ✟  😴أنــ💤ــااااام😴  اشرف تالي وكت يردوني اغني 😒☹️🚶","لا تظربني لا تظرب 💃💃 كسرت الخيزارانه💃🎋 صارلي سنه وست اشهر💃💃 من ظربتك وجعانه🤒😹","موجوع كلبي😔والتعب بية☹️من اباوع على روحي😢ينكسر كلبي عليه😭","ايامي وياها👫اتمنا انساها😔متندم اني حيل😞يم غيري هيه💃تضحك😂عليه😔مقهور انام الليل😢كاعد امسح بل رسائل✉️وجان اشوف كل رسايلها📩وبجيت هوايه😭شفت احبك😍واني من دونك اموت😱وشفت واحد 🚶صار هسه وياية👬اني رايدها عمر عمر تعرفني كل زين🙈 وماردت لا مصلحة ولاغايه😕والله مافد يوم بايسها💋خاف تطلع🗣البوسه💋وتجيها حجايه😔️","😔صوتي بعد مت سمعه✋يال رايح بلا رجعة🚶بزودك نزلت الدمعة ذاك اليوم☝️يال حبيتلك ثاني✌روح وياه وضل عاني😞يوم اسود علية اني🌚 ذاك اليوم☝️تباها بروحك واضحك😂لان بجيتلي عيني😢😭 وافراح يابعد روحي😌خل الحركة تجويني😔🔥صوتي بعد متسمعة🗣✋",}
if redis:get(boss..":msg_id"..msg.to.id) then
if msg.reply_id then  msgx_id = msg.reply_id  else msgx_id = false end else msgx_id = msg.id_  end
if msgx_id then
if redis:hget(boss..'replay:all',r) then return sendMsg(msg.to.id,msgx_id,"["..redis:hget(boss..'replay:all',r).."]",'md')
elseif redis:hget(boss..'replay_photo:group:',r) then return sendPhoto(msg.to.id,msgx_id,0,1,nil,redis:hget(boss..'replay_photo:group:',r))  
elseif redis:hget(boss..'replay_voice:group:',r) then return sendVoice(msg.to.id,msgx_id,0,1,nil,redis:hget(boss..'replay_voice:group:',r))
elseif redis:hget(boss..'replay_animation:group:',r) then return sendAnimation(msg.to.id,msgx_id,0,1, nil,redis:hget(boss..'replay_animation:group:',r))  
elseif redis:hget(boss..'replay_audio:group:',r) then return sendAudio(msg.to.id,msgx_id,0,1,nil,redis:hget(boss..'replay_audio:group:',r))  
elseif redis:hget(boss..'replay_sticker:group:',r) then return sendSticker(msg.to.id,msgx_id,0,1,nil,redis:hget(boss..'replay_sticker:group:',r))  
elseif redis:hget(boss..'replay_video:group:',r) then return sendVideo(msg.to.id,msgx_id,0,1,nil,redis:hget(boss..'replay_video:group:',r))
--==============================
elseif redis:hget(boss..'replay_photo:group:'..msg.to.id,r) then return sendPhoto(msg.to.id,msgx_id,0,1,nil,redis:hget(boss..'replay_photo:group:'..msg.to.id, r))  
elseif redis:hget(boss..'replay_voice:group:'..msg.to.id,r) then return sendVoice(msg.to.id,msgx_id,0,1,nil,redis:hget(boss..'replay_voice:group:'..msg.to.id, r))
elseif redis:hget(boss..'replay_animation:group:'..msg.to.id,r) then return sendAnimation(msg.to.id,msgx_id,0,1, nil,redis:hget(boss..'replay_animation:group:'..msg.to.id, r))  
elseif redis:hget(boss..'replay_audio:group:'..msg.to.id,r) then return sendAudio(msg.to.id,msgx_id,0,1,nil,redis:hget(boss..'replay_audio:group:'..msg.to.id, r))  
elseif redis:hget(boss..'replay_sticker:group:'..msg.to.id,r) then return sendSticker(msg.to.id,msgx_id,0,1,nil,redis:hget(boss..'replay_sticker:group:'..msg.to.id, r))  
elseif redis:hget(boss..'replay_video:group:'..msg.to.id,r) then return sendVideo(msg.to.id,msgx_id,0,1,nil, redis:hget(boss..'replay_video:group:'..msg.to.id, r))
elseif redis:hget(boss..'replay:'..msg.to.id,r) then return sendMsg(msg.to.id,msgx_id,"["..redis:hget(boss..'replay:'..msg.to.id, r).."]",'md') 
end else
if redis:hget(boss..'replay:all',r) or redis:hget(boss..'replay_photo:group:'..msg.to.id,r) or redis:hget(boss..'replay_voice:group:'..msg.to.id,r) or redis:hget(boss..'replay_animation:group:'..msg.to.id,r) or redis:hget(boss..'replay_audio:group:'..msg.to.id,r) or  redis:hget(boss..'replay_sticker:group:'..msg.to.id,r) or redis:hget(boss..'replay_video:group:'..msg.to.id,r) or redis:hget(boss..'replay:'..msg.to.id,r) then
return "📛*¦* هذا الامر يعمل بالرد فقط ..!"
end end 
if is_sudo(msg) and r== BOT_NAME and not r2 then  return  su[math.random(#su)]  
elseif not is_sudo(msg) and r== BOT_NAME and not r2 then  return  ss97[math.random(#ss97)]  
elseif r== "كول" and r2 then
if string.len(r2) > 80 then return "💢¦ ما اكدر اكول اكثر من 60 حرف 🙌🏾" end
if check_name(r2)~='الاسم سبام 📛' then
return sendMsg(msg.to.id,0,'*'..r2..'*','md') end
elseif r== "كله" and r2 then
if string.len(r2) > 80 then return "💢¦ ما اكدر اكله اكثر من 60 حرف 🙌🏾" end
if check_name(r2)~='الاسم سبام 📛' then
if msg.reply_id then return sendMsg(msg.to.id,msg.reply_id,'`'..r2..'`','md') end end
elseif r== BOT_NAME.."اتفل" and r2 then
if msg.reply_id then
sendMsg(msg.to.id,msg.id_,'اوك سيدي 🌝🍃','md')
sendMsg(msg.to.id,msg.reply_id,'ختفوووووووووو💦💦️️','md')
else return"  🕵🏻 وينه بله سويله رد 🙄" end
elseif r== BOT_NAME.." رزله" and r2 and is_sudo(msg) then
if msg.reply_id then
sendMsg(msg.to.id,msg.id_,'اوك سيدي 🌝🍃','md')
sendMsg(msg.to.id,msg.reply_id,'يا ول شو طالعة عينك😒 من البنات مو😪و هم صايرلك لسان تحجي😠اشو تعال👋👊صير حباب مرة ثانية ترةة ...😉و لا تخليني البسك عمامة و اتفل عليك😂️','md') end
elseif r== "بوس" and r2 then if msg.reply_id then return  bs[math.random(#bs)]  else return "📌 وينه بله سويله رد 🕵🏻" end 
elseif r== "تحب" and r2 then return  thb[math.random(#thb)] 
elseif is_sudo(msg) and r=="هلو" then return  sh[math.random(#sh)]  
elseif not is_sudo(msg) and r=="هلو" then return  ns[math.random(#ns)]  
elseif is_sudo(msg) and r== "احبك" then return  "اموت عليك حياتي  😍❤️"
elseif is_sudo(msg) and r== "تحبني" or r=="حبك"  then return  "اموت عليك حياتي  😍❤️"
elseif not is_sudo(msg) and r== "احبك" or r=="حبك" then return  lovm[math.random(#lovm)]  
elseif not is_sudo(msg) and r== "تحبني" then return  lovm[math.random(#lovm)]  
elseif r== "غني" or r=="غنيلي" then return  song[math.random(#song)] 
elseif r=="اتفل" or r=="تفل" then
if is_mod(msg) then return 'ختفوووووووووو💦💦️️' else return "📌 انجب ما اتفل عيب 😼🙌🏿" end
elseif r== "تف" then return  "عيب ابني/بتي اتفل/ي اكبر منها شوية 😌😹"
elseif r== "شلونكم" or r== "شلونك" or r== "شونك" or r== "شونكم"   then return  "احســن مــن انتهــــہ شــلونـــك شــخــبـارك يـــول مۂــــشتـــاقـــلك شــو ماكـــو 😹🌚"
elseif r== "صاكه"  then return  "اووويلي يابه 😍❤️ دزلي صورتهه 🐸💔"
elseif r== "وينك"  then return   "دور بكلبك وتلكاني 😍😍❤️"
elseif r== "منورين"  then return  "من نورك عمري ❤️🌺"
elseif r== "هاي"  then return  "هايات عمري 😍🍷"
elseif r== "🙊"  then return  "فديت الخجول 🙊 😍"
elseif r== "😢"  then return  "لتبجي حياتي 😢"
elseif r== "😭"  then return  "لتبجي حياتي 😭😭"
elseif r== "منور"  then return  "نِْـِْـــِْ([💡])ِْــــًِـًًْـــِْـِْـِْـورِْكِْ"
elseif r== "😒" and not is_sudo then return  "شبيك-ج عمو 🤔"
elseif r== "مح"  then return  "محات حياتي🙈❤"
elseif r== "شكرا" or r== "ثكرا" then return  "{ •• الـّ~ـعـفو •• }"
elseif r== "انته وين"  then return  "بالــبــ🏠ــيــت"
elseif r== "😍"  then return  " يَمـه̷̐ إآلُحــ❤ــب يَمـه̷̐ ❤️😍"
elseif r== "اكرهك"  then return  "ديله شلون اطيق خلقتك اني😾🖖🏿🕷"
elseif r== "اريد اكبل"  then return  "خخ اني هم اريد اكبل قابل ربي وحد😹🙌️"
elseif r== "ضوجه"  then return  "شي اكيد الكبل ماكو 😂 لو بعدك/ج مازاحف/ة 🙊😋"
elseif r== "اروح اصلي"  then return  "انته حافظ سوره الفاتحة😍❤️️"
elseif r== "صاك"  then return  "زاحفه 😂 منو هذا دزيلي صورهه"
elseif r== "اجيت" or r=="اني اجيت" then return  "كْـٌﮩٌﮧٌ﴿😍﴾ـﮩٌول الـ୭ـهـٌ୭ـْلا❤️"
elseif r== "طفي السبلت"  then return  "تم اطفاء السبلت بنجاح 🌚🍃"
elseif r== "شغل السبلت"  then return  "تم تشغيل السبلت بنجاح بردتو مبردتو معليه  🌚🍃"
elseif r== "حفلش"  then return  "افلش راسك 🤓"
elseif r=="نايمين" then return  "ني سهران احرسكـم😐🍃'"
elseif r=="اكو احد" then return  "يي عيني انـي موجـود🌝🌿"
elseif r=="شكو" then return  "كلشي وكلاشي🐸تگـول عبالك احنـة بالشورجـة🌝"
elseif r=="انتة منو" then return  "آني كـامل مفيد اكبر زنگين أگعدة عالحديـد🙌"
elseif r=="كلخرا" then return  "خرا ليترس حلكك/ج ياخرا يابنلخرا خختفووو ابلع😸🙊💋"
elseif r== "حبيبتي" then return  "منو هاي 😱 تخوني 😔☹"
elseif r== "حروح اسبح" then return  "واخيراً 😂"
elseif r== "😔"  then return  "ليش الحلو ضايج ❤️🍃"
elseif r== "☹️"  then return  "لضوج حبيبي 😢❤️🍃"
elseif r== "جوعان"  then return  "تعال اكلني 😐😂"
elseif r== "تعال خاص" or r== "خاصك" or r=="شوف الخاص" or r=="شوف خاص" then return  "ها شسون 😉"
elseif r== "لتحجي"  then return  "وانت شعليك حاجي من حلگگ😒"
elseif r== "معليك" or r== "شعليك" then return  "عليه ونص 😡"
elseif r== "شدسون" or r== "شداتسوون" or r== "شدتسون" then return  "نطبخ 😐"
elseif r== BOT_NAME and r2=="شلونك" then return "احســن مــن انتهــــہ شــلونـــك شــخــبـارك يـــول مۂــــشتـــاقـــلك شــو ماكـــو 😹🌚"
elseif r== "يومه فدوه"  then return  "فدؤه الج حياتي 😍😙"
elseif r== "افلش"  then return  "باند عام من 30 بوت 😉"
elseif r== "احبج"  then return  "يخي احترم شعوري 😢"
elseif r== "شكو ماكو"  then return  "غيرك/ج بل كلب ماكو يبعد كلبي😍❤️️"
elseif r== "اغير جو"  then return  "😂 تغير جو لو تسحف 🐍 عل بنات"
elseif r== "😋"  then return  "طبب لسانك جوه عيب 😌"
elseif r== "😡"  then  return  "ابرد  🚒"  
elseif r== "مرحبا"  then return  "مراحب 😍❤️ نورت-ي 🌹"
elseif r== "سلام" or r== "السلام عليكم" or r== "سلام عليكم" or r=="سلامن عليكم" or r=="السلامن عليكم" then return  "وعليكم السلام اغاتي🌝👋" 
elseif r== "واكف"  then return  "يخي مابيه شي ليش تتفاول😢" 
elseif r== "🚶🏻"  then return  "لُـﮩـضڵ تتـمشـﮥ اڪعـد ﺳـﯠڵـف 🤖👋🏻"
elseif r== "البوت واكف" then return  "هياتني 😐"
elseif r== "ضايج"  then return  "ليش ضايج حياتي"
elseif r== "ضايجه"  then return  "منو مضوجج كبدايتي"
elseif r== "😳" or r== "😳😳" or r== "😳😳😳" then return  "ها بس لا شفت خالتك الشكره 😳😹🕷"
elseif r== "صدك"  then return  "قابل اجذب عليك!؟ 🌚"
elseif r== "شغال"  then return  "نعم عزيزي باقي واتمدد 😎🌿"
elseif r== "تخليني"  then return  "اخليك بزاويه 380 درجه وانته تعرف الباقي 🐸"
elseif r== "فديتك" or r== "فديتنك"  then return  "فداكـ/چ ثولان العالـم😍😂" 
elseif r== "بوت"  then return  "أسمي "..BOT_NAME.." 🌚🌸"
elseif r== "مساعدة"  then return  "لعرض قائمة المساعدة اكتب الاوامر 🌚❤️"
elseif r== "زاحف"  then return  "زاحف عله خالتك الشكره 🌝"
elseif r== "حلو"  then return  "انت الاحلى 🌚❤️"
elseif r== "تبادل"  then return  "كافي ملينه تبادل 😕💔"
elseif r== "عاش"  then return  "الحلو 🌝🌷"
elseif r== "مات"  then return  "أبو الحمامات 🕊🕊"
elseif r== "ورده" or r== "وردة"  then return  "أنت/ي  عطرها 🌹🌸"
elseif r== "شسمك"  then return  "مكتوب فوك 🌚🌿"
elseif r== "فديت" or r=="فطيت" then return  "فداك/ج 💞🌸"
elseif r== "واو"  then return  "قميل 🌝🌿"
elseif r== "زاحفه" or r== "زاحفة"  then return  "لو زاحفتلك جان ماكلت زاحفه 🌝🌸"
elseif r== "حبيبي" or r=="حبي" then return  "بعد روحي 😍❤️ تفضل"
elseif r== "حبيبتي" then return  "تحبك وتحب عليك 🌝🌷"
elseif r== "حياتي" then return  "ها حياتي 😍🌿"
elseif r== "عمري" then return  "خلصته دياحه وزحف 🌝🌿 "
elseif r== "اسكت" then return  "وك معلم 🌚💞"
elseif r== "بتحبني" then return  "بحبك اد الكون 😍🌷"
elseif r== "المعزوفه" or r=="المعزوفة" or r=="معزوفه" then return  "طرطاا طرطاا طرطاا 😂👌"
elseif r== "موجود" then return  "تفضل عزيزي 🌝🌸"
elseif r== "اكلك" then return  ".كول حياتي 😚🌿"
elseif r== "فدوه" or r=="فدوة" or r=="فطوه" or r=="فطوة" then  return  "لكلبك/ج 😍❤️"
elseif r== "دي"  then return  "خليني احہۣۗبہۜۧ😻ہہۖۗڱֆ ̮⇣  🌝💔"
elseif r== "اشكرك" then return  "بخدمتك/ج حبي ❤"
elseif r== "😉"  then return  "😻🙈"
elseif r== "اقرالي دعاء"  then return "اللهم عذب المدرسين 😢 منهم الاحياء والاموات 😭🔥 اللهم عذب ام الانكليزي 😭💔 وكهربها بلتيار الرئيسي 😇 اللهم عذب ام الرياضيات وحولها الى غساله بطانيات 🙊 اللهم عذب ام الاسلاميه واجعلها بائعة الشاميه 😭🍃 اللهم عذب ام العربي وحولها الى بائعه البلبي اللهم عذب ام الجغرافيه واجعلها كلدجاجه الحافية اللهم عذب ام التاريخ وزحلقها بقشره من البطيخ وارسلها الى المريخ اللهم عذب ام الاحياء واجعلها كل مومياء اللهم عذب المعاون اقتله بلمدرسه بهاون 😂😂😂"
elseif r== "انجب" or r== "نجب" or r=="جب" then
if is_sudo(msg) then  return   "حاضر تاج راسي انجبيت 😇 "
elseif is_owner(msg) then return   "لخاطرك راح اسكت لان مدير وع راسي  😌"
elseif is_mod(msg) then return   "فوك مامصعدك ادمن ؟؟ انته انجب 😏"
else return   "انجب انته لاتندفر 😏"
end end end  end
return {
patterns = {
"^("..BOT_NAME.." اتفل)(.*)$", 
"^("..BOT_NAME.." رزله)(.*)$", 
"^(بوس)(.*)$", 
"^(تحب) (.*)$",
"^("..BOT_NAME..") (.*)$",
"^(كله) (.*)$",
"^(كول) (.*)$",
"^(بوس) (.*)$", 
"(.*)" 
},
run = run,
}
end