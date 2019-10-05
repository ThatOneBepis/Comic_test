if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_2_010_on_this_level"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_2_020_to_deal_with_them"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_2_030_flying_enemies"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_2_040_also_remember")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)

end
