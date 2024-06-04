local timer = 0
local cantBreakFree = true
CreateThread(function()
    while true do
        local hogtied = Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId())
        Wait(5)
        DisableControlAction(1, 0x6E9734E8, true)

        if hogtied then
            if cantBreakFree then
                DisableControlAction(1, 0x295175BF, true)
                timer = timer + 0.01
                if timer >= 30 then
                    cantBreakFree = false
                    timer = 0
                end
            elseif hogtied and cantBreakFree == false then 
                -- print("You can break free yet.")
            end
        elseif not hogtied and cantBreakFree == false then
            cantBreakFree = true
            timer = 0
            Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
            Citizen.Wait(0)
          
            Citizen.InvokeNative(0xB8DE69D9473B7593,PlayerPedId(),15)
    end
end) 