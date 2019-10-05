local TAG = "0.4.lua: "
local i18n = managers.LocaleManager.i18n

-- При открытии исследования SCALAR

log(TAG .. "Level 0.4 script was successfully loaded")

local GateSide = luajava.bindClass(GNS .. "Gate$Side")

local sm -- systems.GraphicsSystem.storylineMessages
local ql -- systems.GraphicsSystem.questList
local setupListener
local disposeListener

local questListItem

local s6_sideMenuWasOffscreen
local s5_ready = false

--

local tut
tut = tutorial:new({
    {-- Победить первую волну
        check = function()
            return systems.WaveSystem:getCompletedWavesCount() >= 1
        end,
        start = function()
            log("Stage 1 start")

            -- При вызове волны скрываем кнопку и останавливаем таймер волны
            tut:condition(function() return systems.WaveSystem.wave ~= nil end, function()
                systems.GraphicsSystem.mainUi:hideNextWaveButton()
                systems.WaveSystem:freezeTimeToNextWave(true)
            end)

            tut:delay(1, function()
                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_010_010_in_this_tutorial"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_010_020_lets_make_coins")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 1 sm continue")

                        -- Показываем счетчик MDPS
                        systems.GraphicsSystem.mainUi:showMdps(true, nil)

                        -- Добавляем квест
                        questListItem = ql:addQuestListItem()
                        questListItem:setText(i18n:get("tut_04_010_030_defeat_first_wave"))
                    end
                }))
            end)
        end,
        done = function()
            log("Stage 1 done")

            questListItem:setCompleted(true)
            tut:delay(1, function()
                ql:removeQuestListItem(questListItem)

                tut:startNextStage()
            end)
        end
    },
    {-- Выделить телепорт
        check = function()
            return systems.MapSystem:getSelectedGate() ~= nil and systems.MapSystem:getSelectedGate():getType() == enums.GateType.TELEPORT
        end,
        start = function()
            log("Stage 2 start")

            systems.MapSystem:removeHighlights()
            local map = systems.MapSystem:getMap()
            for y = 0, map.heightTiles do
                for x = 0, map.widthTiles do
                    for i = 1, 2 do
                        local gate = map:getGate(x, y, GateSide.values[i])
                        if gate ~= nil and gate:getType() == enums.GateType.TELEPORT then
                            systems.MapSystem:highlightGate(gate)
                        end
                    end
                end
            end

            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_020_010_enemies_can_pass"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_020_020_select_any_teleport")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 2 sm continue")
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_04_020_030_select_teleport"))
                end
            }))
        end,
        done = function()
            log("Stage 2 done")

            systems.GameStateSystem:addCompletedQuest("Q:0.4:1")

            systems.MapSystem:removeHighlights()

            questListItem:setCompleted(true)
            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)

                tut:startNextStage()
            end)
        end
    },
    {-- Победить вторую волну
        check = function()
            return systems.WaveSystem:getCompletedWavesCount() >= 2
        end,
        start = function()
            log("Stage 3 start")

            -- Показываем кнопку вызова волны
            systems.GraphicsSystem.mainUi:showNextWaveButton(false, nil)
            systems.WaveSystem:freezeTimeToNextWave(false)

            -- При вызове волны скрываем кнопку и останавливаем таймер волны
            tut:condition(function() return systems.WaveSystem.wave.waveNumber == 2 end, function()
                systems.GraphicsSystem.mainUi:hideNextWaveButton()
                systems.WaveSystem:freezeTimeToNextWave(true)
            end)

            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_030_010_deal_with_second_wave")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 3 sm continue")

                    -- Добавляем квест
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_04_030_020_defeat_one_more_wave"))
                end
            }))
        end,
        done = function()
            log("Stage 3 done")

            questListItem:setCompleted(true)
            tut:delay(1, function()
                ql:removeQuestListItem(questListItem)
                tut:startNextStage()
            end)
        end
    },
    {-- Выделить барьер
        check = function()
            return systems.MapSystem:getSelectedGate() ~= nil and systems.MapSystem:getSelectedGate():getType() == enums.GateType.BARRIER_TYPE
        end,
        start = function()
            log("Stage 4 start")

            systems.MapSystem:removeHighlights()
            local map = systems.MapSystem:getMap()
            for y = 0, map.heightTiles do
                for x = 0, map.widthTiles do
                    for i = 1, 2 do
                        local gate = map:getGate(x, y, GateSide.values[i])
                        if gate ~= nil and gate:getType() == enums.GateType.BARRIER_TYPE then
                            systems.MapSystem:highlightGate(gate)
                        end
                    end
                end
            end

            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_040_010_as_you_could_see"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_040_020_barriers_can_block")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 4 sm continue")
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_04_040_030_select_barrier"))
                end
            }))
        end,
        done = function()
            log("Stage 4 done")

            systems.MapSystem:removeHighlights()

            questListItem:setCompleted(true)

            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)

                -- Добавляем STRONG в список заблокированных врагов
                local map = systems.MapSystem:getMap()
                for y = 0, map.heightTiles do
                    for x = 0, map.widthTiles do
                        for i = 1, 2 do
                            local gate = map:getGate(x, y, GateSide.values[i])
                            if gate ~= nil and gate:getType() == enums.GateType.BARRIER_TYPE then
                                gate.blockedEnemies:add(enums.EnemyType.STRONG)
                                systems.MapSystem:setGate(gate:getX(), gate:getY(), gate:getSide(), gate)
                            end
                        end
                    end
                end

                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_040_040_barriers_can_also")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 4 sm continue")
                        tut:startNextStage()
                    end
                }))
            end)
        end
    },
    {-- Выделить тайл с ресурсом
        check = function()
            return s5_ready and systems.MapSystem:getSelectedTile() ~= nil and systems.MapSystem:getSelectedTile().type == enums.TileType.SOURCE
        end,
        start = function()
            log("Stage 5 start")

            systems.MapSystem:removeHighlights()
            systems.MapSystem:setSelectedTile(nil)

            local map = systems.MapSystem:getMap()
            for y = 0, map.heightTiles - 1 do
                for x = 0, map.widthTiles - 1 do
                    local tile = map:getTile(x, y)
                    if tile ~= nil and tile.type == enums.TileType.SOURCE then
                        systems.MapSystem:highlightTile(tile)
                    end
                end
            end

            tut:delay(1, function()
                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_050_010_lets_talk_about_resources"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_050_020_resources_are_useful"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_050_030_resources_can_be_obtained")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 5 sm continue")
                        questListItem = ql:addQuestListItem()
                        questListItem:setText(i18n:get("tut_04_050_040_select_source_tile"))

                        s5_ready = true
                    end
                }))
            end)
        end,
        done = function()
            log("Stage 5 done")

