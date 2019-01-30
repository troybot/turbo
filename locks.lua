---------------Lock -------------------
function tqeed_photo(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..':tqeed_photo:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الصور بالتقييد \n✔️'
else
redis:set(boss..':tqeed_photo:'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* تم قفل الصور بالتقييد \n✔️'
end
end

function fktqeed_photo(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..':tqeed_photo:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم فتح الصور بالتقييد \n✔️'
else 
redis:del(boss..':tqeed_photo:'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*  تم فتح الصور بالتقييد \n✔️'
end
end

---------------Lock -------------------
function tqeed_video(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..':tqeed_video:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الفيديو بالتقييد \n✔️'
else
redis:set(boss..':tqeed_video:'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* تم قفل الفيديو بالتقييد \n✔️'
end
end

function fktqeed_video(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..':tqeed_video:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم فتح الفيديو بالتقييد \n✔️'
else 
redis:del(boss..':tqeed_video:'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*  تم فتح الفيديو بالتقييد \n✔️'
end
end

---------------Lock -------------------
function tqeed_gif(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..':tqeed_gif:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل المتحركه بالتقييد \n✔️'
else
redis:set(boss..':tqeed_gif:'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* تم قفل المتحركه بالتقييد \n✔️'
end
end

function fktqeed_gif(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..':tqeed_gif:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم فتح المتحركه بالتقييد \n✔️'
else 
redis:del(boss..':tqeed_gif:'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*  تم فتح المتحركه بالتقييد \n✔️'
end
end

---------------Lock -------------------
function tqeed_fwd(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..':tqeed_fwd:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل التوجيه بالتقييد \n✔️'
else
redis:set(boss..':tqeed_fwd:'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* تم قفل التوجيه بالتقييد \n✔️'
end
end

function fktqeed_fwd(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..':tqeed_fwd:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم فتح التوجيه بالتقييد \n✔️'
else 
redis:del(boss..':tqeed_fwd:'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح التوجيه بالتقييد \n✔️'
end
end

---------------Lock -------------------
function tqeed_link(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..':tqeed_link:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الروابط بالتقييد \n✔️'
else
redis:set(boss..':tqeed_link:'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* تم قفل الروابط بالتقييد \n✔️'
end
end

function fktqeed_link(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..':tqeed_link:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم فتح الروابط بالتقييد \n✔️'
else 
redis:del(boss..':tqeed_link:'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الروابط بالتقييد \n✔️'
end
end

---------------Lock -------------------
function tqeed_photo(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..':tqeed_photo:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الصور بالتقييد \n✔️'
else
redis:set(boss..':tqeed_photo:'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* تم قفل الصور بالتقييد \n✔️'
end
end

function fktqeed_photo(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..':tqeed_photo:'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم فتح الصور بالتقييد \n✔️'
else 
redis:del(boss..':tqeed_photo:'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الصور بالتقييد \n✔️'
end
end
---------------Lock twasel-------------------
function lock_twasel(msg)
if not we_sudo(msg) then return "🕵️‍♂️*~>*  انت لست مطور اساسي🚷" end
if redis:get(boss..'lock_twasel') then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بالتأكيد تم تعطيل التواصل \n✔️'
else
redis:set(boss..'lock_twasel',true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم تعطيل التواصل \n✔️'
end
end

function unlock_twasel(msg)
if not we_sudo(msg) then return "🕵️‍♂️*~>*  انت لست مطور اساسي🚷" end
if not redis:get(boss..'lock_twasel') then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم تفعيل التواصل \n✔️'
else 
redis:del(boss..'lock_twasel')
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*  تم تفعيل التواصل \n✔️'
end
end

---------------Lock bro-------------------
function lock_brod(msg)
if not we_sudo(msg) then return "🕵️‍♂️*~>*  انت لست مطور🚷" end
if not redis:get(boss..'lock_brod') then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بالتأكيد تم تعطيل اذاعة \n✔️'
else
redis:del(boss..'lock_brod')
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم تعطيل اذاعة \n✔️'
end
end
function unlock_brod(msg)
if not we_sudo(msg) then return "📡*¦* هذا الامر يخص المطور فقط  🚶" end
if redis:get(boss..'lock_brod') then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم تفعيل اذاعة \n✔️'
else 
redis:set(boss..'lock_brod',true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*  تم تفعيل اذاعة \n✔️'
end
end

---------------Lock replay-------------------
function lock_replay(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'replay'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بالتأكيد تم تعطيل الردود \n✔️'
else
redis:del(boss..'replay'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم تعطيل الردود \n✔️'
end
end

function unlock_replay(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'replay'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم تفعيل الردود \n✔️'
else 
redis:set(boss..'replay'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*  تم تفعيل الردود \n✔️'
end
end

---------------Lock bot service-------------------
function lock_service(msg)
if not we_sudo(msg) then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if not redis:get(boss..'lock_service') then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بالتأكيد تم تعطيل البوت الخدمي \n✔️'
else
redis:del(boss..'lock_service')
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم تعطيل البوت الخدمي \n✔️'
end
end

function unlock_service(msg)
if not we_sudo(msg) then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if redis:get(boss..'lock_service') then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* بالتأكيد تم تفعيل البوت الخدمي \n✔️'
else 
redis:set(boss..'lock_service',true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*  تم تفعيل البوت الخدمي \n✔️'
end
end

---------------Lock Link-------------------
function lock_link(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'lock_link'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الروابط  \n✔️'
else
redis:set(boss..'lock_link'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الروابط  \n✔️'
end
end

function unlock_link(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_link'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الروابط  \n✔️'
else 
redis:del(boss..'lock_link'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الروابط  \n✔️'
end
end

---------------Lock Tag-------------------
function lock_tag(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'lock_tag'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل التاك 《#》  \n✔️'
else
redis:set(boss..'lock_tag'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل التاك 《#》  \n✔️'
end
end

function unlock_tag(msg)

if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_tag'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح التاك 《#》  \n✔️'
else 
redis:del(boss..'lock_tag'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح التاك 《#》  \n✔️'
end
end
---------------Lock UserName-------------------
function lock_username(msg) 

if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end

if redis:get(boss..'lock_username'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل المعرفات  \n✔️'
else
redis:set(boss..'lock_username'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الصور  \n✔️✓'
end
end

function unlock_username(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_username'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح المعرفات  \n✔️'
else 
redis:del(boss..'lock_username'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الصور  \n✔️'
end
end

---------------Lock Edit-------------------
function lock_edit(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'lock_edit'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل التعديل  \n✔️'
else
redis:set(boss..'lock_edit'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل التعديل  \n✔️'
end
end

function unlock_edit(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_edit'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح التعديل  \n✔️'
else 
redis:del(boss..'lock_edit'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح التعديل  \n✔️'
end
end

---------------Lock spam-------------------
function lock_spam(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if   redis:get(boss..'lock_spam'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الكلايش  \n✔️
else
redis:set(boss..'lock_spam'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الكلايش  \n✔️'
end
end

function unlock_spam(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_spam'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الكلايش  \n✔️'
else 
redis:del(boss..'lock_spam'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الكلايش  \n✔️'
end
end

---------------Lock Flood-------------------
function lock_flood(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'lock_flood'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل التكرار  \n✔️'
else
redis:set(boss..'lock_flood'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل التكرار  \n✔️'
end
end

function unlock_flood(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_flood'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح التكرار  \n✔️'
else 
redis:del(boss..'lock_flood'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح التكرار  \n✔️'
end
end

---------------Lock Bots-------------------
function lock_bots(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'lock_bots'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل البوتات  \n✔️'
else
redis:set(boss..'lock_bots'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل البوتات  \n✔️'
end
end

function unlock_bots(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_bots'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح البوتات  \n✔️'
else 
redis:del(boss..'lock_bots'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح البوتات  \n✔️'
end
end

---------------Lock Join-------------------
function lock_join(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'lock_join'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الاضافة  \n✔️'
else
redis:set(boss..'lock_join'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الاضافة  \n✔️'
end
end

function unlock_join(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_join'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الاضافة  \n✔️'
else 
redis:del(boss..'lock_join'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الاضافة  \n✔️'
end
end

---------------Lock Markdown-------------------
function lock_markdown(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'lock_markdown'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الماركدون  \n✔️'
else
redis:set(boss..'lock_markdown'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الماركدون  \n✔️'
end
end

function unlock_markdown(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_markdown'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الماركدون  \n✔️'
else 
redis:del(boss..'lock_markdown'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الماركدون  \n✔️'
end
end

---------------Lock Webpage-------------------
function lock_webpage(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'lock_webpage'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الويب  \n✔️'
else
redis:set(boss..'lock_webpage'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الويب  \n✔️'
end
end

function unlock_webpage(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_webpage'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الويب  \n✔️'
else 
redis:del(boss..'lock_webpage'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الويب  \n✔️'
end
end
---------------Mute Gif-------------------
function mute_gif(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_gif'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل المتحركة  \n✔️'
else
redis:set(boss..'mute_gif'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل المتحركة  \n✔️'
end
end

function unmute_gif(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_gif'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح المتحركة  \n✔️'
else 
redis:del(boss..'mute_gif'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح المتحركة  \n✔️'
end
end
---------------Mute Game-------------------
function mute_game(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_game'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل game  \n✔️'
else
redis:set('mute_game'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل game  \n✔️'
end
end

function unmute_game(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_game'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح game  \n✔️'
else 
redis:del(boss..'mute_game'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح game  \n✔️'
end
end
---------------Mute Inline-------------------
function mute_inline(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_inline'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الانلاين  \n✔️'
else
redis:set(boss..'mute_inline'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الانلاين  \n✔️'
end
end

function unmute_inline(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_inline'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الانلاين  \n✔️'
else 
redis:del(boss..'mute_inline'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الانلاين  \n✔️'
end
end
---------------Mute Text-------------------
function mute_text(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_text'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الدردشة  \n✔️'
else
redis:set(boss..'mute_text'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الدردشة  \n✔️'
end
end

function unmute_text(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_text'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الدردشة  \n✔️'
else 
redis:del(boss..'mute_text'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الدردشة  \n✔️'
end
end
---------------Mute photo-------------------
function mute_photo(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_photo'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الصور  \n✔️'
else
redis:set(boss..'mute_photo'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الصور  \n✔️'
end
end

function unmute_photo(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_photo'..msg.to.id)then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الصور  \n✔️'
else 
redis:del(boss..'mute_photo'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الصور  \n✔️'
end
end
---------------Mute Video-------------------
function mute_video(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_video'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الفيديو  \n✔️'
else
redis:set(boss..'mute_video'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الفيديو  \n✔️'
end
end

function unmute_video(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_video'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الفيديو  \n✔️'
else 
redis:del(boss..'mute_video'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الفيديو  \n✔️'
end
end
---------------Mute Audio-------------------
function mute_audio(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_audio'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل البصمات  \n✔️'
else
redis:set(boss..'mute_audio'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل البصمات  \n✔️'
end
end

function unmute_audio(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_audio'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح البصمات  \n✔️'
else 
redis:del(boss..'mute_audio'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح البصمات  \n✔️'
end
end
---------------Mute Voice-------------------
function mute_voice(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if   redis:get(boss..'mute_voice'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الصوت  \n✔️'
else
redis:set(boss..'mute_voice'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الصوت  \n✔️'
end
end

function unmute_voice(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_voice'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الصوت  \n✔️'
else 
redis:del(boss..'mute_voice'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الصوت  \n✔️'
end
end
---------------Mute Sticker-------------------
function mute_sticker(msg) 

if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end

if   redis:get(boss..'mute_sticker'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الملصقات  \n✔️'
else
redis:set(boss..'mute_sticker'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الملصقات  \n✔️'
end
end

function unmute_sticker(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_sticker'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الملصقات  \n✔️'
else 
redis:del(boss..'mute_sticker'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الملصقات  \n✔️'
end
end
---------------Mute Contact-------------------
function mute_contact(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_contact'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل جهات  \n✔️'
else
redis:set(boss..'mute_contact'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل جهات  \n✔️'
end
end

function unmute_contact(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_contact'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح جهات  \n✔️'
else 
redis:del(boss..'mute_contact'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح جهات  \n✔️'
end
end
---------------Mute Forward-------------------
function mute_forward(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_forward'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل التوجية  \n✔️'
else
redis:set(boss..'mute_forward'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* تم قفل التوجية  \n✔️'
end
end

function unmute_forward(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_forward'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح التوجية  \n✔️'
else 
redis:del(boss..'mute_forward'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح التوجية  \n✔️'
end
end
---------------Mute Location-------------------
function mute_location(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_location'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الموقع  \n✔️'
else
redis:set(boss..'mute_location'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الموقع  \n✔️'
end
end

function unmute_location(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_location'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الموقع  \n✔️'
else 
redis:del(boss..'mute_location'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الموقع  \n✔️'
end
end
---------------Mute Document-------------------
function mute_document(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_document'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الملفات  \n✔️'
else
redis:set(boss..'mute_document'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الملفات  \n✔️'
end
end

function unmute_document(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_document'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الملفات  \n✔️'
else 
redis:del(boss..'mute_document'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح الملفات  \n✔️'
end
end
---------------Mute TgService-------------------
function mute_tgservice(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_tgservice'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الاشعارات  \n✔️'
else
redis:set(boss..'mute_tgservice'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الاشعارات  \n✔️'
end
end

function unmute_tgservice(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_tgservice'..msg.to.id) then🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الإشعارات  \n✔️'
return '
else 
redis:del(boss..'mute_tgservice'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الإشعارات  \n✔️'
end
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg) 
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'mute_keyboard'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل الكيبورد  \n✔️'
else
redis:set(boss..'mute_keyboard'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل الكيبورد  \n✔️'
end
end

function unmute_keyboard(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'mute_keyboard'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الكيبورد  \n✔️'
else 
redis:del(boss..'mute_keyboard'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح الكيبورد  \n✔️'
end
end

---------------lock_bots_by_kick-------------------
function lock_bots_by_kick(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if redis:get(boss..'lock_bots_by_kick'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》* بألتاكيد تم قفل البوتات  \n✔️'
else
redis:set(boss..'lock_bots_by_kick'..msg.to.id,true)
return '🕵‍♂*》* أهلا بك عزيزي \n🔐*》*  تم قفل البوتات مع طرد الي ضافة  \n✔️'
end
end

function unlock_bots_by_kick(msg)
if not is_mod(msg) then return "👮‍♂*~>*  انت لست أدمن🚷" end
if not redis:get(boss..'lock_bots_by_kick'..msg.to.id) then
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》*بالتأكيد تم فتح البوتات  \n✔️'
else 
redis:del(boss..'lock_bots_by_kick'..msg.to.id)
return '🕵‍♂*》* أهلا بك عزيزي \n🔓*》* تم فتح البوتات  \n✔️'
end
end