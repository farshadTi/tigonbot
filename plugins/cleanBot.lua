
--Start By @TIGONBOTTEM

local function run(msg, matches)
if matches[1] == 'cleanbot' or '�ǘ ���� ������' then
  function clbot(arg, data)
    for k, v in pairs(data.members_) do
      kick_user(v.user_id_, msg.to.id)
        end
    tdcli.sendMessage(msg.to.id, msg.id, 1, '_All Bots was cleared._', 1, 'md')
  end
  tdcli.getChannelMembers(msg.to.id, 0, 'Bots', 200, clbot, nil)
  end
end

return {

patterns ={

'^[!/#](cleanbot)$'

 },
  run = run
}

 
