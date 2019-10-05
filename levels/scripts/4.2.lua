if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_2_010_the_time_has_come"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_2_020_each_projectile"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_2_030_enemy_can_be_poisoned"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_2_040_it_has_small_radius")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)

end