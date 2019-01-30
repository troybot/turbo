--[[
<< تم برمجه وكتابه السورس من قبل مطور >>
<<         @sajadhassan          >>
]] 
function load_proc()
loadfile('./inc/functions.lua')()
loadfile('./inc/locks.lua')()
end
load_proc()
URL   = require('socket.url')
http  = require('socket.http')
https = require('ssl.https')
JSON  = require('cjson')
ltn12 = require ('ltn12')
Redis = require('redis')
redis = Redis.connect('127.0.0.1',6379)
Tolgi = require ('lgi')
doify = Tolgi.require('Notify')
doify.init ('Telegram updates')
local chats = {}
local plugins = {}
function doify(alado,rsala) doify.Notification.new(alado,rsala):show() end
function create_config()
local ip_login = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
if not redis:get(ip_login..":TOKEN") then
io.write('\n\27[1;33m￤ارسل توكن البوت الان ↓  \n￤Enter TOKEN your BOT : \27[0;39;49m')
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token:gsub(' ','')..'/getMe')
if res ~= 200 then
print('\n\27[1;31m￤ Your Token is Incorrect Please Check it!\n￤ التوكن غير شغال تاكد منه وحاول مره مجددا!')
create_config()
else
local jjson = JSON.decode(url)
redis:set(ip_login..":USERBOT:","@"..jjson.result.username)
redis:set(jjson.result.id..'bot:name',jjson.result.first_name)
io.write('\n\27[1;36m￤تم ادخال التوكن بنجاح   \n￤Success Enter Your Token: \27[1;34m@'..jjson.result.username..'\n\27[0;39;49m')
redis:set(ip_login..":TOKEN",token)
end else
print('\n\27[1;31m￤ You Did not Enter TOKEN !\n￤ لم تقوم بادخال التوكن | انتبه !')
create_config()
end end
if not redis:get(ip_login..":SUDO_USER") then
io.write('\n\27[1;33m￤ادخل معرف المطور ↓  \n￤Enter your USERNAME SUDO : \27[0;39;49m')
SUDO_USER = io.read()
if SUDO_USER ~= '' then
if string.match(SUDO_USER, '@[%a%d_]') then
local url , res = https.request('https://blcon.tk/GetID/?User='..SUDO_USER)
if res ~= 200 then
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث خطأ في الاتصال !')
create_config()
else
local jjson = JSON.decode(url)
if jjson.result then
print('\n\27[1;36m￤تم حفظ معرف المطور واستخراج الايدي منه \n￤Success Save USERNAME IS_ID: \27[0;32m['..jjson.information.id..']\n\27[0;39;49m')
redis:set(ip_login..":SUDO_USER",true)
redis:set(ip_login..":SUDO_USER",'@'..jjson.information.username)
redis:set(ip_login..":SUDO_IDX",jjson.information.id)
else
print('\n\27[1;31m￤ USERNAME is Incorrect Please Check it!\n￤ معرفك غير صحيح تاكد منه وحاول مجددا !')
create_config()
end end else
print('\n\27[1;31m￤ This is Not USERNAME !\n￤ المعرف غير صحيح او خطأ !')
create_config()
end else
print('\n\27[1;31m￤ You Did not Enter USERNAME !\n￤ لم تقوم بادخال معرف المطور | انتبه !')
create_config()
end end
local REBD = redis:get(ip_login..":TOKEN"):match("(%d+)")
local getversion = https.request('https://api.th3boss.com/version/')
redis:set(REBD..":VERSION",getversion)
redis:sadd(REBD..':PLUGINS_FILE:','cmd_help')
redis:sadd(REBD..':PLUGINS_FILE:','plug_manager')
redis:sadd(REBD..':PLUGINS_FILE:','proc_msgs')
redis:sadd(REBD..':PLUGINS_FILE:','rdod_bot')
redis:sadd(REBD..':PLUGINS_FILE:','super_group')
os.execute("timedatectl set-timezone Asia/Baghdad")
insert(redis:get(ip_login..":SUDO_USER"),redis:get(ip_login..":SUDO_IDX"),redis:get(ip_login..":USERBOT:"))
file = io.open("./inc/info.lua", "w")
file:write([[
do local _ = {
  TOKEN = "]]..redis:get(ip_login..":TOKEN")..[[",
  SUDO_USER = "]]..redis:get(ip_login..":SUDO_USER")..[[",
  SUDO_ID = ]]..redis:get(ip_login..":SUDO_IDX")..[[,
}
return _
end
]])
file:close()
file = io.open("run", "w")
file:write([[
#!/usr/bin/env bash
cd $(cd $(dirname $0); pwd)
if ! screen -list | grep -q "boss"; then
screen -S boss lua ./inc/BOT.lua
fi
screen -X -S boss kill
screen -S boss lua ./inc/BOT.lua
]])
file:close()
print ('\27[1;36minfo.lua is created.\27[m')
os.execute([[
cd $(cd $(dirname $0); pwd)
 rm ./README.md
 rm -rf ./.git
chmod +x ./run
./run
]])
end
function load_config()
local fopen = io.open('./inc/info.lua', "r")
if not fopen then
local ip_login = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
redis:del(ip_login..":TOKEN") 
redis:del(ip_login..":SUDO_USER") 
redis:del(ip_login..":BOT_NAME") 
create_config() else
fopen:close()
local info = loadfile ("./inc/info.lua")()
local url , res = https.request('https://api.telegram.org/bot'..info.TOKEN..'/getMe')
if res ~= 200 then
print("\n\n\n\n \027[0;31m ERROR FOR YOU TOKEN CORECT YOU TOKEN IN FILE ./info.lua \027[00m \n\n\n\n")
print("\n\n \027[0;31m يوجد خطأ في التوكن قم بوضع التوكن بشكل صحيح في ملف الكونفك \027[00m \n\n\n\n")
os.exit()
else

