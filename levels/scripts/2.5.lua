if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_5_010_meet_brand_new"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_5_020_probably_youll_not"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_5_030_splash_tower_shoots"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_5_040_it_can_attack")
            }, 2, 5)

        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end