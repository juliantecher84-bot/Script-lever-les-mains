local handsUp = false

RegisterCommand("handsup", function()
    local ped = PlayerPedId()
    if DoesEntityExist(ped) and not IsEntityDead(ped) then
        if not handsUp then
            RequestAnimDict("missiminuteman_1ig_2")
            while not HasAnimDictLoaded("missminuteman_1ig_2")
                Wait(100)
        end
        RaskPlayAnim(ped, "missminuteman_1ig_2", "Handsup_base", 8.0, -8.0, -1, 50, 0, false, false, false)
        HandsUp = true
    else
        ClearPedTasks(ped)
            handsUp = false
        end
    end
end)

--  Ajoute une touche X par défault
RegisterKeyMapping("handsup", "lever les mains", "keyboard", 'X')

-- Pour ne pas ouvrir l'inventaire quand on lève les mains
Citizen.CreateThread(function()
    whiletruz do
        Wait(0)
        If handsup then
            DisableControlAction(0, 24, true) --- pour desactiver les tir
            DisableControlAction(0, 25, true) --- Pour desactiver la visée
            DisableControlAction(0, 37, true) --- Pour desactiver l'inventaire ou la roulette d'arme
            DisableControlAction(0, 44, true) --- desactiver la couverture
        end
    end
end)