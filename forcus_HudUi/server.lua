local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
hudUIC = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())

hudUIS = {}
Tunnel.bindInterface(GetCurrentResourceName(), hudUIS)

function hudUIS.requestclient() 
	local player = source
	local user_id = vRP.getUserId({source})
	local playerID = vRP.getUserId({source})
	job = vRP.getUserGroupByType({playerID, "job"})
    local money = vRP.getMoney({user_id})
    local bankMoney = vRP.getBankMoney({user_id})
    TriggerClientEvent('open', player, money, bankMoney, user_id, job)
end