if not redis:get(info.TOKEN:match("(%d+)")..":RUN_BOT") then
redis:setex(info.TOKEN:match("(%d+)")..":RUN_BOT",5,true)
os.execute([[
rm -fr $HOME/.telegram-cli
token="]]..info.TOKEN..[["
if [ ! -f ./TG ]; then
    echo "TG Is Not Found"
    echo "Run ./ins And Install The Sourse"
    exit 1
fi

COUNTER=1

while(true) do
echo "]]..'\027[0;32m'..[["
curl "https://api.telegram.org/bot"$token"/sendmessage" -F
./TG -s ./inc/BOT.lua $@ --bot=$token

let COUNTER=COUNTER+1 
done

]])

end
redis:del(info.TOKEN:match("(%d+)")..":RUN_BOT")
local TGO = JSON.decode(url)
redis:set(info.TOKEN:match("(%d+)")..":username","@"..TGO.result.username)

login = string.gsub(io.popen("whoami"):read('*a'), '[\n\r]+', '') 
if login:match("^root$") then
TG_folder = '/root/.telegram-cli'
elseif not login:match("^root$") then
TG_folder = '/home/'..login..'/.telegram-cli'
end
os.execute("timedatectl set-timezone Asia/Baghdad")
print('\27[0;33m>>'..[[







▀█████████▄   ▄██████▄     ▄████████    ▄████████ 
  ███    ███ ███    ███   ███    ███   ███    ███ 
  ███    ███ ███    ███   ███    █▀    ███    █▀  
 ▄███▄▄▄██▀  ███    ███   ███          ███        
▀▀███▀▀▀██▄  ███    ███ ▀███████████ ▀███████████ 
  ███    ██▄ ███    ███          ███          ███ 
  ███    ███ ███    ███    ▄█    ███    ▄█    ███ 
▄█████████▀   ▀██████▀   ▄████████▀   ▄████████▀  
                                                  
]]..'\27[0;31m'..[[¦ Dev : @wm_ww]]..'\27[m\27[0;32m\n\n\027[0;32m'   
..'\27[0;31m'..[[¦ Dev : @sajadhassan]]..'\27[m\27[0;32m\n\n\027[0;32m'   
..'¦ TOKEN_BOT: \27[1;34m'..info.TOKEN..'\027[0;32m\n'
..'¦ USER__BOT: \27[1;34m@'..TGO.result.username..'\027[0;32m\n'
..'¦ IS_ID_BOT: \27[1;34m'..TGO.result.id..'\027[0;32m\n'
..'¦ DB__REDIS: \27[1;34m'..info.TOKEN:match("(%d+)")..'\027[0;32m\n'
..'¦ INFO_SUDO: \27[1;34m'..info.SUDO_USER:gsub('\\','')..'\27[0;36m ('..info.SUDO_ID..')\27[m\027[0;32m\n'
..'¦ LOGIN__IN: \27[1;34m'..login..'\027[0;32m \n'
..'¦ VERSION->: \27[1;34mv'..redis:get(info.TOKEN:match("(%d+)")..":VERSION")..'\027[0;32m \n'
..'===================================\n\27[0;33m'
..'>> Download Path : \27[0;32m\27[31m'..TG_folder..'\27[39m\n')
end
return info
end end
_info = load_config()
boss = _info.TOKEN:match("(%d+)")
our_id = tonumber(boss)
bot_username = redis:get(boss..":username")
SUDO_USER = check_markdown(_info.SUDO_USER) 
SUDO_ID = _info.SUDO_ID 
if redis:get(our_id..":WITTING:ON") then
send_msg(redis:get(our_id..":WITTING:ON"),'📟*¦* تم اعادة تشغيل البوت ✓',nil,'md')
redis:del(our_id..":WITTING:ON")
end
function match_plugins(msg)
for name, plugin in pairs(plugins) do
match_plugin(plugin, name, msg)
end end
function load_plugins()
local list_plug = redis:smembers(boss..':PLUGINS_FILE:')
for k, v in pairs(list_plug) do
print("\27[0;36mLoaded Plugin  ", v..'\27[m')
local ok, ERROR_info =  pcall(function() plugins[v] = loadfile("plugins/"..v..'.lua')() end)
if not ok then
print('\27[31mError loading plugins '..v..'\27[39m')
print(tostring(io.popen("lua plugins/"..v..".lua"):read('*all')))
print('\27[31m'..ERROR_info..'\27[39m')
end end
print('\n\27[0;32mPlugins is : '..#list_plug..' Are Active.\n\n\27[0;31mThe SOURCE RUN IS aws_c9 v'..redis:get(boss..':VERSION')..'...\n\27[m')
end
load_plugins()
function msg_check(msg)
if tonumber(msg.date_ or 0) < (tonumber(os.time()) - 30) then
print('\27[36m¦¦¦¦   (THIS_IS_OLD_MSG)   ¦¦¦¦\27[39m')
return false end 
if not (tostring(msg.chat_id_):match('^-100') or tostring(msg.chat_id_):match('-')) and redis:get(boss..':mute_pv:'..msg.sender_user_id_) then
print('is_MUTE_BY_FLOOD')
return false end
if is_silent_user(msg.sender_user_id_,msg.chat_id_) then 
del_msg(msg.chat_id_,msg.id_)
return false end
if is_gbanned(msg.sender_user_id_) then
print('is_G_BAN_USER')
del_msg(msg.chat_id_, msg.id_)
kick_user(msg.sender_user_id_, msg.chat_id_)
return false end
if is_banned(msg.sender_user_id_, msg.chat_id_) then
print('is_BANED_USER')
del_msg(msg.chat_id_, msg.id_)
kick_user(msg.sender_user_id_, msg.chat_id_)
return false end
if not is_mod1(msg.chat_id_,msg.sender_user_id_) then
if redis:get(boss..'mute_text'..msg.chat_id_) then --قفل الدردشه
del_msg(msg.chat_id_, tonumber(msg.id_))
return false end
if is_filter(msg.chat_id_,msg.content_.text_ or msg.content_.caption_) then
del_msg(msg.chat_id_, tonumber(msg.id_))
return false
end end return true
end
function msg_pattern(pattern,text)
if text then
local matches = {}
matches = {string.match(text,pattern)} 
if next(matches) then
return matches
end end end
function match_plugin(plugin,plug_name,msg)
if plugin.pre_process and plugin.pre_process(msg) then
print("¦This_process: ",plug_name)
end
for k, pattern in pairs(plugin.patterns) do
matches = msg_pattern(pattern,msg.content_.text_ or msg.content_.caption_)
if matches then
print("¦This_Message: ",pattern..' | Plugin is: '..plug_name)
if plugin.run then
local TEXT = plugin.run(msg,matches)
if TEXT then
sendMsg(msg.chat_id_,msg.id_,TEXT,"md")
end end return end end end
function msg_info(msg)
msg.to = {}
msg.from = {}
msg.media = {}
msg.to.id = msg.chat_id_ or 0
msg.to.type = GP_Type(msg.chat_id_)
msg.media.caption = (msg.content_.caption_ or false)
if msg.reply_to_message_id_ ~= 0 then	msg.reply_id = msg.reply_to_message_id_ end
tdcli_function ({ID = "GetUser", user_id_ = msg.sender_user_id_},function(arg,data)
msg.from.id = data.id_ or 0
msg.from.username = (data.username_ or false)
msg.from.first_name = (data.first_name_ or '')
msg.from.last_name = (data.last_name_ or '')
match_plugins(msg)
end,nil)
end
function tdcli_update_callback (data)
if data.ID == "UpdateNewMessage" then
local msg = data.message_
if ((not data.disable_notification_) and chats[msg.chat_id_]) then if msg.content_.ID == "MessageText" then doify(chats[msg.chat_id_].title_, msg.content_.text_)  else doify(chats[msg.chat_id_].title_, msg.content_.ID) end end

if msg_check(msg) then
msg_info(msg)
	if msg.content_.ID == "MessageText" then
	msg.text = msg.content_.text_
	msg.edited = false
	msg.pinned = false
	elseif msg.content_.ID == "MessagePinMessage" then
	msg.pinned = true
	elseif msg.content_.ID == "MessagePhoto" then
	msg.photo_ = true 
	if msg.content_.photo_.sizes_[3] then  photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ else photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ end
	elseif msg.content_.ID == "MessageVideo" then
	msg.video_ = true
	video_id = msg.content_.video_.video_.persistent_id_
	elseif msg.content_.ID == "MessageAnimation" then
	msg.animation_ = true
	animation_id = msg.content_.animation_.animation_.persistent_id_
	elseif msg.content_.ID == "MessageVoice" then
	msg.voice_ = true
	voice_id = msg.content_.voice_.voice_.persistent_id_
	elseif msg.content_.ID == "MessageAudio" then
	msg.audio_ = true
	audio_id = msg.content_.audio_.audio_.persistent_id_
	elseif msg.forward_info_ then
   	msg.forward_info_ = true 
	elseif msg.content_.ID == "MessageSticker" then
	msg.sticker_ = true
	sticker_id = msg.content_.sticker_.sticker_.persistent_id_
	elseif msg.content_.ID == "MessageContact" then
	msg.contact_ = true
	elseif msg.content_.ID == "MessageDocument" then
	msg.document_ = true
	file_id = msg.content_.document_.document_.persistent_id_
	file_name = msg.content_.document_.document_.file_name_
	elseif msg.content_.ID == "MessageLocation" then
	msg.location_ = true
	elseif msg.content_.ID == "MessageGame" then
	msg.game_ = true
	elseif msg.content_.ID == "MessageChatAddMembers" then
	for i=0,#msg.content_.members_ do msg.adduser = msg.content_.members_[i].id_ end
	elseif msg.content_.ID == "MessageChatJoinByLink" then
	msg.joinuser = msg.sender_user_id_
	elseif msg.content_.ID == "MessageChatDeleteMember" then
	msg.deluser = true  end end
	elseif data.ID == "UpdateMessageContent" then  
	edit = data
	tdcli_function({ID ="GetMessage",chat_id_=data.chat_id_,message_id_=data.message_id_},function(arg, data)
	msg = data
	data.media = {}
	data.text = (edit.new_content_.text_ or false)
	data.media.caption = (edit.new_content_.caption_ or false)
	data.edited = true
	if msg_check(data) then msg_info(msg) end 
	end, nil)
	elseif data.ID == "UpdateFile" then
	file_id = data.file_.id_
	elseif (data.ID == "UpdateChat") then
	chat = data.chat_
	chats[chat.id_] = chat 
	elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
	tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)    
	end
end