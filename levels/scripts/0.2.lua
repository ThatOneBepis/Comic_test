local TAG = "0.2.lua: "
local i18n = managers.LocaleManager.i18n

local TileType = luajava.bindClass(GNS .. "enums.TileType")
local AimStrategy = luajava.bindClass(GNS .. "Tower$AimStrategy")
local WaveSystemStatus = luajava.bindClass(GNS .. "systems.WaveSystem$Status")
local DrawMode = luajava.bindClass(GNS .. "systems.MapRenderingSystem$DrawMode")

log(TAG .. "Level 0.2 script was successfully loaded")

local sm -- systems.GraphicsSystem.storylineMessages
local ql -- systems.GraphicsSystem.questList
local setupListener
local disposeListener

local questListItem

local s4_sideMenuWasOffscreen
local s5_sideMenuWasOffscreen
local s5_lastSelectedTower

local tut
tut = tutorial:new({
    {-- Просмотр волн врагов
        check = function()
            return systems.MapSystem:getSelectedTile() ~= nil and systems.MapSystem:getSelectedTile().type == TileType.SPAWN
        end,
        start = function()
            log("Stage 1 start")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_010_010_you_can_view")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 1 sm continue")

                    -- Добавляем квест
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_02_010_020_tap_on_portal"))

                    -- Подсвечиваем спавн
					systems.MapSystem:removeHighlights()
                    systems.MapSystem:highlightTile(systems.MapSystem:getMap().spawnTiles:get(0))
                end
            }))
        end,
        done = function() -- Выбрали портал
            log("Stage 1 done")

            systems.MapSystem:removeHighlights()
            systems.GameStateSystem:addCompletedQuest("Q:0.2:1")

            questListItem:setCompleted(true)
            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)

                tut:startNextStage()
            end)
        end
    },
    {-- Полоски путей врагов, строим 3 башни
        check = function()
            return false
        end,
        start = function()
            log("Stage 2 start")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_020_010_small_enemy_icons"),
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 2 sm continue")

                    -- Через время говорим построить 3 башни
                    tut:delay(1, function()
                        sm:queue({
                            tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_020_020_looks_like_a_large"),
                            tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_020_030_build_maximum")
                        })
                        sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                            run = function()
                                -- Добавляем квест
                                local lastTowersCount = -1
                                local quest
                                quest = luajava.createProxy(GNS .. "systems.QuestSystem$Quest", {
                                    getTitle = function()
                                        return ""
                                    end,

                                    update = function()
                                        local towersCount = systems.TowerSystem.towers.size
                                        if towersCount ~= lastTowersCount then
                                            systems.QuestSystem:getListItem(quest):setText(i18n:get("tut_02_020_040_build_towers") .. " " .. towersCount .. " / 3")
                                            lastTowersCount = towersCount
                                        end
                                    end,

                                    isCompleted = function()
                                        return systems.TowerSystem.towers.size >= 3
                                    end,

                                    onCompletion = function()
                                        local qli = systems.QuestSystem:getListItem(quest)
                                        qli:setCompleted(true)

                                        tut:delay(1, function()
                                            ql:removeQuestListItem(qli)

                                            tut:startNextStage()
                                        end)
                                    end
                                })
                                systems.QuestSystem:addQuest(quest)
                            end
                        }))
                    end)
                end
            }))
        end,
        done = function() end
    },
    {-- Вызов волн врагов
        check = function()
            if systems.WaveSystem.wave ~= nil and not (systems.WaveSystem.status == WaveSystemStatus.SPAWNING and systems.WaveSystem.wave.waveNumber == 1) then
                -- Волны начались и первая волна заспавнилась, проверяем, сколько врагов из текущей волны осталось
                return systems.MapSystem:getSpawnedEnemiesCountByWave(1) == 0
            end

            return false
        end,
        start = function()
            log("Stage 3 start")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_030_010_that_should_do")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 3 sm continue")

                    -- Добавляем квест
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_02_030_020_protect_from"))

                    -- Показываем кнопку начала волны
                    systems.GraphicsSystem.mainUi:showNextWaveButton(false, nil)

                    -- Если волна началась, скрываем кнопку
                    tut:condition(function() return systems.WaveSystem.wave ~= nil end, function()
                        systems.GraphicsSystem.mainUi:hideNextWaveButton()
                    end)
                end
            }))
        end,
        done = function() -- Выбрали портал
            log("Stage 3 done")

            questListItem:setCompleted(true)
            tut:delay(1, function()
                ql:removeQuestListItem(questListItem)

                tut:startNextStage()
            end)
        end
    },
    {-- Улучшить башню
        check = function()
            local anythindUpgraded = false
            for i = 1, systems.TowerSystem.towers.size do
                local tower = systems.TowerSystem.towers:get(i - 1)
                if tower:getUpgradeLevel() > 0 then
                    anythindUpgraded = true
                    break
                end
            end

            return anythindUpgraded
        end,
        update = function()
            local sideMenuOffscreen = systems.GraphicsSystem.sideMenu:isOffscreen()
            if s4_sideMenuWasOffscreen ~= sideMenuOffscreen then
                -- Меняем подсветку элементов UI
                managers.UiManager:removeAllHighlights()

                if sideMenuOffscreen then
                    -- Меню скрыто - подсвечиваем кнопку открытия меню
                    managers.UiManager:addHighlight(managers.UiManager:findActor("side_menu_toggle_button"))
                else
                    -- Меню открыто, подсвечиваем кнопку улучшения
                    managers.UiManager:addHighlight(managers.UiManager:findActor("tower_menu_upgrade_button"))
                end
                s4_sideMenuWasOffscreen = sideMenuOffscreen
            end
        end,
        start = function()
            log("Stage 4 start")

            -- Скрываем кнопку начала волны
            systems.GraphicsSystem.mainUi:hideNextWaveButton()
            -- systems.GameStateSystem:setGameSpeed(0)
            systems.WaveSystem:freezeTimeToNextWave(true)

            -- Добавляем монеты, если не хватает
            if systems.GameStateSystem:getMoney() < 25 then
                systems.GameStateSystem:setMoney(25)
            end

            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_040_010_well_done"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_040_020_you_coped_with"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_040_030_currently_theres")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 4 sm continue")

                    -- Добавляем квест
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_02_040_040_upgrade_any_tower"))

                    -- Показываем улучшения
                    managers.UiManager:findActor("tower_menu_upgrade"):setVisible(true)

                    -- Подсвечиваем кнопку улучшения
                    s4_sideMenuWasOffscreen = not systems.GraphicsSystem.sideMenu:isOffscreen()
                end
            }))
        end,
        done = function() -- Улучшили башню
            log("Stage 4 done")

            questListItem:setCompleted(true)
            managers.UiManager:removeAllHighlights()
            systems.GameStateSystem:addCompletedQuest("Q:0.2:2")

            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)

                tut:startNextStage()
            end)
        end
    },
    {-- Выставить режим прицеливания улучшенной башне на самых сильных
        check = function()
--            local upgradesCount = 0
--            for i = 1, systems.TowerSystem.towers.size do
--                local tower = systems.TowerSystem.towers:get(i - 1)
--                upgradesCount = upgradesCount + tower:getUpgradeLevel()
--            end
--
--            return upgradesCount >= 3
            for i = 1, systems.TowerSystem.towers.size do
                local tower = systems.TowerSystem.towers:get(i - 1)
                if tower:getUpgradeLevel() > 0 and tower.aimStrategy == AimStrategy.STRONGEST then
                    return true
                end
            end

            return false
        end,
        update = function()
            local sideMenuOffscreen = systems.GraphicsSystem.sideMenu:isOffscreen()
            local selectedTile = systems.MapSystem:getSelectedTile()
            if s5_sideMenuWasOffscreen ~= sideMenuOffscreen or s5_lastSelectedTower ~= selectedTile then
                -- Меняем подсветку элементов UI
                managers.UiManager:removeAllHighlights()

                if selectedTile ~= nil and selectedTile.building ~= nil and selectedTile.building.buildingType == enums.BuildingType.TOWER and selectedTile.building:getUpgradeLevel() > 0 then
                    -- Выбрана улучшенная башня
                    if sideMenuOffscreen then
                        -- Меню скрыто - подсвечиваем кнопку открытия меню
                        managers.UiManager:addHighlight(managers.UiManager:findActor("side_menu_toggle_button"))
                    else
                        -- Меню открыто, подсвечиваем кнопку улучшения
                        managers.UiManager:addHighlight(managers.UiManager:findActor("tower_menu_aim_strategy"))
                    end
                end
                s5_sideMenuWasOffscreen = sideMenuOffscreen
                s5_lastSelectedTower = selectedTile
            end
        end,
        start = function()
            log("Stage 5 start")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_050_010_now_this_tower"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_050_020_there_are_two"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_050_030_lets_make_it")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 5 sm continue")

                    -- Показываем переключатель прицеливания и подсвечиваем у улучшенной башни
                    managers.UiManager:findActor("build_menu_default_aim_strategy"):setVisible(true)
                    managers.UiManager:findActor("tower_menu_aim_strategy"):setVisible(true)

                    s5_sideMenuWasOffscreen = not systems.GraphicsSystem.sideMenu:isOffscreen()
                    s5_lastSelectedTower = nil

                    -- Подсвечиваем улучшенную башню
                    for i = 1, systems.TowerSystem.towers.size do
                        local tower = systems.TowerSystem.towers:get(i - 1)
                        if tower:getUpgradeLevel() > 0 then
							systems.MapSystem:removeHighlights()
                            systems.MapSystem:highlightTile(tower:getTile())
                            log("Highlighting")
                            log(tower:getTile())
                            break
                        end
                    end

                    -- Добавляем квест
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_02_050_040_set_strongest"))
                end
            }))
        end,
        done = function()
            log("Stage 5 done")

            systems.MapSystem:removeHighlights()
            questListItem:setCompleted(true)
            managers.UiManager:removeAllHighlights()
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
            log("Stage 6 start")

            -- Убираем паузу
            -- systems.GameStateSystem:setGameSpeed(1)
            systems.WaveSystem:freezeTimeToNextWave(false)

            -- Показываем кнопку вызова волны
            systems.GraphicsSystem.mainUi:showNextWaveButton(false, nil)

            -- Добавляем квест
            questListItem = ql:addQuestListItem()
            questListItem:setText(i18n:get("tut_02_060_010_protect_from"))
        end,
        done = function()
            log("Stage 6 done")

            questListItem:setCompleted(true)
            tut:delay(1, function()
                ql:removeQuestListItem(questListItem)

                tut:startNextStage()
            end)
        end
    },
    {-- Включить детальный режим отображения
        check = function()
            return systems.MapRenderingSystem:getDrawMode() == DrawMode.DETAILED
        end,
        start = function()
            log("Stage 7 start")

            -- Скрываем кнопку начала волны и останавливаем игру
            systems.GraphicsSystem.mainUi:hideNextWaveButton()
            -- systems.GameStateSystem:setGameSpeed(0)
            systems.WaveSystem:freezeTimeToNextWave(true)

            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_070_010_you_can_see")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 7 sm continue")

                    -- Показываем кнопку режима отрисовки
                    systems.GraphicsSystem.mainUi:showDrawModeButton(true, luajava.createProxy("java.lang.Runnable", {
                        run = function()
                            -- Добавляем квест
                            questListItem = ql:addQuestListItem()
                            questListItem:setText(i18n:get("tut_02_070_020_turn_on_detailed"))
                        end
                    }))
                end
            }))
        end,
        done = function()
            log("Stage 6 done")

            questListItem:setCompleted(true)
            systems.GameStateSystem:addCompletedQuest("Q:0.2:3")

            tut:delay(1, function()
                ql:removeQuestListItem(questListItem)

                tut:startNextStage()
            end)
        end
    },
    {-- Победить остальные волны
        check = function()
            return false
        end,
        start = function()
            log("Stage 8 start")

            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_080_010_you_can_turn_off"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_02_080_020_now_upgrade")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 7 sm continue")

                    -- Уберем паузу
                    systems.GraphicsSystem.mainUi:showNextWaveButton(false, nil)
                    -- systems.GameStateSystem:setGameSpeed(1)
                    systems.WaveSystem:freezeTimeToNextWave(false)

                    -- Добавляем квесты (победить 3 волну, улучшить остальные базы)
                    local questA
                    questA = luajava.createProxy(GNS .. "systems.QuestSystem$Quest", {
                        getTitle = function()
                            return i18n:get("tut_02_080_030_defeat_third")
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

                    local getUpgradedTowersCount = function()
                        local cnt = 0
                        for i = 1, systems.TowerSystem.towers.size do
                            local tower = systems.TowerSystem.towers:get(i - 1)
                            if tower:getUpgradeLevel() > 0 then
                                cnt = cnt + 1
                            end
                        end

                        return cnt
                    end

                    local questBlastTowersCount
                    local questB
                    questB = luajava.createProxy(GNS .. "systems.QuestSystem$Quest", {
                        getTitle = function()
                            return ""
                        end,

                        update = function()
                            local towersCount = getUpgradedTowersCount()
                            if towersCount ~= questBlastTowersCount then
                                systems.QuestSystem:getListItem(questB):setText(i18n:get("tut_02_080_040_upgrade_towers") .. " " .. towersCount .. " / 3")
                                questBlastTowersCount = towersCount
                            end
                        end,

                        isCompleted = function()
                            return getUpgradedTowersCount() >= 3
                        end,

                        onCompletion = function()
                            systems.QuestSystem:getListItem(questB):setCompleted(true)
                        end
                    })
                    systems.QuestSystem:addQuest(questB)
                end
            }))
        end,
        done = function() end
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
    managers.UiManager:findActor("build_menu_modifiers_tab_button"):setVisible(false)
    managers.UiManager:findActor("build_menu_default_aim_strategy"):setVisible(false)
    managers.UiManager:findActor("tower_menu_abilities"):setVisible(false)
    managers.UiManager:findActor("tower_menu_upgrade"):setVisible(false)
    managers.UiManager:findActor("tower_menu_aim_strategy"):setVisible(false)
    managers.UiManager:findActor("tower_menu_sell_button"):setVisible(false)
    systems.GraphicsSystem.mainUi:showMessagesButton(false, nil)
    systems.GraphicsSystem.towerMenu:hideTowerExperience()

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