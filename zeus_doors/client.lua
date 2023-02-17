vRP = Proxy.getInterface("vRP")
frontend = {}
Tunnel.bindInterface("zeus_doors", frontend)
Proxy.addInterface("zeus_doors", frontend)
backend = Tunnel.getInterface("zeus_doors", "zeus_doors")

-- local doorList = {
--     { coords = {0,0,0} , lock=true},
--     { coords = {-266.07498168945,-961.10437011719,31.223129272461} , lock=true}
-- }

function DrawText3d(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        SetDrawOrigin(x, y, z, 0)
        DrawText(0.0, 0.0)
        ClearDrawOrigin()
    end
end

function frontend.open()
    SendNUIMessage({
        result = 1
    })
    SetNuiFocus(false, false)
end

RegisterNUICallback("getserverpw", function(data)
    backend.CheckPW({data.password}) 
end)

RegisterCommand('12', function(source, args, RawCommand)
    SetNuiFocus( true, true )
    SendNUIMessage({
        open = true
    })
end)