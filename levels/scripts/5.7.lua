if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_7_010_the_final_is_near"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_7_020_the_main_great"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_7_030_it_can_cause_really"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_7_040_this_tower_has_a_small")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end