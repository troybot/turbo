--[[
<< تم برمجه وكتابه السورس من قبل مطور >>
<<         @sajadhassan          >>
]]
local function pre_process(msg)
--====================== Reply Only Group =====================================
if redis:get(boss..'addrd:'..msg.to.id..msg.from.id) and redis:get(boss..'replay1'..msg.to.id..msg.from.id) then
local klma = redis:get(boss..'replay1'..msg.to.id..msg.from.id)
if msg.photo_ then 
redis:hset(boss..'replay_photo:group:'..msg.to.id,klma,photo_id)
redis:del(boss..'addrd:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~> تم اضافه صوره للرد بنجاح ✓\n✔️~> يمكنك ارسال ('..klma..') لاضهار الصوره الاتيه .','html')
elseif msg.voice_ then
redis:hset(boss..'replay_voice:group:'..msg.to.id,klma,voice_id)
redis:del(boss..'addrd:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~> تم اضافه بصمه صوت للرد بنجاح ✓\n✔️~> يمكنك ارسال ('..klma..') لسماع البصمه الاتيه .','html')
elseif msg.animation_ then
redis:hset(boss..'replay_animation:group:'..msg.to.id,klma,animation_id)
redis:del(boss..'addrd:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~> تم اضافه متحركه للرد بنجاح ✓\n✔️~> يمكنك ارسال ('..klma..') لاضهار الصوره الاتيه .','html')
elseif msg.video_ then
redis:hset(boss..'replay_video:group:'..msg.to.id,klma,video_id)
redis:del(boss..'addrd:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~> تم اضافه فيديو للرد بنجاح ✓\n✔️~> يمكنك ارسال ('..klma..') لاضهار الفيديو الاتي .','html')
elseif msg.audio_ then
redis:hset(boss..'replay_audio:group:'..msg.to.id,klma,audio_id)
redis:del(boss..'addrd:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~> تم اضافه للصوت للرد بنجاح ✓\n✔️~> يمكنك ارسال ('..klma..') لاضهار الصوت الاتي .','html')
elseif msg.sticker_ then
redis:hset(boss..'replay_sticker:group:'..msg.to.id,klma,sticker_id)
redis:del(boss..'addrd:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~> تم اضافه ملصق للرد بنجاح ✓\n✔️~> يمكنك ارسال ('..klma..') لاضهار الملصق الاتي .','html')
end  end
--====================== Reply All Groups =====================================
if redis:get(boss..'addrd_all:'..msg.to.id..msg.from.id) and redis:get(boss..'allreplay:'..msg.to.id..msg.from.id) then
local klma = redis:get(boss..'allreplay:'..msg.to.id..msg.from.id)
if msg.photo_ then 
redis:hset(boss..'replay_photo:group:',klma,photo_id)
redis:del(boss..'addrd_all:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~>  تم اضافه صوره للرد العام ✓\n✔️~>  يمكنك ارسال ('..klma..') لاضهار الصوره الاتيه .','html')
elseif msg.voice_ then
redis:hset(boss..'replay_voice:group:',klma,voice_id)
redis:del(boss..'addrd_all:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~>  تم اضافه بصمه صوت للرد العام ✓\n✔️~>  يمكنك ارسال ('..klma..') لسماع البصمه الاتيه .','html')
elseif msg.animation_ then
redis:hset(boss..'replay_animation:group:',klma,animation_id)
redis:del(boss..'addrd_all:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~>  تم اضافه متحركه للرد العام ✓\n✔️~>  يمكنك ارسال ('..klma..') لاضهار الصوره الاتيه .','html')
elseif msg.video_ then
redis:hset(boss..'replay_video:group:',klma,video_id)
redis:del(boss..'addrd_all:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~>  تم اضافه فيديو للرد العام ✓\n✔️~>  يمكنك ارسال ('..klma..') لاضهار الفيديو الاتي .','html')
elseif msg.audio_ then
redis:hset(boss..'replay_audio:group:',klma,audio_id)
redis:del(boss..'addrd_all:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~>  تم اضافه للصوت للرد العام ✓\n✔️~>  يمكنك ارسال ('..klma..') لاضهار الصوت الاتي .','html')
elseif msg.sticker_ then
redis:hset(boss..'replay_sticker:group:',klma,sticker_id)
redis:del(boss..'addrd_all:'..msg.to.id..msg.from.id)
return sendMsg(msg.to.id,msg.id_,'✔️~>  تم اضافه ملصق للرد العام ✓\n✔️~>  يمكنك ارسال ('..klma..') لاضهار الملصق الاتي .','html')
end  end
if msg.from.username then usernamex = "@"..msg.from.username else usernamex = check_name(namecut(msg.from.first_name)) end
local function check_newmember(arg, data)
if data.id_ == our_id and redis:get(boss..':WELCOME_BOT') then
return sendPhoto(arg.chat_id,arg.msg_id,0,1,nil,redis:get(boss..':WELCOME_BOT'),[[~>اهلا عزيزي في بوت   ]]..redis:get(boss..'bot:name')..[[ 

~>وظيفه البوت حمايه المجموعات من المخربين 🛠
~>البوت لايتوقف ابدأ ☑️
~>البوت لا يتخطى اي شيء🚷
~>فقط اضف بوت الى مجموعتك ورفعه ادمن وارسل تفعيل🔱
~•~•~•~•~•~•~•~•~•~•~•~•~•~•~•~•~•
~>مطور البوت🕵‍♂
 ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🕵️‍♂️]],dl_cb,nil)
