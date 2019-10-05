if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_2_010_you_will_love"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_2_020_it_was_specially"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_2_030_not_so_good"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_2_040_by_the_way_beware"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_2_050_armored_enemies")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end
