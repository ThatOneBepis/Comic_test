if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_1_010_here_we_are"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_1_020_this_level_of_mainframe"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_1_030_this_is_expensive"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_1_040_rockets_will_look"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_1_050_there_are_also_disadvantages")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end
