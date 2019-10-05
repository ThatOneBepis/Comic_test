if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_1_5_010_theres_something_new"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_1_5_020_freezing_tower_has"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_1_5_030_it_cant_damage")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end