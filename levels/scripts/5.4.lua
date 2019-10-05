if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            systems.GraphicsSystem.subtitles:schedule({
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_4_010_i_decided_that"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_4_020_a_flamethrower_can"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_4_030_but_remember")
            }, 2, 5)
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)

end