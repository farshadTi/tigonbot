--Start By @DevLoperTG
local function run(msg, matches) 
if matches[1] == "setpm" then 
if not is_sudo(msg) then 
return 'شما سودو نیستید' 
end 
local pm = matches[2] 
redis:set('bot:pm',pm) 
return 'متن پاسخ گویی ثبت شد' 
end 

if matches[1] == "pm" and is_sudo(msg) then
local hash = ('bot:pm') 
    local pm = redis:get(hash) 
    if not pm then 
    return ' ثبت نشده' 
    else 
	   return tdcli.sendMessage(msg.to.id , 0, 1, 'پیغام کنونی منشی:\n\n'..pm, 0, 'html')
    end
end

if matches[1]=="monshi" then 
if not is_sudo(msg) then 
return 'شما سودو نیستید' 
end 
if matches[2]=="on"then 
redis:set("bot:pm", "no pm")
return "منشی فعال شد لطفا دوباره پیغام را تنظیم کنید" 
end 
if matches[2]=="off"then 
redis:del("bot:pm")
return "منشی غیرفعال شد" 
end
 end
  if gp_type(msg.to.id) == "pv" and  msg.content_.text_ then
    local hash = ('bot:pm') 
    local pm = redis:get(hash)
if gp_type(msg.to.id) == "channel" or gp_type(msg.to.id) == "chat" then
return
else
 return  tdcli.sendMessage(msg.to.id , 0, 1, pm, 0, 'html')
    end 
    end
end
return { 
patterns ={ 
"^[!#/](setpm) (.*)$", 
"^[!#/](monshi) (on)$", 
"^[!#/](monshi) (off)$", 
"^[!#/](pm)$", 
"^(.*)$", 
}, 
run = run 
}

--End By @DevLoperTG
