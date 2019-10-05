if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_4_010_here_comes_the"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_4_020_its_projectiles"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_4_030_extremely_effective")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end