if not CFG:isHeadless() then
    local setupListener
    local i18n = managers.LocaleManager.i18n

    setupListener = function()
        if not systems.GameStateSystem.gameIsContinued and not systemProvider.config.headless then
            local forceSubtitles = managers.BasicLevelManager:getLevel("4.1").gameStartsCount > 1

            local sm = systems.GraphicsSystem.storylineMessages
            local st = systems.GraphicsSystem.subtitles

            local messages = {
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_1_010_well_i_think"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_1_020_levels_become"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_1_030_this_is_all"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_1_040_we_both_understand"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_1_050_you_went_too_far"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_1_060_in_the_end"),
                tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_4_1_070_and_yes_forget")
            }
            if forceSubtitles then
                st:schedule(messages, 2, 6)
            else
                sm:queue(messages)
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 1 sm continue")
                    end
                }))
            end
        end

        removeEventHandler("SystemPostSetup", setupListener)
    end

    addEventHandler("SystemPostSetup", setupListener)
end
