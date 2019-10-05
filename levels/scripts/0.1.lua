--[[
-- Полезные методы:
-- systems.WaveSystem:freezeTimeToNextWave(true / false) - остановить счетчик времени до следующей волны
-- systems.GraphicsSystem.mainUi:hideNextWaveButton() - спрятать кнопку вызова волны
-- systems.MapSystem:getSelectedGate() ~= nil and systems.MapSystem:getSelectedGate():getType() == enums.GateType.TELEPORT - выбрать гейт определенного типа
-- systems.MapSystem:getSelectedTile() ~= nil and systems.MapSystem:getSelectedTile().type == enums.TileType.SPAWN - выбрать тайл определенного типа
--
-- Условия:
-- systems.WaveSystem:getCompletedWavesCount() >= 1 - победить 1-ю волну
 ]]

local TAG = "0.1.lua: "
local i18n = managers.LocaleManager.i18n

local TileType = luajava.bindClass(GNS .. "enums.TileType")
local WaveSystemStatus = luajava.bindClass(GNS .. "systems.WaveSystem$Status")
local GameOverReason = luajava.bindClass(GNS .. "systems.GameStateSystem$GameOverReason")
local Interpolation = luajava.bindClass("com.badlogic.gdx.math.Interpolation")

log(TAG .. "Level 0.1 script was successfully loaded")

local sm -- systems.GraphicsSystem.storylineMessages
local ql -- systems.GraphicsSystem.questList
local setupListener
local disposeListener

local questListItem

-- Stage 3
local s3_sideMenuWasOffscreen