end
if data.username_ then user_name = "@"..data.username_ else user_name = "---" end
------------------------------------------------------
if redis:get(boss..'group:add'..arg.chat_id) then
if data.type_.ID == "UserTypeBot" then -- حصانه التحقق من البوتات المضافه
if not is_owner1(arg.chat_id,arg.user_id) and redis:get(boss..'lock_bots_by_kick'..msg.to.id) then --- طرد البوت مع الي ضافه
kick_user(data.id_, arg.chat_id)
kick_user(arg.user_id, arg.chat_id)
sendMsg(arg.chat_id,0,'👤*¦* آلعضـو : ['..usernamex..']\n
🤖*¦* آلبوت : ['..user_name..']\n‼️¦ مـمـنوع اضافة البوتات هنا 😾👊\n🚷¦ تم طـرد آلبوت مـع آلعضـو 🚫\n✘',"md")    
elseif not is_owner1(arg.chat_id,arg.user_id) and redis:get(boss..'lock_bots'..msg.to.id) then
kick_user(data.id_, arg.chat_id)
if redis:get(boss..'lock_woring'..msg.to.id) then
return sendMsg(arg.chat_id,0,' 👤*¦* آلعضـو » ['..usernamex..']\n☑️*¦* الايدي »` '..arg.user_id..'`\n🤖*¦* البوت » ['..user_name..']\n‼️¦ مـمـنوع آضـآفه آلبوتآت 😾👊\n🚫¦ تم طـرد آلبوت\n✘',"md")   
end end else
if redis:get(boss..'welcome:get'..arg.chat_id) then
welcome = (redis:get(boss..'welcome:msg'..arg.chat_id) or "✔️*¦* اجه الكمر😻\n✔️*¦* نورت المجموعة😽 \n")
rules = (redis:get(boss..'rulse:msg'..arg.chat_id) or "🕵‍♂*¦* اهلا بك عزيزي 
~•~•~•~•~•~•~•~•~•~•~•~•~•~•القوانين💢\n🚫*¦* ممنوع نشر الروابط \n🚫*¦* ممنوع التكلم او نشر صور اباحيه \n🚫*¦* ممنوع  اعاده توجيه \n🚫*¦* ممنوع اضافة البوتات \n🚫*¦* عدم مخالفة القوانين 🚫\n")
local welcome = welcome:gsub("{rules}", rules)
local welcome = welcome:gsub("{name}", '['..data.first_name_..' '..(data.last_name_ or '')..']')
local welcome = welcome:gsub("{username}", "["..user_name.."]")
local welcome = welcome:gsub("{gpname}", arg.gp_name)
sendMsg(arg.chat_id,arg.msg_id,welcome,"md")
end end 
-------------------------
if is_banned(data.id_, arg.chat_id) then
sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو ⇐ ['..user_name..'] \n☑️*¦* الايدي* ('..data.id_..')*\n🚷*¦* بالتأكيد لقد تم حظرة✔️',"md")
kick_user(data.id_, arg.chat_id)
end
if is_gbanned(data.id_) then
sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو ⇐ ['..user_name..'] \n☑️*¦* الايدي* ('..data.id_..')*\n🚷*¦* بالتأكيد لقد تم حظرة عام✔️',"md")
kick_user(data.id_,arg.chat_id)
end end end
if msg.to.type == "channel" and redis:get(boss..'group:add'..msg.to.id) then
if msg.content_.ID == "MessageChatChangePhoto" then
return sendMsg(msg.to.id,msg.id_," قام ["..usernamex.."] بتغير صوره المجموعه ✔\n","md")
end
if msg.content_.ID == "MessageChatChangeTitle" then
tdcli_function({ID="GetChat",chat_id_=msg.to.id},function(arg,data)
redis:set(boss..'group:name'..msg.to.id,data.title_)
return sendMsg(msg.to.id,msg.id_,"🔱~> تم تغير اسم المجموعه  \n✔️~> الى `"..data.title_.."` \n✓","md") end,nil)
end
if msg.adduser then
tdcli_function ({ID = "GetUser",user_id_ = msg.adduser},check_newmember,{chat_id=msg.to.id,msg_id=msg.id_,user_id=msg.from.id,gp_name=redis:get(boss..'group:name'..msg.to.id)})
end
if msg.joinuser then
tdcli_function ({ID = "GetUser",user_id_ = msg.joinuser},check_newmember,{chat_id=msg.to.id,msg_id=msg.id_,user_id=msg.from.id,gp_name=redis:get(boss..'group:name'..msg.to.id)}) end
if (msg.adduser or msg.joinuser or msg.deluser) and redis:get(boss..'mute_tgservice'..msg.to.id) then del_msg(msg.to.id,tonumber(msg.id_)) end
end
if msg.photo_ then
if redis:get(boss..'photo:group'..msg.to.id..msg.from.id) then
redis:del(boss..'photo:group'..msg.from.id)
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.to.id,photo_=getInputFile(photo_id)},dl_cb,nil)
end
if redis:get(boss..'welcom_ph:witting'..msg.from.id) then
redis:del(boss..'welcom_ph:witting'..msg.from.id)
redis:set(boss..':WELCOME_BOT',photo_id)
return sendMsg(msg.to.id,msg.id_,'✔️~> تم تغيير صـورهہ‏‏ آلترحيب للبوت \n✓','md')
end end
if msg.forward_info_ and redis:get(boss..'fwd:'..msg.from.id) then
redis:del(boss..'fwd:'..msg.from.id)
local pv = redis:smembers(boss..'users')
local groups = redis:smembers(boss..'group:ids')
for i = 1, #pv do forwardMessages(pv[i],msg.to.id,{[0]=msg.id_},0) end
for i = 1, #groups do forwardMessages(groups[i],msg.to.id,{[0]=msg.id_},0) end
return sendMsg(msg.to.id,msg.id_,'♻️*¦* تم اذاعه التوجيه بنجاح \n✔️*¦* للمـجمـوعآت » *'..#groups..'* \n👤*¦* للخآص » '..#pv..'\n✓')			
end
if msg.to.type == "pv" and not is_sudo(msg) then
local msg_pv = tonumber(redis:get(boss..'user:'..msg.from.id..':msgs') or 0)
if msg_pv > 5 then
redis:setex(boss..':mute_pv:'..msg.from.id,3600,true)   
return sendMsg(msg.to.id,0,'*✔️~>* تم حظرك من البوت بسبب التكرار \n⁉️','md') 
end
redis:setex(boss..'user:'..msg.from.id..':msgs',2,msg_pv+1)
end
if msg.adduser and redis:get(boss..'group:add'..msg.to.id) then
redis:incr(boss..':addusers_group:'..msg.to.id..':'..msg.from.id)  -- تسـجيل آلجهآت آلمـضـآفهہ للمـجمـوعهہ‏‏
end
if msg and not (msg.adduser or msg.joinuser or msg.deluser ) and is_bot(msg.from.id) and redis:get(boss..'group:add'..msg.to.id) then
redis:incr(boss..'msgs:'..msg.from.id..':'..msg.to.id)  -- ريدز تسجيل عدد رسائل الاعضاء
--------------------------------------------
if msg.adduser and redis:get(boss..'welcome:get'..msg.to.id) then
local adduserx = tonumber(redis:get(boss..'user:'..msg.from.id..':msgs') or 0)
if adduserx > 3 then 
redis:del(boss..'welcome:get'..msg.to.id)
end
redis:setex(boss..'user:'..msg.from.id..':msgs',3,adduserx+1)
end
if redis:get(boss..'CheckExpire::'..msg.to.id) and not redis:get(boss..'ExpireDate:'..msg.to.id) and not is_sudo(msg) then
botrem(msg)
sendMsg(SUDO_ID,0,'🕵‍♂~> انتهى الاشتراك في احد المجموعات \n☑️ المجموعه : `'..redis:get(boss..'group:name'..msg.to.id)..'`\n ☑️~>ايدي ~ '..msg.to.id,'md')
return sendMsg(msg.to.id,0,'🕵‍♂~> انتهى الاشتراك البوت\n🙋‍♂~> سوف اغادر المجموعه فرصه سعيده🛠\n🕵‍♂~> او راسل المطور للتجديد ['..SUDO_USER..'] ','md')
else
local day_ex = (redis:ttl(boss..'ExpireDate:'..msg.to.id) / 86400)
if tonumber(day_ex) > 0.208 and is_mod(msg) then
warning(msg)
end end
if not is_mod(msg) and not is_whitelist(msg.from.id, msg.to.id) then -- للاعضاء فقط   
if redis:get(boss..'lock_flood'..msg.to.id) and not msg.adduser then
local msgs = (redis:get(boss..'user:'..msg.from.id..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(boss..'num_msg_max'..msg.to.id) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then 
if not redis:get(boss..'sender:'..msg.from.id..':flood') then
kick_user(msg.from.id,msg.to.id)
redis:setex(boss..'sender:'..msg.from.id..':flood',60,true)
return sendMsg(msg.to.id,msg.id_,"👤~> العضو : ["..usernamex.."]\n🚷~> عذرا ممنوع التكرار في هذه المجموعه لقد تم طردك ✔️\n","md")
end end
redis:setex(boss..'user:'..msg.from.id..':msgs',2,msgs+1)
end
if msg.forward_info_ and redis:get(boss..':tqeed_fwd:'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
return TqeedUserAll(msg)
elseif msg.photo_ and redis:get(boss..':tqeed_photo:'..msg.to.id)  then
del_msg(msg.to.id,tonumber(msg.id_))
return TqeedUser(msg)
elseif msg.animation_ and redis:get(boss..':tqeed_gif:'..msg.to.id)  then
del_msg(msg.to.id,tonumber(msg.id_))
return TqeedUser(msg)
elseif msg.video_ and redis:get(boss..':tqeed_video:'..msg.to.id)  then
del_msg(msg.to.id,tonumber(msg.id_))
return TqeedUser(msg)
elseif msg.text and (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]")) and redis:get(boss..':tqeed_link:'..msg.to.id)  then
del_msg(msg.to.id,tonumber(msg.id_))
return TqeedUserAll(msg)
end
if msg.forward_info_ and redis:get(boss..'mute_forward'..msg.to.id) then -- قفل التوجيه
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع اعادة التوجيه  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(boss..'mute_inline'..msg.to.id) then -- قفل الانلاين
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا الانلاين مقفول  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.text then -- رسايل فقط
local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
if (string.len(msg.text) > 1200 or ctrl_chars  > 1200) and redis:get(boss..'lock_spam'..msg.to.id) then -- قفل الكليشه 
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) and redis:get(boss..'lock_link'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ ممنوع ارسال الروابط  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(boss..'lock_webpage'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ ممنوع ارسال روابط الويب   \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.edited and redis:get(boss..'lock_edit'..msg.to.id) then -- قفل التعديل
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذراً ممنوع التعديل تم المسح \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.text:match("#") and redis:get(boss..'lock_tag'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ ممنوع ارسال التاك  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.text:match("@[%a%d%_]+")  and redis:get(boss..'lock_username'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ ممنوع ارسال المعرف   \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID ~= "MessageEntityBold" then
if (msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic") and redis:get(boss..'lock_markdown'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ ممنوع ارسال الماركدوان  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end end 
if msg.content_.entities_[0].ID == "MessageEntityUrl" and redis:get(boss..'lock_webpage'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦  .ممنوع ارسال روابط الويب   \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end end end
elseif msg.content_.ID == "MessageUnsupported" and redis:get(boss..'mute_video'..msg.to.id) then -- قفل الفيديو
del_msg(msg.to.id,tonumber(msg.id_))
 if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال الفيديو كام \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.photo_ and redis:get(boss..'mute_photo'..msg.to.id)  then -- قفب الصور
del_msg(msg.to.id,tonumber(msg.id_))
 if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال الصور  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.video_ and redis:get(boss..'mute_video'..msg.to.id) then -- قفل الفيديو
del_msg(msg.to.id,tonumber(msg.id_))
 if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال الفيديو  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.document_ and redis:get(boss..'mute_document'..msg.to.id) then -- قفل الملفات
del_msg(msg.to.id,tonumber(msg.id_))
 if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال الملفات  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.sticker_ and redis:get(boss..'mute_sticker'..msg.to.id) then --قفل الملصقات
del_msg(msg.to.id,tonumber(msg.id_))
 if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال الملصقات  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.animation_ and redis:get(boss..'mute_gif'..msg.to.id) then -- قفل المتحركه
del_msg(msg.to.id,tonumber(msg.id_))
 if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال الصور المتحركه  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.contact_ and redis:get(boss..'mute_contact'..msg.to.id) then -- قفل الجهات
del_msg(msg.to.id,tonumber(msg.id_))
 if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال جهات الاتصال  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.location_ and redis:get(boss..'mute_location'..msg.to.id) then -- قفل الموقع
del_msg(msg.to.id,tonumber(msg.id_))
 if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال الموقع  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.voice_ and redis:get(boss..'mute_voice'..msg.to.id) then -- قفل البصمات
del_msg(msg.to.id,tonumber(msg.id_))
 if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال البصمات  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.game_ and redis:get(boss..'mute_game'..msg.to.id) then -- قفل الالعاب
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع لعب الالعاب  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.audio_ and redis:get(boss..'mute_audio'..msg.to.id) then -- قفل الصوت
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال الصوت  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.content_ and msg.reply_markup_ and  msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and redis:get(boss..'mute_keyboard'..msg.to.id) then -- كيبورد
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا الكيبورد مقفول  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.media.caption then -- الرسايل الي بالكابشن
if (msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.media.caption:match("[Tt].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.media.caption:match(".[Pp][Ee]")) and redis:get(boss..'lock_link'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال الروابط  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif (msg.media.caption:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.media.caption:match("[Hh][Tt][Tt][Pp]://") or msg.media.caption:match("[Ww][Ww][Ww].") or msg.media.caption:match(".[Cc][Oo][Mm]")) and redis:get(boss..'lock_webpage'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال روابط الويب  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end
elseif msg.media.caption:match("@[%a%d%_]+") and redis:get(boss..'lock_username'..msg.to.id) then
del_msg(msg.to.id,tonumber(msg.id_))
if redis:get(boss..'lock_woring'..msg.to.id) then
local msgx = "‼️¦ عذرا ممنوع ارسال التاك او المعرف  \n📛"
return sendMsg(msg.to.id,0,'*👤¦* العضو : ['..check_name(namecut(msg.from.first_name))..']\n🎟*¦* اليوزر : ['..usernamex..']\n'..msgx,'md')    
end end end end end end
return {patterns = {},pre_process = pre_process}
