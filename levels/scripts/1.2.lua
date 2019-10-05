if not CFG:isHeadless() then
    local TAG = "1.2.lua: "

    local setupListener
    local i18n = managers.LocaleManager.i18n

    log(TAG .. "Level " .. TAG .. " script was successfully loaded")

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_1_2_010_great_you_got_to"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_1_2_020_at_this_level"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_1_2_030_it_is_very_effective"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_1_2_040_also_a_little_slow")
            }, 2, 5)
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_1_2_050_by_the_way")
            }, 2 + 5 * 3 + 8, 0)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end