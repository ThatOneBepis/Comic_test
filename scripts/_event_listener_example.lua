local enemySystemListener = luajava.createProxy(GNS .. "systems.EnemySystem$EnemySystemListener", {
    -- Parameters can be skipped
    enemyDie = function(enemy, tower --[[ , damageType ]])
        log("enemyDie " .. tostring(enemy))
    end,

    -- Whole methods can be skipped
--    enemyTakeDamage = function(enemy, damage, tower, damageType)
--        log("enemyTakeDamage " .. tostring(enemy))
--    end,

    enemyReachedTarget = function(enemy)
        log("enemyReachedTarget " .. tostring(enemy))
    end
})

addEventHandler("SystemSetup", function()
    systems.EnemySystem:addListener(enemySystemListener)
    log("Started listener example")
end)

addEventHandler("SystemDispose", function()
    systems.EnemySystem:removeListener(enemySystemListener)
    log("Stoped listener example")
end)