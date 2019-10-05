if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_5_010_you_will_like"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_5_020_tesla_releases_lightning"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_5_030_tower_copes_well"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_5_040_it_is_worth_remembering")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end