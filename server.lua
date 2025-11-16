local ox_inventory = exports.ox_inventory

lib.callback.register('coleta:coletarItem', function(source, index)
    local ponto = Config.PontosDeColeta[index]
    if not ponto then return false end

    local canCarry = ox_inventory:CanCarryItem(source, ponto.item, ponto.quantidade)

    if canCarry then
        ox_inventory:AddItem(source, ponto.item, ponto.quantidade)
        return true
    else
        -- Retorna falso, o client pode tratar a notificação
        return false
    end
end)
