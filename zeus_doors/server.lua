local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "zeus_doors")
frontend = Tunnel.getInterface("zeus_doors", "zeus_doors")

backend = {}
Tunnel.bindInterface("zeus_doors", backend)

function backend.CheckPW(pw)
    player = source
    user_id = vRP.getUserId({source})
    MySQL.Async.fetchAll(
        "SELECT * FROM zeus_doors",
        {},
        function(result)
            for k, v in pairs(result) do
                exports.ghmattimysql:execute(
                    "SELECT * FROM zeus_doors WHERE password = @password",
                    {password = v.password},
                    function(rows, affected)
                        if pw == v.password then
                            frontend.open(1)
                        else
                            frontend.open(1)
                        end
                    end
                )
            end
        end
    )    
end