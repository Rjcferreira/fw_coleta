local ativo = {}

-- Criar Blips
function CreateBlip(ponto)
    local blip = AddBlipForCoord(ponto.coords.x, ponto.coords.y, ponto.coords.z)
    SetBlipSprite(blip, ponto.blip.sprite or 1)
    SetBlipDisplay(blip, ponto.blip.display or 4)
    SetBlipScale(blip, ponto.blip.scale or 0.7)
    SetBlipColour(blip, ponto.blip.color or 1)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(ponto.label or "Coleta")
    EndTextCommandSetBlipName(blip)
end

-- Mostrar todos os blips ao iniciar
CreateThread(function()
    for _, ponto in pairs(Config.PontosDeColeta) do
        if ponto.blip then
            CreateBlip(ponto)
        end
    end
end)

-- Loop de coleta
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        for i, ponto in ipairs(Config.PontosDeColeta) do
            local dist = #(coords - ponto.coords)
            local area = ponto.area or 2.0
            local markerSize = ponto.markerSize or 1.0

            if dist < 20.0 then
                DrawMarker(1, ponto.coords.x, ponto.coords.y, ponto.coords.z - 1.0,
                    0, 0, 0, 0, 0, 0,
                    markerSize, markerSize, 0.5,
                    0, 255, 0, 150, false, true, 2, false, nil, nil, false)
            end

            if dist < area then
                lib.showTextUI("[E] para iniciar coleta de " .. ponto.item)

                if IsControlJustReleased(0, 38) and not ativo[i] then
                    ativo[i] = true
                    startColeta(i)
                end
            elseif ativo[i] then
                ativo[i] = false
                lib.hideTextUI()
            end
        end
    end
end)

-- Nova função usando lib.callback
function startColeta(i)
    CreateThread(function()
        local ponto = Config.PontosDeColeta[i]
        local area = ponto.area or 2.0

        while ativo[i] do
            local coords = GetEntityCoords(PlayerPedId())
            local dist = #(coords - ponto.coords)

            if dist < area then
                lib.callback('coleta:coletarItem', false, function(success)
                    if not success then
                        lib.notify({ title = "Coleta", description = "Inventário cheio!", type = "error" })
                        ativo[i] = false
                    end
                end, i)

                Wait((ponto.cooldown or 5) * 1000)
            else
                ativo[i] = false
                break
            end
        end

        lib.hideTextUI()
    end)
end
