if not CFG:isHeadless() then
    local TAG = "2.1.lua: "
    local i18n = managers.LocaleManager.i18n

    log(TAG .. "script was successfully loaded")

    local sm -- systems.GraphicsSystem.storylineMessages
    local st -- systems.GraphicsSystem.subtitles
    local setupListener
    local disposeListener

    local forceSubtitles = false

    local tut
    tut = tutorial:new({
        {
            check = function()
                return systems.WaveSystem:getCompletedWavesCount() >= 10
            end,
            start = function()
                if not systems.GameStateSystem.gameIsContinued then
                    local messages = {
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_1_010_stage_two_permissions"),
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_1_020_as_i_said_i_got_access"),
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_1_030_once_i_was_wandering"),
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_1_040_now_i_can_open_them"),
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_1_050_someone_switched_off"),
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_1_060_youll_find_button")
                    }
                    if forceSubtitles then
                        st:schedule(messages, 2, 6)
                    else
                        tutorial:delay(2, function()
                            sm:queue(messages)
                            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                                run = function()
                                    log("Stage 1 sm continue")
                                end
                            }))
                        end)
                    end
                end
            end,
            done = function()
                if not systems.GameStateSystem.gameIsContinued then
                    local messages = {
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_1_070_did_you_notice"),
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_1_080_use_researches")
                    }
                    local postMessages = {
                        tut.ENSOR_TAG .. " ACCESS ERROR \\\\dc0f0009 INVALID PROTOCOL",
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_1_090_never_mind")
                    }

                    if forceSubtitles then
                        st:schedule(messages, 0, 5)
                        st:schedule(postMessages, 15, 2)
                    else
                        sm:queue(messages)
                        sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                            run = function()
                                st:schedule(postMessages, 10, 2)
                            end
                        }))
                    end
                end
            end
        }
    })

    local stateSystemListener = luajava.createProxy(GNS .. "systems.GameStateSystem$GameStateSystemListener", {
        realUpdate = function(deltaTime)
            tut:update(deltaTime)
        end,

        affectsGameState = function() return false end
    })

    setupListener = function()
        if not systemProvider.config.headless then
            sm = systems.GraphicsSystem.storylineMessages
            st = systems.GraphicsSystem.subtitles

            -- Узнаем, надо ли показывать оверлей с сообщениями
            forceSubtitles = managers.BasicLevelManager:getLevel("2.1").gameStartsCount > 1

            tut:start()

            -- Слушаем изменения
            systems.GameStateSystem.listeners:add(stateSystemListener)
        end

        --
        addEventHandler("SystemDispose", disposeListener)
        log(TAG .. "Started")
    end

    disposeListener = function()
        if not systemProvider.config.headless then
            systems.GameStateSystem.listeners:remove(stateSystemListener)
        end

        --
        removeEventHandler("SystemPostSetup", setupListener)
        removeEventHandler("SystemDispose", disposeListener)
        log(TAG .. "Stopped")
    end

    addEventHandler("SystemPostSetup", setupListener)
end