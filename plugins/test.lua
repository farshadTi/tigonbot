local function ATM(msg)
if msg.to.type ~= "pv" then
	tdcli.openChat(msg.to.id, dl_cb, nil)
	tdcli.sendChatAction(bot.id, 'Typing', 100, dl_cb, nil)
end
end

return {
	patterns = {},
	pre_process = ATM
	}