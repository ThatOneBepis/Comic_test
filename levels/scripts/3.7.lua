if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_7_010_meet_the_new"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_7_020_its_attack_speed"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_7_030_it_also_has")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end