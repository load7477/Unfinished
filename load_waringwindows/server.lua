local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
waringwindowC = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())

waringwindowS = {}
Tunnel.bindInterface(GetCurrentResourceName(), waringwindowS)

RegisterNetEvent('waringwindowSrequest')
AddEventHandler('waringwindowSrequest', function(reason, name)
    print('111')
    TriggerClientEvent('waringwindowCopenUi', source)
    TriggerClientEvent('waringwindowCsenduserdata', source, reason, name)
end)


RegisterCommand(
	"111",
	function(source, args, rawCommand)
		local user_id = vRP.getUserId({source})
		if user_id then
			if vRP.hasPermission({user_id, "admin.godmode"}) then
                local reason = args[1]
                local name = args[2]
                TriggerClientEvent('waringwindowCopenUi', source)
                TriggerClientEvent('waringwindowCsenduserdata', -1, reason, name)
            end
		end
	end
)

