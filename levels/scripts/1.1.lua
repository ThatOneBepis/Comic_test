if not CFG:isHeadless() then
    log("script started")

    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        log("setupListener called")

        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ENSOR_TAG .. " " .. i18n:get("lvlsub_1_1_010_congratulations"),
                tutorial.ENSOR_TAG .. " " .. i18n:get("lvlsub_1_1_020_from_now_on"),
                tutorial.ENSOR_TAG .. " " .. i18n:get("lvlsub_1_1_030_your_task_is_simple"),
                tutorial.ENSOR_TAG .. " " .. i18n:get("lvlsub_1_1_040_dont_forget_about_quests")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end