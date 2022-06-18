Zones = {}
InZone = false
InZoneName = ""

CreateThread(function()
    while true do
        Wait(500)
        local playerCoords = GetEntityCoords(PlayerPedId())

        for k,v in pairs(Zones) do
            if #(playerCoords - v.coords) < v.radius then
                if not InZone and k ~= InZoneName then
                    InZone = true
                    InZoneName = k
                    TriggerEvent("p-zone:enter", k)
                end
            else
                if InZone and k == InZoneName then
                    InZone = false
                    InZoneName = ""
                    TriggerEvent("p-zone:exit", k)
                end
            end
        end
    end
end)


function registerZone(coords, radius, name)
    if Zones["zone_"..name] then
        print("[WARNING] Zone already exists. Reregistering zone: "..name)
        Zones["zone_"..name] = nil
    end

    Zones["zone_"..name] = { 
        coords = coords, 
        radius = radius 
    }
    return true
end

function removeZone(name)
    if not Zones["zone_"..name] then
        print("[ERROR] Zone doesn't exist ("..name..")")
        return false
    end 

    Zones["zone_"..name] = nil
    return true
end


exports("removeZone", removeZone)
exports("registerZone", registerZone)