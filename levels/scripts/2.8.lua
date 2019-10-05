if not CFG:isHeadless() then
    local TAG = "2.8.lua: "
    local i18n = managers.LocaleManager.i18n

    log(TAG .. "script was successfully loaded")

    local BOSS_WAVE_NUMBER = 46

    local sm -- systems.GraphicsSystem.storylineMessages
    local st -- systems.GraphicsSystem.subtitles
    local setupListener
    local disposeListener

    local forceSubtitles = false

    local tut
    tut = tutorial:new({
        {
            check = function()
                return systems.WaveSystem:getCompletedWavesCount() >= BOSS_WAVE_NUMBER
            end,
            start = function()
                if not systems.GameStateSystem.gameIsContinued then
                    local messages = {
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_8_010_new_boss_incoming"),
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_8_020_it_is_a_representation"),
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_8_030_data_we_need"),
                        tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_8_040_just_try_to")
                    }
                    if forceSubtitles then
                        st:schedule(messages, 2, 5)
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

                tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber >= BOSS_WAVE_NUMBER - 3 end, function()
                    st:add(tut.ENSOR_TAG .. " " .. i18n:get("lvlsub_2_8_050_you_have_few_waves"))
                end)
            end,
            done = function()
                local messages = {
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_8_060_great_job"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_8_070_we_got_access"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_2_8_080_lets_move_on")
                }
                if forceSubtitles then
                    st:schedule(messages, 1, 5)
                else
                    sm:queue(messages)
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
            forceSubtitles = managers.BasicLevelManager:getLevel("2.8").maxReachedWave >= BOSS_WAVE_NUMBER

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