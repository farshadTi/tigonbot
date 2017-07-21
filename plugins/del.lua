local function delmsg (i,naji)
    msgs = i.msgs
    for k,v in pairs(naji.messages_) do
        msgs = msgs - 1
        tdcli.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
        if msgs == 1 then
            tdcli.deleteMessages(naji.messages_[0].chat_id_,{[0] = naji.messages_[0].id_}, dl_cb, cmd)
            return false
        end
    end
    tdcli.getChatHistory(naji.messages_[0].chat_id_, naji.messages_[0].id_,0 , 100, delmsg, {msgs=msgs})
end
local function run(msg, matches)
    if matches[1] == 'del' and is_owner(msg) then
    if redis:get("delchat:"..msg.to.id) then
    return "_این کار فقط هر 1ساعت 1بار ممکن میباشد لطفا بعد از یک ساعت دوباره امتحان کنید_"
    end
        if tostring(msg.to.id):match("^-100") then
            if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then
                return  '🚫 *1000*> _تعداد پیام های قابل پاک سازی در هر دفعه_ >*1* 🚫'
            else
        tdcli.getChatHistory(msg.to.id, msg.id,0 , 100, delmsg, {msgs=matches[2]})
        redis:setex("delchat:"..msg.to.id,3600,true)
        return ""..matches[2].." _پیام اخیر با موفقیت پاکسازی شدند_ 🚮"
            end
        else
            return '⚠️ _این قابلیت فقط در سوپرگروه ممکن است_ ⚠️'
        end
    end
end
return {
    patterns = {
        '^[!#/]([Dd][Ee][Ll]) (%d*)$',
    },
    run = run
}
