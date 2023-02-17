vRP = Proxy.getInterface("vRP")
waringwindowC = {}
Tunnel.bindInterface(GetCurrentResourceName(), waringwindowC)
Proxy.addInterface(GetCurrentResourceName(), waringwindowC)
waringwindowS = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())


RegisterNetEvent('waringwindowCsenduserdata')
AddEventHandler('waringwindowCsenduserdata', function(reason, name)
	SendNUIMessage({
		type = 'stopwindows',
        reason = reason,
        name = name,
	})
end)


RegisterNetEvent('waringwindowCopenUi')
AddEventHandler('waringwindowCopenUi', function()
    Citizen.Wait(3)
    SetNuiFocus(true, true)
	SendNUIMessage({
		type = 'open',
	})
end)

RegisterNUICallback("close_windows", function(data)
    SetNuiFocus(false, false)
end)