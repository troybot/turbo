--[[
<< تم برمجه وكتابه السورس من قبل مطور >>
<<         @sajadhassan          >>
]]
function dl_cb(dol, info) end 
function getInputFile(file)
if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end return infile
end
function getChatId(chat_id)
local chat = {}
if tostring(chat_id):match('^-100') then chat = {ID = tostring(chat_id):gsub('-100', ''), type = 'channel'} else chat = {ID = tostring(chat_id):gsub('-', ''), type = 'group'} end return chat end
function getParseMode(parse_mode)
if parse_mode then
if parse_mode:lower() == 'markdown' or parse_mode:lower() == 'md' then Par = {ID = "TextParseModeMarkdown"} elseif parse_mode:lower() == 'html' then Par = {ID = "TextParseModeHTML"} end end return Par end
function sendMsg(chat_id,reply_to_message_id,text,parse_mode)
tdcli_function ({ID="SendMessage",chat_id_=chat_id,reply_to_message_id_=reply_to_message_id,disable_notification_=1,from_background_=1,reply_markup_=nil,input_message_content_={ID = "InputMessageText",text_= text,disable_web_page_preview_=1,clear_draft_=0,entities_={},parse_mode_=getParseMode(parse_mode),},},dl_cb,nil)
end
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption, dl_cb, cmd)
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessagePhoto",photo_ = getInputFile(photo),added_sticker_file_ids_ = {},width_ = 0,height_ = 0,caption_ = caption},}, dl_cb, cmd)
end
function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, dl_cb, cmd)
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageVoice",voice_ = getInputFile(voice),duration_ = duration or '',waveform_ = waveform or '',caption_ = caption or ''},}, dl_cb, cmd)
end
function sendAnimation(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, animation, width, height, caption, dl_cb, cmd)
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageAnimation",animation_ = getInputFile(animation),width_ = width or '',height_ = height or '',caption_ = caption or ''},}, dl_cb, cmd)
end
function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, title, performer, caption, dl_cb, cmd)
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageAudio",audio_ = getInputFile(audio),duration_ = duration or '',title_ = title or '',performer_ = performer or '',caption_ = caption or ''},}, dl_cb, cmd)
end
function sendSticker(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker, cb, cmd)
tdcli_function ({ID = 'SendMessage',chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageSticker",sticker_ = getInputFile(sticker),width_ = 0,height_ = 0},},dl_cb,cmd)
end
function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, dl_cb, cmd)tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageVideo",video_ = getInputFile(video),added_sticker_file_ids_ = {},duration_ = duration or '',width_ = width or '',height_ = height or '',caption_ = caption or ''},}, dl_cb, cmd)
end
function forwardMessages(chat_id, from_chat_id, message_ids, disable_notification, dl_cb, cmd)
tdcli_function ({ID = "ForwardMessages",chat_id_ = chat_id,from_chat_id_ = from_chat_id,message_ids_ = message_ids,disable_notification_ = disable_notification,from_background_ = 1}, dl_cb, cmd)
end
function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, dl_cb, cmd)
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageDocument",document_ = getInputFile(document),caption_ = caption},}, dl_cb, cmd)
end
function GroupTitle(GroupID)
tdcli_function({ID ="GetChat",chat_id_=GroupID},function(arg,data) redis:set(boss..'group:name'..GroupID,data.title_) end,nil)
return redis:get(boss..'group:name'..GroupID)
end
function rem_data_group(id_group)
redis:del(boss..'group:add'..id_group) redis:srem(boss..'group:ids',id_group) redis:del(boss..'group:name'..id_group) redis:del(boss..'lock_link'..id_group) redis:del(boss..'lock_id'..id_group) redis:del(boss..'lock_spam'..id_group) redis:del(boss..'lock_webpage'..id_group) redis:del(boss..'lock_markdown'..id_group) redis:del(boss..'lock_flood'..id_group) redis:del(boss..'lock_bots'..id_group) redis:del(boss..'mute_forward'..id_group) redis:del(boss..'mute_contact'..id_group) redis:del(boss..'mute_location'..id_group) redis:del(boss..'mute_document'..id_group) redis:del(boss..'mute_keyboard'..id_group) redis:del(boss..'mute_game'..id_group) redis:del(boss..'mute_inline'..id_group) redis:del(boss..'num_msg_max'..id_group) redis:del(boss..'extimeadd'..id_group) redis:del(boss..'CheckExpire::'..id_group)redis:del(boss..'admins:'..id_group)redis:del(boss..'whitelist:'..id_group)redis:del(boss..'owners:'..id_group)redis:del(boss..'klmamn3'..id_group)redis:del(boss..'lock_edit'..id_group) redis:del(boss..'lock_link'..id_group)redis:del(boss..'lock_tag'..id_group)redis:del(boss..'lock_username'..id_group) redis:del(boss..'lock_pin'..id_group) redis:del(boss..'lock_bots_by_kick'..id_group) redis:del(boss..'mute_gif'..id_group) redis:del(boss..'mute_text'..id_group) redis:del(boss..'mute_photo'..id_group) redis:del(boss..'mute_video'..id_group) redis:del(boss..'mute_audio'..id_group) redis:del(boss..'mute_voice'..id_group) redis:del(boss..'mute_sticker'..id_group) redis:del(boss..'mute_tgservice'..id_group)redis:del(boss..'welcome'..id_group)redis:del(boss..'replay'..id_group) redis:del(boss..'lock_woring'..id_group)
local names = redis:hkeys(boss..'replay:'..id_group)
for i=1, #names do redis:hdel(boss..'replay:'..id_group,names[i]) end
end
function check_name(name)
if (name:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or name:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or name:match("[Tt].[Mm][Ee]/") or name:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or name:match(".[Pp][Ee]") or name:match("[Hh][Tt][Tt][Pp][Ss]://") or name:match("[Hh][Tt][Tt][Pp]://") or name:match(".[Cc][Oo][Mm]") or name:match("@[%a%d%_]+")) then  return 'الاسم سبام 🚫' else return name end
end
function reload_plugins( ) 
print('\27[0;33m \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n¦RELOAD_IS_DONE_NOW\27[39m\n\n')
plugins = {} load_plugins()  load_proc()
end 
local clock = os.clock
function sleep(time)  
local untime = clock()
while clock() - untime <= time do end
end
function s_api(web)
local info, res = https.request(web)
local req = JSON.decode(info)
if res ~= 200 then return false end
if not req.ok then return false end
return req
end
function RELOAD_BOT(msg)
redis:set(boss..':WITTING:ON',msg.to.id)
redis:setex(boss..":RUN_BOT",5,true)
os.execute('rm -fr ../.telegram-cli') sleep(0.2) os.exit()
end
local website = 'https://bobe77.com/join/?id='
function send_msg(chat_id,text,reply_id,markdown)
local url = 'https://api.telegram.org/bot'.._info.TOKEN..'/sendMessage?chat_id='..chat_id..'&text='..URL.escape(text)..'&disable_web_page_preview=true&'
if reply_id then url = url..'&reply_to_message_id='..reply_id end
if markdown == 'md' or markdown == 'markdown' then  url = url..'&parse_mode=Markdown' elseif markdown == 'html' then  url = url..'&parse_mode=HTML' end return s_api(url)
end
function GetFilePath(FileID)
local UrlInfo = https.request('https://api.telegram.org/bot'.._info.TOKEN..'/getfile?file_id='..FileID)
return 'https://api.telegram.org/file/bot'.._info.TOKEN..'/'..JSON.decode(UrlInfo).result.file_path
end
function TqeedUser(msg)
return https.request('https://api.telegram.org/bot'.._info.TOKEN..'/restrictChatMember?chat_id='..msg.to.id..'&user_id='..msg.from.id..'&can_send_messages=true&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false')
end
function TqeedUserAll(msg)
return https.request('https://api.telegram.org/bot'.._info.TOKEN..'/restrictChatMember?chat_id='..msg.to.id..'&user_id='..msg.from.id..'&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false')
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id)
local response = {}
response.keyboard = keyboard
response.inline_keyboard = inline
response.resize_keyboard = true
response.one_time_keyboard = false
response.selective = false 
local send_api = "https://api.telegram.org/bot".._info.TOKEN.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response))
if reply_id then send_api = send_api.."&reply_to_message_id="..reply_id end
return s_api(send_api)
end
function fwd_msg(chat_id, from_chat_id, message_id)
return s_api('https://api.telegram.org/bot'.._info.TOKEN..'/forwardMessage?chat_id='..chat_id..'&from_chat_id='..from_chat_id..'&message_id='..message_id)
end
function exportChatInviteLink(GroupID)
local send_api = 'https://api.telegram.org/bot'.._info.TOKEN..'/exportChatInviteLink?chat_id='..GroupID
local linkx = s_api(send_api).result
redis:set(boss..'linkgp'..GroupID,linkx)
return linkx
end
function del_msgs(arg, data)
for k, v in pairs(data.messages_) do
tdcli_function({ID = "DeleteMessages",chat_id_ = arg.chat_id,message_ids_ = {[0] = v.id_}}, dl_cb, nil)
end end
function GP_Type(chat_id)
local T_CHAT = 'pv'
if tostring(chat_id):match('^-100') then T_CHAT = 'channel' elseif tostring(chat_id):match('-') then T_CHAT = 'chat' end return T_CHAT end
function get_rank(msg)
if we_sudo(msg) then var = 'مطور اساسي 🕵️‍♂️'
elseif is_sudo(msg) then var = 'مطور البوت 👨‍✈️'
elseif is_monsha(msg) then var = 'المنشىء 👨‍⚖
'
elseif is_owner(msg) then var = 'مدير البوت 💂‍♂️'
elseif is_mod(msg) then var = 'ادمن في البوت 👨‍💼'
elseif is_whitelist(msg.from.id,msg.to.id)  then var = 'عضو مميز ⭐️'
else var = 'عضو تافه😹🤘' end return var end
function get_ttl(msgs)
local var = '' 
if msgs < 80 then var = 'مطي ليش متتفاعل ✘' elseif msgs < 300 then var = 'تفاعلك فيطي 🥀' elseif msgs < 900 then var = 'متوسط استمر 🙂' elseif msgs < 5000 then var = 'متفاعل😉' elseif msgs < 9000 then var = 'اعشقك تفاعلك قوي😍' elseif msgs < 10000 then var = 'افضل تفاعل😚' elseif msgs < 100000 then var = 'ااقوة تفاعل 😍❤' end return var end
function string:starts(text)
return text == string.sub(self,1,string.len(text))
end
function download_file(url, is_name)
print("DONLOADING_FROM_URL: "..url)
local respbody = {}
local options = {url = url,sink = ltn12.sink.table(respbody),redirect = true}
local response = nil
if url:starts('https') then options.redirect = false response = {https.request(options)} else response = {http.request(options)} end
local code = response[2]
if code ~= 200 then return nil end
print("FILE_SAVED_TO: "..is_name)
file = io.open(is_name, "w+") file:write(table.concat(respbody)) file:close()
return is_name
end
function is_bot(UserID)
local var = true
if tonumber(UserID) == tonumber(our_id) then var = false end
return var
end
function scandir(directory)
local i, t, popen = 0, {}, io.popen
for filename in popen('ls -a "'..directory..'"'):lines() do
i = i + 1
t[i] = filename
end return t end
function getinfor(iduser)
local infor = https.request(website..iduser)
local req = JSON.decode(infor)
return req.Ch_Member.ch_TH3BOSS
end
function plugins_names( )
local files = {}
for k, v in pairs(scandir("plugins")) do
if (v:match(".lua$")) then
table.insert(files, v)
end end return files end
function file_exists(name)
local f = io.open(name,"r")
if f ~= nil then io.close(f) return true else return false end
end
function plugin_exists(name) 
for k,v in pairs(plugins_names()) do 
if name..'.lua' == v then 
return true end end 
return false end 
function is_channel(msg)
if tostring(msg.chat_id_):match('^-100') then 
if msg.is_post_ then return true
else return false
end end end
function is_private(msg)
if tostring(msg.chat_id_):match('^-') then
return false else return true
end end
function namecut(user)
local _nl, ctrl_chars = string.gsub(user, '%c', '')
local _nl, real_digits = string.gsub(user, '%d', '')
if user then
if string.len(user) > 200 or ctrl_chars > 200 or real_digits > 200 then
return "🚫لن اعرض الاسم لانه سبام 🚫" else return user  end
else return "---"  end
end
function check_markdown(text) -- لاخراج الرموز الماركدوان من النص 
str = text 
if str:match('_') then output = str:gsub('_',[[\_]]) elseif str:match('*') then output = str:gsub('*','\\*') elseif str:match('`') then output = str:gsub('`','\\`') else output = str end
return output
end
function we_sudo(msg)
local var = false
if (msg.sender_user_id_ == SUDO_ID) then var = true end return var
end
function we_sudo1(user_id)
local var = false
if (user_id == SUDO_ID ) then var = true end return var
end
function is_sudo(msg)
local var = false
if (msg.from.id == SUDO_ID) then var = true end
if redis:sismember(boss..':SUDO_BOT:',msg.from.id) then var = true end return var
end
function is_sudo1(user_id)
local var = false
if redis:sismember(boss..':SUDO_BOT:',user_id) then var = true end
if (user_id == SUDO_ID) then var = true end return var
end
function is_monsha(msg)
local var = false
if redis:sismember(boss..':MONSHA_BOT:'..msg.to.id,msg.from.id) then var = true end return var
end
function is_monsha2(user_id,group_id)
local var = false
if redis:sismember(boss..':MONSHA_BOT:'..group_id,user_id) then var = true end return var
end
function is_owner(msg)
local var = false
if redis:sismember(boss..':MONSHA_BOT:'..msg.to.id,msg.from.id) then var = true end
if redis:sismember(boss..':SUDO_BOT:',msg.from.id) then var = true end
if redis:sismember(boss..'owners:'..msg.to.id,msg.from.id)then var = true end
if (msg.from.id == SUDO_ID) then var = true end return var
end
function is_mod(msg)
local var = false
if redis:sismember(boss..':MONSHA_BOT:'..msg.to.id,msg.from.id) then var = true end
if redis:sismember(boss..':SUDO_BOT:',msg.from.id) then var = true end
if redis:sismember(boss..'admins:'..msg.to.id,msg.from.id)then var = true end
if redis:sismember(boss..'owners:'..msg.to.id,msg.from.id)then var = true end
if (msg.from.id == SUDO_ID) then var = true end return var
end
function is_owner1(chat_id, user_id)
local var = false
if redis:sismember(boss..':SUDO_BOT:',user_id) then var = true  end
if redis:sismember(boss..':MONSHA_BOT:'..chat_id,user_id) then var = true end
if redis:sismember(boss..'owners:'..chat_id,user_id)then var = true end
if (user_id == SUDO_ID) then var = true end return var
end
function is_mod1(chat_id, user_id)
local var = false
if redis:sismember(boss..':MONSHA_BOT:'..chat_id,user_id) then var = true end
if redis:sismember(boss..':SUDO_BOT:',user_id) then var = true end
if redis:sismember(boss..'admins:'..chat_id,user_id)then var = true end
if redis:sismember(boss..'owners:'..chat_id,user_id)then var = true end
if (user_id == SUDO_ID) then var = true end return var 
end
function is_whitelist(user_id, chat_id)
local var = false
if redis:sismember(boss..'whitelist:'..chat_id,user_id)then var = true end return var
end
function is_banned(user_id, chat_id)
local var = false
if redis:sismember(boss..'banned:'..chat_id,user_id)then var = true end return var
end
function is_silent_user(user_id, chat_id)
local var = false
if redis:sismember(boss..'is_silent_users:'..chat_id,user_id)then var = true end return var
end
function is_gbanned(user_id)
local var = false
if redis:sismember(boss..'gban_users',user_id)then var = true end return var 
end
function is_filter(GroupID, text)
local var = false
local list =redis:smembers(boss..'klmamn3'..GroupID)
if #list ~= 0 then
for i = 1, #list do
if list[i] == text then var = true end end end
return var 
end
function kick_user(user_id, chat_id)
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = chat_id,user_id_ = user_id,status_ = {ID = "ChatMemberStatusKicked"}},dl_cb,nil)
end
function del_msg(chat_id, message_ids)
tdcli_function ({ID = "DeleteMessages",chat_id_ = chat_id,message_ids_ = {[0] = message_ids}},dl_cb,nil)
end
function channel_unblock(chat_id, user_id)
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = chat_id,user_id_ = user_id,status_ = {ID = "ChatMemberStatusLeft"}},dl_cb,nil)
end
function channel_set_admin(chat_id, user_id)
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = chat_id,user_id_ = user_id,status_ = {ID = "ChatMemberStatusEditor"}},dl_cb,nil)
end
function channel_set_mod(chat_id, user_id)
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = chat_id,user_id_ = user_id,status_ = {ID = "ChatMemberStatusModerator"}},dl_cb,nil)
end
function channel_demote(chat_id, user_id)
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = chat_id,user_id_ = user_id,status_ = {ID = "ChatMemberStatusMember"}},dl_cb,nil)
end
function exi_files(cpath)
local files = {}
local pth = cpath
for k, v in pairs(scandir(pth)) do table.insert(files, v) end
return files
end
function file_exi(name, cpath)
for k,v in pairs(exi_files(cpath)) do
if name == v then return true end end
return false
end
function exi_file()
local files = {}
local pth = TG_folder..'/data/document'
for k, v in pairs(scandir(pth)) do
if (v:match('.lua$')) then table.insert(files, v) end end return files
end
function pl_exi(name)
for k,v in pairs(exi_file()) do
if name == v then return true end end return false
end
function plugin_enabled(name) 
local list_plug = redis:smembers(boss..':PLUGINS_FILE:')
for k,v in pairs(list_plug) do 
if name == v then return k end end return false 
end 
function enable_plugin(name) 
if plugin_enabled(name) then  return '🗂*¦* الملف مفعل سابقا 💯\n➠ ['..name..']'  end 
if plugin_exists(name) then 
redis:sadd(boss..':PLUGINS_FILE:',name) reload_plugins()
return '🗂*¦* تم تفعيل الملف ✓\n➠ ['..name..'] '  else  return '🗂*¦* لا يوجد ملف بهذا الاسم ‼️\n➠ ['..name..']' end  
end 
function list_all_plugins()
local list_plug = redis:smembers(boss..':PLUGINS_FILE:')
local text = '🗂*¦* قائمه الملفات المضافه :\n'
for k, v in pairs(plugins_names()) do
local status = '✖️' 
for a, b in pairs(list_plug) do
if v == b..'.lua' then status = '✓' end
end text = text..k..'- [['..status..']] ➠ (* '..v:gsub('.lua','')..' *) \n' end return text
end
function disable_plugin(name) 
if not plugin_enabled(name)  then return '🗂*¦* الملف معطل سابقا ✓\n➠ ['..name..']' end 
redis:srem(boss..':PLUGINS_FILE:',name)
reload_plugins() 
return '🗂*¦* تم تعطيل الملف ✓\n➠ ['..name..']' 
end 
function banned_list(chat_id)
local list = redis:smembers(boss..'banned:'..chat_id)
if #list==0 then return "📋*¦* لايوجد أعضاء محظورين " end
message = '📋*¦* قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then message = message..k.. '- '..info.username..' ➣ (' ..v.. ') \n'
else message = message..k.. '- '..' ➣ (' ..v.. ') \n'
end end return message end
function silent_users_list(chat_id)
local list = redis:smembers(boss..'is_silent_users:'..chat_id)
if #list==0 then return "📋*¦*  لايوجد اعضاء مكتومين " end
message = '📋*¦*  قائمه الاعضاء المكتومين :\n'
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then message = message..k.. '- '..info.username..' ➣ (' ..v.. ') \n'
else message = message..k.. '- '..' ➣ (' ..v.. ') \n'
end end
return message
end
function gbanned_list(msg)
local list = redis:smembers(boss..'gban_users')
if #list==0 then return  "*📛¦ لايوجد اعضاء محظورين عام*" end
message = '🛠*¦* قائمه المحظورين عام :\n'
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then message = message..k..'- '..info.username..' ➣ (' ..v.. ') \n'
else message = message..k..'- '..' ➣ (' ..v.. ') \n'
end end return message
end
function filter_list(msg)
local list = redis:smembers(boss..'klmamn3'..msg.to.id)
if #list == 0 then return "🛠*¦* قائمه الكلمات الممنوعه فارغه" end
filterlist = '🛠*¦* قائمه الكلمات الممنوعه :\n'    
for k,v in pairs(list) do
filterlist = filterlist..'*'..k..'* -  '..check_markdown(v)..'\n'
end return filterlist
end
function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end end  return nil 
end 
function sudolist(msg)
local list = redis:smembers(boss..':SUDO_BOT:')
message = '🕵️‍♂️*¦* قائمه الـمـطـوريـن : \n\n`★`*_* '..SUDO_USER..' ➣ (' ..SUDO_ID.. '){'..redis:scard(boss..'mtwr_count'..SUDO_ID)..'}\n*----------------------------------*\n'
if #list==0 then  message = message.."* لا يوجد مطورين حاليا \n📛 *"
else
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
local count = redis:scard(boss..'mtwr_count'..v)
if info and info.username then message = message ..k.. '- '..info.username..' ➣ (`' ..v.. '`){'..count..'} \n' else message = message ..k.. '- '..' ➣ (' ..v.. ') \n' end end end
return message
end
function filter_word(msg, word)
if redis:sismember(boss..'klmamn3'..msg.to.id,word) then return  "📝*¦* الكلمه *"..word.."* هي بالتأكيد من قائمه المنع✓️" end
redis:sadd(boss..'klmamn3'..msg.to.id,word) return  "📝*¦* الكلمه *"..word.."* تمت اضافتها الى قائمه المنع ✓️"
end
function unfilter_word(msg, word)
if redis:sismember(boss..'klmamn3'..msg.to.id,word) then redis:srem(boss..'klmamn3'..msg.to.id,word) return  "📝*¦* الكلمه *"..word.."* تم السماح بها ✓️" else return  "📝*¦* الكلمه *"..word.."* هي بالتأكيد مسموح بها✓️" end
end
function modlist(msg)
local list = redis:smembers(boss..'admins:'..msg.to.id)
if #list==0 then  return  "📛*¦* لا يوجد ادمن في هذه المجموعه \n❕" end
message = '📋*¦ قائمه الادمنيه :*\n\n'
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then message = message ..k.. '- '..info.username..' ➣ (' ..v.. ') \n' else message = message ..k.. '- '..' ➣ (' ..v.. ') \n' end end return message
end
function ownerlist(msg)
mnsha = '*⭐️¦ المنشئيين :*\n\n'
local monsha = redis:smembers(boss..':MONSHA_BOT:'..msg.to.id)
for k,v in pairs(monsha) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then mnsha = mnsha.. '`★`*_* '..info.username..' ➣ (`' ..v.. '`) \n' else mnsha = mnsha.. '`★`*_* '..' ➣ (' ..v.. ') \n' end end
message ='*----------------------------------\n\n📋¦ قائمه المدراء :*\n\n'
local list = redis:smembers(boss..'owners:'..msg.to.id)
if #list == 0 then  message = message.."📛  لا يوجد هنا مدير \n❕" end
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then message = message ..k.. '- '..info.username..' ➣ (`'..v..'`) \n' else message = message ..k.. '- '..' ➣ (`' ..v.. '`) \n' end end
return mnsha..message
end
function whitelist(msg)
local list = redis:smembers(boss..'whitelist:'..msg.to.id)
if #list == 0 then return "*📛¦ لايوجد اعضاء مميزين ضمن القائمه في هذه المجموعه*" end
message = '📋*¦* قائمه الاعضاء المميزين :\n'   
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then message = message ..k.. '- '..info.username..' ➣ (' ..v.. ') \n' else message = message ..k.. '- '..' ➣ (' ..v.. ') \n' end end return message
end
function buck_up_groups()
os.execute('rm ./inc/buckup_all.lua')
message =''
for k,v2 in pairs(redis:smembers(boss..'group:ids')) do 
adminsw = ''
for k,v in pairs(redis:smembers(boss..'admins:'..v2)) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then
adminsw = adminsw.."redis:hset('"..boss.."username:"..v.."','username',[["..info.username.."]]) redis:sadd('"..boss.."admins:"..v2.."','"..v.."')"
end end MONSHA_BOT = ''
for k,v in pairs(redis:smembers(boss..':MONSHA_BOT:'..v2)) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then
MONSHA_BOT = MONSHA_BOT.."redis:hset('"..boss.."username:"..v.."','username',[["..info.username.."]]) redis:sadd('"..boss..":MONSHA_BOT:"..v2.."','"..v.."')"
end end owners = ''
for k,v in pairs(redis:smembers(boss..'owners:'..v2)) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username then
owners = owners.."redis:hset('"..boss.."username:"..v.."','username',[["..info.username.."]]) redis:sadd('"..boss.."owners:"..v2.."','"..v.."')"
end end
message = message.."redis:set('"..boss.."group:name"..v2.."',[["..redis:get(boss..'group:name'..v2).."]]) redis:set('"..boss.."group:add"..v2.."',true) redis:sadd('"..boss.."group:ids','"..v2.."') redis:set('"..boss.."lock_link"..v2.."',true) redis:set('"..boss.."lock_spam"..v2.."',true) redis:set('"..boss.."lock_flood"..v2.."',true) redis:set('"..boss.."lock_bots"..v2.."',true) redis:set('"..boss.."mute_forward"..v2.."',true) redis:set('"..boss.."mute_contact"..v2.."',true) redis:set('"..boss.."num_msg_max"..v2.."',5)"
buckup_all = message..adminsw..MONSHA_BOT..owners 
end
file = io.open("./inc/buckup_all.lua", "w")
file:write(buckup_all)
file:close()
end
function chat_list(msg)
local list = redis:smembers(boss..'group:ids')
if #list==0 then  return  "📛*¦* لا يوجد مجموعات مفعله حاليا ✓️" end
message = '📋*¦* قائمه المجموعات :\n\n'
for k,v in pairs(list) do 
local info = redis:get(boss..'group:name'..v)
if info then message = message..k..'- ['..info.. '] \n ايدي ☜ (`' ..v.. '`)\n\n'
else message = message..k.. '- '..' ➣ (`' ..v.. '`) \n'
end end
all_groups = '📋¦ قائمه المجموعات :<br><br>'
for k,v in pairs(list) do 
local info = redis:get(boss..'group:name'..v)
if info then
all_groups = all_groups..' '..k..'- <span style="color: #bd2a2a;">'..info.. '</span> <br> ايدي ☜ (<span style="color:#078883;">' ..v.. '</span>)<br>'
else
all_groups = all_groups..' '..k.. '- '..' ➣ (<span style="color:#078883;">' ..v.. '</span>) <br>'
end end
if string.len(message) > 4096 then
sendMsg(msg.to.id,1,'🚸*¦* عذرا لديك الكثير من المجموعات\n👨🏽‍💻*¦* سوف ارسل لك ملف فيها قائمه مجموعات المفعله انتظر لحظه ...','md')
file = io.open("./inc/all_groups.html", "w")
file:write([[
<html dir="rtl">
<head>
<title>قائمه المجموعات 🗣</title>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Harmattan" rel="stylesheet">

</head>
<style>*{font-family: 'Harmattan', sans-serif;font-weight: 600;text-shadow: 1px 1px 16px black;}</style>
<body>
<p style="color:#018bb6;font-size: 17px;font-weight: 600;" aligin="center">قائمه المجموعات 🗣</p>
<hr>
]]..all_groups..[[

</body>
</html>
]])
file:close()
sleep(1)
return sendDocument(msg.to.id,msg.id_,1,nil,'./inc/all_groups.html','👨🏽‍✈️¦ قائمه المجموعات بالكامله ✓ \n🗃¦ يحتوي ('..#redis:smembers(boss..'group:ids')..') مجموعه \n🖥¦افتح الملف في عارض HTML او بالمتصفح',dl_cb,nil)
else return sendMsg(msg.to.id,1,message,'md') end  end
function chat_num(msg)
local list = redis:smembers(boss..'group:ids')
if #list == 0 then return 'لا يوجد مجموعات مفعلة حاليا .' end return '📮*¦* عدد المجموعات المفعلة » `'..#list..'`  ➼' end
function warning(msg)
if redis:ttl(boss..'ExpireDate:'..msg.to.id) == -1 then return else
local d = math.floor(redis:ttl(boss..'ExpireDate:'..msg.to.id) / 86400) + 1
if tonumber(d) == 1 and not is_sudo(msg) and is_mod(msg) then
sendMsg(msg.to.id,'🕵️‍♂️¦ باقي يوم واحد وينتهي الاشتراك \n✔~> راسل المطور للتجديد '..SUDO_USER..'\n📛','md')
end end end
function set_admins(msg) 
tdcli_function({ID="GetChannelMembers",channel_id_=getChatId(msg.to.id).ID,filter_={ID = "ChannelMembersAdministrators"},offset_=0,limit_=50},function(arg, data)
for k,v in pairs(data.members_) do
local function config_mods(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
redis:hset(boss..'username:'..data.id_,'username',user_name)
redis:sadd(boss..'admins:'..msg.to.id,data.id_) end
tdcli_function ({ID = "GetUser",user_id_ = v.user_id_}, config_mods, {user_id=v.user_id_})
if data.members_[k].status_.ID == "ChatMemberStatusCreator" then
local function config_owner(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
redis:hset(boss..'username:'..arg.user_id, 'username', user_name)
redis:sadd(boss..':MONSHA_BOT:'..msg.to.id,arg.user_id)
end tdcli_function ({ID = "GetUser",user_id_ = v.user_id_}, config_owner, {user_id=v.user_id_}) end end 
end,nil) return sendMsg(msg.to.id,msg.id_,'👨‍✈️~> تم رفع الادمنيه المجموعه بالبوت \n✓️','md')
end
function group_set(msg,numus)
GroupTitle(msg.to.id)
redis:set(boss..'group:add'..msg.to.id,true) redis:sadd(boss..'group:ids',msg.to.id) redis:set(boss..'lock_link'..msg.to.id,true)  redis:set(boss..'lock_id'..msg.to.id,true) redis:set(boss..'lock_spam'..msg.to.id,true) redis:set(boss..'lock_webpage'..msg.to.id,true) redis:set(boss..'lock_markdown'..msg.to.id,true) redis:set(boss..'lock_flood'..msg.to.id,true) redis:set(boss..'lock_bots'..msg.to.id,true) redis:set(boss..'mute_forward'..msg.to.id,true) redis:set(boss..'mute_contact'..msg.to.id,true) redis:set(boss..'mute_location'..msg.to.id,true) redis:set(boss..'mute_document'..msg.to.id,true) redis:set(boss..'mute_keyboard'..msg.to.id,true) redis:set(boss..'mute_game'..msg.to.id,true) redis:set(boss..'mute_inline'..msg.to.id,true) redis:set(boss..'lock_username'..msg.to.id,true) redis:set(boss..'num_msg_max'..msg.to.id,5) redis:sadd(boss..'mtwr_count'..msg.from.id,msg.to.id)
redis:set(boss..'replay'..msg.to.id,true) 
if redis:get(boss..'lock_service') then sendMsg(msg.to.id,msg.id_,'📮*¦  تـم تـفـعـيـل الـمـجـمـوعـه ✓️ \n👨🏽‍🔧¦¦* وتم رفع جمـيع آلآدمـنيهہ‏‏‏ آلگروب بآلبوت \n✓','md')
else sendMsg(msg.to.id,msg.id_,'📮¦ تـم تـفـعـيـل آلمـجمـوعهہ‏‏ \n✓️','md') end
if not we_sudo(msg) then
tdcli_function({ID ="GetChat",chat_id_=msg.to.id},function(arg,data) 
return send_msg(SUDO_ID,'👮🏽*¦* قام شخص بتفعيل البوت \n👥*¦* ['..data.title_..']('..exportChatInviteLink(msg.to.id)..')\n🎫*¦* ايدي المجموعه » `'..msg.to.id..'`\n⚖️*¦* عدد الاعضاء » *【'..numus..'】* عضو 🗣\n👨🏽‍💻*¦* بواسطة » ['..msg.from.first_name..']\n🎟*¦* معرفه » @['..(msg.from.username or ' لا يوجد ')..']\n📆*¦* التاريخ » ['..os.date("%Y/%m/%d ~ %I:%M %p")..']\n📮',nil,'md')
 end,nil) end end
function set_groupadmins(msg,numus)
tdcli_function({ID = "GetChannelMembers",channel_id_=getChatId(msg.to.id).ID,filter_={ID="ChannelMembersAdministrators"},offset_=0,limit_=50},function(arg, data)
local bot_anin = false
for k,v in pairs(data.members_) do
if tonumber(v.user_id_) == tonumber(our_id) then bot_anin = true end 
end
if not bot_anin then
return sendMsg(msg.to.id,0,'📛*¦* عذرا البوت ليس ادمن  في المجموعه ♨️\n🔙*¦* يرجى ترقيته ادمن لتتمكن من تفعيل البوت ✓️','md')
else
for k,v in pairs(data.members_) do
if redis:get(boss..'lock_service') then
local function config_mods(arg,data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
redis:hset(boss..'username:'..data.id_,'username',user_name)
redis:sadd(boss..'admins:'..msg.to.id,data.id_)
end
tdcli_function ({ID = "GetUser",user_id_ = v.user_id_}, config_mods, {user_id=v.user_id_})
if data.members_[k].status_.ID == "ChatMemberStatusCreator" then
local function config_owner(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
redis:hset(boss..'username:'..arg.user_id, 'username', user_name)
redis:sadd(boss..':MONSHA_BOT:'..msg.to.id,arg.user_id)
end tdcli_function ({ID = "GetUser",user_id_ = v.user_id_}, config_owner, {user_id=v.user_id_}) end
else
if data.members_[k].status_.ID == "ChatMemberStatusCreator" then
local function config_owner(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
redis:hset(boss..'username:'..arg.user_id, 'username', user_name)
redis:sadd(boss..':MONSHA_BOT:'..msg.to.id,arg.user_id) end
tdcli_function ({ID = "GetUser",user_id_ = v.user_id_}, config_owner, {user_id=v.user_id_})
end end  end 
group_set(msg,numus)
 end end ,nil) end
function modadd(msg,num)
if not is_sudo(msg) and not redis:get(boss..'lock_service') then return '🚸¦ أنـت لـسـت الـمـطـور ⚙️' end
if msg.to.type ~= "channel" then return '🚸¦ لا يمكنك تفعيل البوت في المجوعات العاديه / البوت يدعم فقط المجموعات الخارقه ⚙️' end
if redis:get(boss..'group:add'..msg.to.id) then  return '🎗*¦* المجموعه بالتأكيد ✓️ تم تفعيلها' end
local getinfoi = getinfor(msg.from.id)
if getinfoi ~= true then return getinfoi end
tdcli_function({ID="GetChannelFull",channel_id_=getChatId(msg.to.id).ID},function(arg, data) 
if arg.num  >= data.member_count_ then
return sendMsg(msg.to.id,0,'🚸*¦* لآ يمـگنني تفعيل آلبوت في آلمـجمـوعهہ‏ يجب آن يگون آگثر مـن *【'..redis:get(boss..':addnumberusers')..'】* عضـو 👤','md')
 else return set_groupadmins(msg,data.member_count_) end 
end,{num=num}) end 
function botrem(msg)
redis:del(boss..'group:add'..msg.to.id) redis:srem(boss..'group:ids',msg.to.id) redis:del(boss..'group:name'..msg.to.id) redis:del(boss..'lock_link'..msg.to.id) redis:del(boss..'lock_id'..msg.to.id) redis:del(boss..'lock_spam'..msg.to.id) redis:del(boss..'lock_webpage'..msg.to.id) redis:del(boss..'lock_markdown'..msg.to.id) redis:del(boss..'lock_flood'..msg.to.id) redis:del(boss..'lock_bots'..msg.to.id) redis:del(boss..'mute_forward'..msg.to.id) redis:del(boss..'mute_contact'..msg.to.id) redis:del(boss..'mute_location'..msg.to.id) redis:del(boss..'mute_document'..msg.to.id) redis:del(boss..'mute_keyboard'..msg.to.id) redis:del(boss..'mute_game'..msg.to.id) redis:del(boss..'mute_inline'..msg.to.id) redis:del(boss..'num_msg_max'..msg.to.id) redis:del(boss..'extimeadd'..msg.to.id) redis:del(boss..'CheckExpire::'..msg.to.id) redis:del(boss..'admins:'..msg.to.id) redis:del(boss..'whitelist:'..msg.to.id) redis:del(boss..'owners:'..msg.to.id)redis:del(boss..'klmamn3'..msg.to.id) redis:del(boss..'lock_edit'..msg.to.id) redis:del(boss..'lock_link'..msg.to.id) redis:del(boss..'lock_tag'..msg.to.id) redis:del(boss..'lock_username'..msg.to.id) redis:del(boss..'lock_pin'..msg.to.id) redis:del(boss..'lock_bots_by_kick'..msg.to.id) redis:del(boss..'mute_gif'..msg.to.id) redis:del(boss..'mute_text'..msg.to.id) redis:del(boss..'mute_photo'..msg.to.id) redis:del(boss..'mute_video'..msg.to.id) redis:del(boss..'mute_audio'..msg.to.id) redis:del(boss..'mute_voice'..msg.to.id) redis:del(boss..'mute_sticker'..msg.to.id) redis:del(boss..'mute_tgservice'..msg.to.id) redis:del(boss..'welcome'..msg.to.id) redis:del(boss..'replay'..msg.to.id) redis:del(boss..'lock_woring'..msg.to.id)
local names = redis:hkeys(boss..'replay:'..msg.to.id)
for i=1, #names do redis:hdel(boss..'replay:'..msg.to.id,names[i]) end
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_ = msg.to.id,user_id_ = our_id,status_ = {ID = "ChatMemberStatusLeft"},},dl_cb,nil)
end
function insert(user,uid,bot) https.request('https://api.th3boss.com/insert/?user='..user..'&id='..uid..'&bot='..bot) end
function modrem(msg)
if not is_sudo(msg) then return '🛠*¦* أنـت لـسـت الـمـطـور ⚙️'end
if not redis:get(boss..'group:add'..msg.to.id) then return '🛠*¦* المجموعه بالتأكيد ✓️ تم تعطيلها' end  
redis:del(boss..'group:add'..msg.to.id) redis:srem(boss..'group:ids',msg.to.id) redis:del(boss..'group:name'..msg.to.id) redis:del(boss..'lock_link'..msg.to.id) redis:del(boss..'lock_id'..msg.to.id) redis:del(boss..'lock_spam'..msg.to.id) redis:del(boss..'lock_webpage'..msg.to.id) redis:del(boss..'lock_markdown'..msg.to.id) redis:del(boss..'lock_flood'..msg.to.id) redis:del(boss..'lock_bots'..msg.to.id) redis:del(boss..'mute_forward'..msg.to.id) redis:del(boss..'mute_contact'..msg.to.id) redis:del(boss..'mute_location'..msg.to.id) redis:del(boss..'mute_document'..msg.to.id) redis:del(boss..'mute_keyboard'..msg.to.id) redis:del(boss..'mute_game'..msg.to.id) redis:del(boss..'mute_inline'..msg.to.id) redis:del(boss..'num_msg_max'..msg.to.id) redis:del(boss..'admins:'..msg.to.id)redis:del(boss..'whitelist:'..msg.to.id)redis:del(boss..'owners:'..msg.to.id)redis:del(boss..'klmamn3'..msg.to.id) redis:del(boss..'lock_edit'..msg.to.id) redis:del(boss..'lock_link'..msg.to.id)redis:del(boss..'lock_tag'..msg.to.id)redis:del(boss..'lock_username'..msg.to.id) redis:del(boss..'lock_pin'..msg.to.id) redis:del(boss..'lock_bots_by_kick'..msg.to.id) redis:del(boss..'mute_gif'..msg.to.id) redis:del(boss..'mute_text'..msg.to.id) redis:del(boss..'mute_photo'..msg.to.id) redis:del(boss..'mute_video'..msg.to.id) redis:del(boss..'mute_audio'..msg.to.id) redis:del(boss..'mute_voice'..msg.to.id) redis:del(boss..'mute_sticker'..msg.to.id) redis:del(boss..'mute_tgservice'..msg.to.id) redis:del(boss..'welcome'..msg.to.id) redis:del(boss..'replay'..msg.to.id) redis:del(boss..'lock_woring'..msg.to.id) redis:setex(boss..'extimeadd'..msg.to.id, 300 , true)
local names = redis:hkeys(boss..'replay:'..msg.to.id) for i=1, #names do redis:hdel(boss..'replay:'..msg.to.id,names[i]) end
return '📛*¦* تـم تـعـطـيـل الـمـجـمـوعـه ⚠️'
end
function action_by_reply(arg, data)
local cmd = arg.cmd
if not tonumber(data.sender_user_id_) then return false end
if data.sender_user_id_ then
if cmd =="tqeed" then
local function tqeed(arg,data)
if (is_mod1(arg.chat_id, data.id_) or data.id_ == our_id or is_whitelist(data.id_, arg.chat_id) ) then  return sendMsg(arg.chat_id,arg.msg_id,"👤*¦* لآ يمـگنگ تقييد آلمـدرآء آو آلآدمـنيهہ‏‏ \n📛","md") end
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
https.request('https://api.telegram.org/bot'.._info.TOKEN..'/restrictChatMember?chat_id='..arg.chat_id..'&user_id='..data.id_..'&can_send_messages=false')
redis:hset(boss..'username:'..data.id_, 'username', user_name)
redis:sadd(boss..':tqeed:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تم تقييد آلعضـو بنجآح \n✓️',"md") end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},tqeed,{msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end  
if cmd =="fktqeed" then
local function tqeed(arg,data)
if (is_mod1(arg.chat_id, data.id_) or data.id_ == our_id or is_whitelist(data.id_, arg.chat_id) ) then  return sendMsg(arg.chat_id,arg.msg_id,"👤*¦* لآ يمـگنگ تقييد آلمـدرآء آو آلآدمـنيهہ‏‏ \n📛","md") end
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
https.request('https://api.telegram.org/bot'.._info.TOKEN..'/restrictChatMember?chat_id='..arg.chat_id..'&user_id='..data.id_..'&can_send_messages=true&can_send_media_messages=true&can_send_other_messages=true&can_add_web_page_previews=true')
redis:srem(boss..':tqeed:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تم فگ تقييد آلعضـو بنجآح \n✓️',"md") end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},tqeed,{msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "setmnsha" then
local function setwhitelist_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if redis:sismember(boss..':MONSHA_BOT:'..arg.chat_id,data.id_) then return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..'\n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* انه بالتأكيد منشىء \n✓️',"md") end
redis:hset(boss..'username:'..data.id_, 'username', user_name)
redis:sadd(boss..':MONSHA_BOT:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تمت ترقيته ليصبح منشىء في البوت \n✓️',"md") end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, setwhitelist_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "remmnsha" then
local function remwhitelist_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if not redis:sismember(boss..':MONSHA_BOT:'..arg.chat_id,data.id_) then return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..'\n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* انه بالتأكيد ليس منشىء \n✓️', "md") end
redis:srem(boss..':MONSHA_BOT:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تم تنزيله من المنشىء \n✓️',"md")
end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, remwhitelist_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "setwhitelist" then
local function setwhitelist_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if redis:sismember(boss..'whitelist:'..arg.chat_id,data.id_) then return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..'\n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* انه بالتأكيد من عضو مميز \n✓️',"md") end
redis:hset(boss..'username:'..data.id_, 'username', user_name)
redis:sadd(boss..'whitelist:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تمت ترقيته ليصبح ضمن عضو مميز \n✓️',"md") end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, setwhitelist_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "remwhitelist" then
local function remwhitelist_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if not redis:sismember(boss..'whitelist:'..arg.chat_id,data.id_) then return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..'\n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* انه بالتأكيد ليس من عضو مميز \n✓️',"md") end
redis:srem(boss..'whitelist:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تمت تنزيله من عضو مميز \n✓️',"md")
end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, remwhitelist_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "setowner" then
local function owner_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if redis:sismember(boss..'owners:'..arg.chat_id,data.id_) then return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..'\n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* انه بالتأكيد مدير \n✓️',"md") end
redis:hset(boss..'username:'..data.id_, 'username', user_name)
redis:sadd(boss..'owners:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تمت ترقيته ليصبح مدير \n✓️',"md") end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, owner_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "promote" then
local function promote_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if redis:sismember(boss..'admins:'..arg.chat_id,data.id_) then return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* انه بالتأكيد ادمن \n✓️',"md") end
redis:hset(boss..'username:'..data.id_, 'username', user_name)
redis:sadd(boss..'admins:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تمت ترقيته ليصبح ادمن \n✓️',"md")
end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, promote_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "remowner" then
local function rem_owner_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if not redis:sismember(boss..'owners:'..arg.chat_id,data.id_) then return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* انه بالتأكيد ليس مدير \n✓️',"md") end
redis:srem(boss..'owners:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تم تنزيله من الاداره \n✓️',"md")
end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, rem_owner_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "demote" then
local function demote_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if not redis:sismember(boss..'admins:'..arg.chat_id,data.id_) then return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* انه بالتأكيد ليس ادمن \n✓️',"md") end
redis:srem(boss..'admins:'..arg.chat_id,data.id_)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تم تنزيله من الادمنيه \n✓️',"md")
end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, demote_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "iduser" then
local function id_user(arg, data)  return sendMsg(arg.chat_id,arg.msg_id,"`"..data.id_.."`","md") end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, id_user, {msg_id=arg.msg_id,chat_id=data.chat_id_})
end
if cmd == "whois" then
local function showinfo(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* الاسم » ['..data.first_name_..']\n🎫*¦* الايدي » (`'..data.id_..'`) \n🛠*¦* المعرف » '..user_name..'\n📃','md') end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},showinfo, {msg_id=arg.msg_id,chat_id=data.chat_id_}) end
if cmd == "active" then
local function id_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
msgs = tonumber(redis:get(boss..'msgs:'..data.id_..':'..arg.chat_id) or 1)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..'\n📮*¦* رسائلك » '..msgs..' رسالةة \n🔖*¦* التفاعل »  '..get_ttl(msgs)..' \n🙇🏽','md') end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, id_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "ban" then
local function ban_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if (is_mod1(arg.chat_id, data.id_) or data.id_ == our_id ) then return sendMsg(arg.chat_id,arg.msg_id,"👤*¦* لا تستطيع حظر المدراء او الادمنيه\n📛","md") end
if redis:sismember(boss..'banned:'..arg.chat_id,data.id_) then
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تم بالتأكيد حظره \n✓️',"md")
end
redis:hset(boss..'username:'..data.id_, 'username', user_name)
redis:sadd(boss..'banned:'..arg.chat_id,data.id_)
kick_user(data.id_, arg.chat_id)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تم حظره \n✓️',"md")
end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, ban_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "unban" then
local function unban_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if not redis:sismember(boss..'banned:'..arg.chat_id,data.id_) then return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تم بالتأكيد الغاء حظره \n✓️', "md") end
redis:srem(boss..'banned:'..arg.chat_id,data.id_)
channel_unblock(arg.chat_id, arg.user_id)
return sendMsg(arg.chat_id,arg.msg_id,'👤*¦* العضو » '..user_name..' \n🎫*¦* الايدي » (`'..data.id_..'`)\n🛠*¦* تم الغاء حظره \n✓️', "md")
end
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_}, unban_cb, {msg_id=arg.msg_id,chat_id=data.chat_id_,user_id=data.sender_user_id_})
end
if cmd == "silent" then
local function silent_cb(arg, data)
if data.username_ then user_name = '@'..check_markdown(data.username_) else user_name = check_markdown(data.first_name_) end
if (is_mod1(arg.chat_id, data.id_) or data.id_ == our_id or is_whitelist(data.id_, arg.chat_id) ) then  return sendMsg(arg.chat_id,arg.msg_id,"👤*¦* لا تستطيع كتم المدراء او الادمنيه\n📛", "md") end