--            systems.MapSystem:removeHighlights()

            systems.GameStateSystem:addCompletedQuest("Q:0.4:2")

            questListItem:setCompleted(true)
            tut:delay(2, function()
                log("Stage 5 done continue")
                ql:removeQuestListItem(questListItem)

                tut:startNextStage()
            end)
        end
    },
    {-- Построить майнер
        check = function()
            return systems.MinerSystem.miners.size ~= 0
        end,
        update = function()
            local sideMenuOffscreen = systems.GraphicsSystem.sideMenu:isOffscreen()
            if s6_sideMenuWasOffscreen ~= sideMenuOffscreen then
                -- Меняем подсветку элементов UI
                managers.UiManager:removeAllHighlights()

                if sideMenuOffscreen then
                    -- Меню скрыто - подсвечиваем кнопку открытия меню
                    managers.UiManager:addHighlight(managers.UiManager:findActor("side_menu_toggle_button"))
                else
                    -- Меню открыто, подсвечиваем кнопку постройки
                    managers.UiManager:addHighlight(managers.UiManager:findActor("build_menu_miner_build_button_SCALAR"))
                end
                s6_sideMenuWasOffscreen = sideMenuOffscreen
            end
        end,
        start = function()
            log("Stage 6 start")

            tut:delay(1, function()
                managers.UiManager:findActor("build_menu_miner_build_buttons"):setVisible(true)

                -- Подсвечиваем кнопку постройки майнера
                s6_sideMenuWasOffscreen = not systems.GraphicsSystem.sideMenu:isOffscreen()

                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_060_010_youll_use_miners"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_060_020_we_have_enough_coins")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 6 sm continue")
                        questListItem = ql:addQuestListItem()
                        questListItem:setText(i18n:get("tut_04_060_030_build_a_miner"))
                    end
                }))
            end)
        end,
        done = function()
            log("Stage 6 done")

            systems.GameStateSystem:addCompletedQuest("Q:0.4:3")

            systems.MapSystem:removeHighlights()
            managers.UiManager:removeAllHighlights()

            questListItem:setCompleted(true)
            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)

                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_060_040_you_have_limited")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        tut:startNextStage()
                    end
                }))
            end)
        end
    },
    {-- Дождаться установки майнера
        check = function()
            return systems.MinerSystem.miners.size ~= 0 and systems.MinerSystem.miners:get(0):isPrepared()
        end,
        start = function()
            log("Stage 7 start")

            tut:delay(1, function()
                systems.GraphicsSystem.mainUi:showNextWaveButton(false, nil)
                systems.WaveSystem:freezeTimeToNextWave(false)
                systems.GraphicsSystem.mainUi:showGameSpeedButton(false, nil)

                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_070_010_miners_take_time"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_070_020_installation_progress")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 7 sm continue")
                        questListItem = ql:addQuestListItem()
                        questListItem:setText(i18n:get("tut_04_070_030_wait_for_miner"))
                    end
                }))
            end)
        end,
        done = function()
            log("Stage 7 done")

            questListItem:setCompleted(true)
            tut:delay(1, function()
                ql:removeQuestListItem(questListItem)

                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_070_040_each_next_miner"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_04_070_050_now_just_watch")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 7 sm continue")
                        questListItem = ql:addQuestListItem()
                        questListItem:setText(i18n:get("tut_04_070_060_defeat_remaining_waves"))
                    end
                }))
                tut:startNextStage()
            end)
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
    sm = systems.GraphicsSystem.storylineMessages
    ql = systems.GraphicsSystem.questList

    -- Приводим все в начальное состояние
    systems.GraphicsSystem.mainUi:showMessagesButton(false, nil)
    systems.GraphicsSystem.mainUi:hideGameSpeedButton()
    managers.UiManager:findActor("build_menu_miner_build_buttons"):setVisible(false)

    tut:start()

    -- Слушаем изменения
    systems.GameStateSystem.listeners:add(stateSystemListener)

    --
    addEventHandler("SystemDispose", disposeListener)
    log(TAG .. "Started")
end

disposeListener = function()
    systems.GameStateSystem.listeners:remove(stateSystemListener)
    --
    removeEventHandler("SystemPostSetup", setupListener)
    removeEventHandler("SystemDispose", disposeListener)
    log(TAG .. "Stopped")
end

addEventHandler("SystemPostSetup", setupListener)