if not CFG:isHeadless() then
    local TAG = "3.8.lua: "
    local i18n = managers.LocaleManager.i18n

    log(TAG .. "script was successfully loaded")

    local BOSS_WAVE_NUMBER = 50

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
                    systems.GraphicsSystem.subtitles:schedule({
                        tutorial.ENSOR_TAG .. " [#F44336]&-Fh#fc-##vp&*vb-h#fNp%gv-iv%g%l#Qrg#rp$g$$rq-![]",
                        tutorial.ENSOR_TAG .. " [#F44336]0x91CF0FF: -F#gb$c**Vg$![]",
                        tutorial.ENSOR_TAG .. " [#F44336]P#baf*r&#dh#!ra-pr*fNer#P-ngnf&g&e#bcu-vp![]"
                    }, 9, 0.5)
                    systems.GraphicsSystem.subtitles:schedule({
                        tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_8_010_you_will_meet"),
                        tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_8_020_i_think_you_also"),
                        tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_8_030_well_not_interesting"),
                        tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_8_040_we_need_to_defeat"),
                        tutorial.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_8_050_his_name_is")
                    }, 2, 5)
                end

                tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber >= BOSS_WAVE_NUMBER - 3 end, function()
                    st:add(tut.ENSOR_TAG .. " " .. i18n:get("lvlsub_3_8_060_you_have_few_waves"))
                end)
            end,
            done = function()
                local messages = {
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_8_070_i_have_to_admit"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_8_080_now_its_time"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_3_8_090_finish_your_work")
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