local tut
tut = tutorial:new({
    {-- Информация о спавне
        check = function()
            -- Возвращает true / false, сообщая о том, выполнено ли условие этапа
            return questListItem ~= nil and systems.MapSystem:getSelectedTile() ~= nil and systems.MapSystem:getSelectedTile().type == TileType.SPAWN
        end,
        start = function()
            -- Вызывается вначале этапа (здесь можно показать сообщение или подсветить что-то)
            log("Stage 1 start")
            sm:queue({
                tut.ENSOR_TAG .. " " .. i18n:get("tut_01_010_010_welcome_to_the_infinitode"),
                tut.ENSOR_TAG .. " " .. i18n:get("tut_01_010_020_this_is_an_experimental"),
                tut.ENSOR_TAG .. " " .. i18n:get("tut_01_010_030_anyone_can_take_part"),
                tut.ENSOR_TAG .. " " .. i18n:get("tut_01_010_040_please_follow_instructions")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    tut:delay(1, function()
                        sm:queue({
                            tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_010_050_hi_let_me_show_basics"),
                            tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_010_060_lets_start_with_the_game")
                        })
                        sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                            run = function()
                                log("Stage 1 sm continue")

                                -- Добавляем квест
                                questListItem = ql:addQuestListItem()
                                questListItem:setText(i18n:get("tut_01_010_070_tap_on_portal"))

                                -- Подсвечиваем спавн
                                local spawnTile = systems.MapSystem:getMap().spawnTiles:get(0)
                                systems.MapSystem:removeHighlights()
                                systems.MapSystem:highlightTile(spawnTile)

                                -- Показываем кнопку включения StorylineMessages
                                systems.GraphicsSystem.mainUi:showMessagesButton(true, luajava.createProxy("java.lang.Runnable", {
                                    run = function()
                                        -- Показываем подсказку про pan & zoom
                                        systems.GraphicsSystem.panZoomTooltip:show();

                                        systems.InputSystem.cameraController:animate(spawnTile.centerX, spawnTile.centerY, 2, 1, Interpolation.pow2)
                                    end
                                }))
                            end
                        }))
                    end)
                end
            }))
        end,
        done = function() -- Выбрали портал
            -- Вызывается при выполненни условия (здесь нужно убрать за собой)
            log("Stage 1 done")

            -- Убираем подсветку и квест
            systems.MapSystem:removeHighlights()
            questListItem:setCompleted(true)

            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)
                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_010_080_this_is_a_portal")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 1 done sm continued, starting next stage")
                        tut:startNextStage()
                    end
                }))
            end)
        end
    },
    {-- Информация о базе и цели игры
        check = function()
            return systems.MapSystem:getSelectedTile() ~= nil and systems.MapSystem:getSelectedTile().type == TileType.TARGET
        end,
        start = function()
            log("Stage 2 start")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_020_010_ive_highlighted_the_other")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 2 sm continue")

                    -- Подсвечиваем базу
                    local baseTile = systems.MapSystem:getMap().targetTile
					systems.MapSystem:removeHighlights()
                    systems.MapSystem:highlightTile(baseTile)

                    -- Добавляем квест
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_01_020_020_tap_on_base"))

                    systems.InputSystem.cameraController:animate(baseTile.centerX, baseTile.centerY, 2, 1, Interpolation.pow2)
                end
            }))
        end,
        done = function() -- Выбрали базу
            log("Stage 2 done")

            systems.MapSystem:removeHighlights()
            questListItem:setCompleted(true)

            -- Отмечаем квест выполненным для уровня
            -- managers.BasicLevelManager:setQuestCompleted("QTUT1S1")
            systems.GameStateSystem:addCompletedQuest("Q:0.1:1")

            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)

                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_020_030_you_are_doing_well"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_020_040_so_this_is_your_base")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 2 done sm continue")

                        -- Показываем здоровье
                        systems.GraphicsSystem.mainUi:showHealth(true, luajava.createProxy("java.lang.Runnable", {
                            run = function()
                                sm:queue({
                                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_020_050_your_task_is_simple")
                                })
                                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                                    run = function()
                                        log("Stage 1 done sm continued, starting next stage")
                                        tut:startNextStage()
                                    end
                                }))
                            end
                        }))
                    end
                }))
            end)
        end
    },
    {-- Платформа, открыть меню постройки башен
        check = function()
            local tile = systems.MapSystem:getSelectedTile()
            if tile == nil then return false end

            return tile:getX() == 2 and tile:getY() == 1
        end,
        start = function()
            log("Stage 3 start")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_030_010_youll_use_towers"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_030_020_towers_can_be_built")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    -- Подсвечиваем платформу
					systems.MapSystem:removeHighlights()
                    systems.MapSystem:highlightTile(systems.MapSystem:getMap():getTile(2, 1))

                    -- Показываем кнопки постройки
                    managers.UiManager:findActor("build_menu_tower_build_buttons"):setVisible(true)

                    -- Добавляем квест
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_01_030_030_tap_on_platform"))
                end
            }))
        end,
        done = function() -- Выбрали платформу
            log("Stage 3 done")

            systems.MapSystem:removeHighlights()
            questListItem:setCompleted(true)

            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)

                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_030_040_you_can_choose_the_type"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_030_050_each_type_of_tower")
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 3 done sm continue")

                        -- Показываем монеты
                        systems.GraphicsSystem.mainUi:showCoins(true, luajava.createProxy("java.lang.Runnable", {
                            run = function()
                                tut:startNextStage()
                            end
                        }))
                    end
                }))
            end)
        end
    },
    {-- Построить башню
        check = function()
            return systems.TowerSystem.towers.size ~= 0
        end,
        update = function()
            local sideMenuOffscreen = systems.GraphicsSystem.sideMenu:isOffscreen()
            if s3_sideMenuWasOffscreen ~= sideMenuOffscreen then
                -- Меняем подсветку элементов UI
                managers.UiManager:removeAllHighlights()

                if sideMenuOffscreen then
                    -- Меню скрыто - подсвечиваем кнопку открытия меню
                    managers.UiManager:addHighlight(managers.UiManager:findActor("side_menu_toggle_button"))
                else
                    -- Меню открыто, подсвечиваем кнопку постройки
                    managers.UiManager:addHighlight(managers.UiManager:findActor("build_menu_tower_build_button_BASIC"))
                end
                s3_sideMenuWasOffscreen = sideMenuOffscreen
            end
        end,
        start = function()
            log("Stage 4 start")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_040_010_you_have_enough_coins")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    -- Подсвечиваем платформу
					systems.MapSystem:removeHighlights()
                    systems.MapSystem:highlightTile(systems.MapSystem:getMap():getTile(2, 1))

                    -- Делаем так, чтобы в следующем update() обновилась подсветка UI
                    s3_sideMenuWasOffscreen = not systems.GraphicsSystem.sideMenu:isOffscreen()

                    -- Добавляем квест
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_01_040_020_build_basic_tower"))
                end
            }))
        end,
        done = function() -- Построили башню
            log("Stage 4 done")

            systems.MapSystem:removeHighlights()
            questListItem:setCompleted(true)
            systems.GameStateSystem:addCompletedQuest("Q:0.1:2")

            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)
                managers.UiManager:removeAllHighlights()

                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_040_030_great"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_040_040_basic_towers_are_the_most"),
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        tut:startNextStage()
                    end
                }))
            end)
        end
    },
    {-- Вызвать волну и дождаться, когда заспавнятся все враги первой волны
        check = function()
            return systems.WaveSystem.wave ~= nil
                    and not (systems.WaveSystem.status == WaveSystemStatus.SPAWNING and systems.WaveSystem.wave.waveNumber == 1)
        end,
        update = function(deltaTime)
            if systems.TowerSystem.towers.size == 0 then
                -- Башни не построены
                systems.GameStateSystem:triggerGameOver(GameOverReason.QUEST_FAILED)
            end
        end,
        start = function()
            log("Stage 5 start")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_050_010_you_are_prepared_to_call")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    -- Показываем кнопку вызова волны
                    systems.GraphicsSystem.mainUi:showNextWaveButton(true, nil)
                end
            }))
        end,
        done = function() -- Вызвали волну
            log("Stage 5 done")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_050_020_youll_gain_score_points")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    -- Показываем очки
                    systems.GraphicsSystem.mainUi:showScore(true, luajava.createProxy("java.lang.Runnable", {
                        run = function()
                            sm:queue({
                                tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_050_030_next_enemy_wave_will_start"),
                                tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_050_040_you_can_also_tap")
                            })
                            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                                run = function()
                                    tut:startNextStage()
                                end
                            }))
                        end
                    }))
                end
            }))
        end
    },
    {-- Дождаться, когда начнется вторая волна
        check = function()
            return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber >= 2
        end,
        update = function(deltaTime)
            if systems.TowerSystem.towers.size == 0 then
                -- Башни не построены
                systems.GameStateSystem:triggerGameOver(GameOverReason.QUEST_FAILED)
            end
        end,
        start = function()
            log("Stage 6 start")
        end,
        done = function() -- Вызвали волну
            log("Stage 6 done")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_01_060_010_build_new_towers_and_try")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    -- Добавляем квесты
--                    local quest = ql:addQuestListItem()
--                    quest:setText("Fight off 3 waves of enemies")
--
--                    quest = ql:addQuestListItem()
--                    quest:setText("Build one more tower")

                    systems.GameStateSystem:addCompletedQuest("Q:0.1:3")

                    local questA
                    questA = luajava.createProxy(GNS .. "systems.QuestSystem$Quest", {
                        getTitle = function()
                            return i18n:get("tut_01_060_020_fight_off_3_waves")
                        end,

                        update = function() end,

                        isCompleted = function()
                            return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber > 3
                        end,

                        onCompletion = function()
                            systems.QuestSystem:getListItem(questA):setCompleted(true)
                        end
                    })
                    systems.QuestSystem:addQuest(questA)

                    local questB
                    questB = luajava.createProxy(GNS .. "systems.QuestSystem$Quest", {
                        getTitle = function()
                            return i18n:get("tut_01_060_030_build_one_more_tower")
                        end,

                        update = function() end,

                        isCompleted = function()
                            return systems.TowerSystem.towers.size >= 2
                        end,

                        onCompletion = function()
                            systems.QuestSystem:getListItem(questB):setCompleted(true)
                        end
                    })
                    systems.QuestSystem:addQuest(questB)

                    -- Показываем номер волны
                    systems.GraphicsSystem.mainUi:showWaveNumber(true, nil)
                end
            }))
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
    systems.GraphicsSystem.mainUi:hideNextWaveButton()
    systems.GraphicsSystem.mainUi:hideDrawModeButton()
    systems.GraphicsSystem.mainUi:hideCoins()
    systems.GraphicsSystem.mainUi:hideHealth()
    systems.GraphicsSystem.mainUi:hideScore()
    systems.GraphicsSystem.mainUi:hideWaveNumber()
    systems.GraphicsSystem.towerMenu:hideTowerExperience()
    systems.MapSystem:setPathTracesDrawing(false)
    managers.UiManager:findActor("spawn_menu_details"):setVisible(false)
    managers.UiManager:findActor("build_menu_modifiers_tab_button"):setVisible(false)
    managers.UiManager:findActor("build_menu_default_aim_strategy"):setVisible(false)
    managers.UiManager:findActor("build_menu_tower_build_buttons"):setVisible(false)
    managers.UiManager:findActor("tower_menu_abilities"):setVisible(false)
    managers.UiManager:findActor("tower_menu_upgrade"):setVisible(false)
    managers.UiManager:findActor("tower_menu_aim_strategy"):setVisible(false)
    managers.UiManager:findActor("tower_menu_sell_button"):setVisible(false)

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