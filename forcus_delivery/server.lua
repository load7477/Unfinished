local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
deliveryC = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())

deliveryS = {}
Tunnel.bindInterface(GetCurrentResourceName(), deliveryS)

function deliveryS.getpermission()
    -- local user_id = vRP.GetUserId({source})
    return 123
end