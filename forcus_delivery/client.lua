vRP = Proxy.getInterface("vRP")
deliveryC = {}
Tunnel.bindInterface(GetCurrentResourceName(), deliveryC)
Proxy.addInterface(GetCurrentResourceName(), deliveryC)
deliveryS = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())

function deliveryC.addcall(id, types, price, clientmsg) 
    source = source
    x = GetEntityCoords(GetPlayerPed(source)).x
    y = GetEntityCoords(GetPlayerPed(source)).y
    z = GetEntityCoords(GetPlayerPed(source)).z
    print(x, y, z)
    SendNUIMessage({call = "true", id = id, types = types, price = price, clientmsg = clientmsg, x = x, y = y, z =z}) --NUI로 데이터를 보냄
end


function deliveryC.open()
    SetNuiFocus(true, true)
    SendNUIMessage({action = "test"}) --NUI로 데이터를 보냄
end

RegisterNUICallback("delivery_close", function(data)
    deliveryC.addcall(123, '', '32,000', '빨리 와주떄요 !')
    Citizen.Wait(4000)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("sucess", function(data)
    BLIP_1 = AddBlipForCoord(data.x,  data.y,  data.z)
    SetBlipSprite(BLIP_1, 50)
    SetBlipRoute(BLIP_1,  true)
end)

RegisterCommand('1111', function(source, args, RawCommand)
    deliveryC.open()
end)