local TAG = "0.3.lua: "
local i18n = managers.LocaleManager.i18n

local Tower = luajava.bindClass(GNS .. "Tower")
local TowerType = luajava.bindClass(GNS .. "enums.TowerType")
local TileType = luajava.bindClass(GNS .. "enums.TileType")
local SpaceTileBonusType = luajava.bindClass(GNS .. "enums.SpaceTileBonusType")
local WaveSystemStatus = luajava.bindClass(GNS .. "systems.WaveSystem$Status")
local DrawMode = luajava.bindClass(GNS .. "systems.MapRenderingSystem$DrawMode")
local GameOverReason = luajava.bindClass(GNS .. "systems.GameStateSystem$GameOverReason")

log(TAG .. "Level 0.3 script was successfully loaded")

local sm -- systems.GraphicsSystem.storylineMessages
local ql -- systems.GraphicsSystem.questList
local setupListener
local disposeListener

local questListItem

--
local s3_drawModeQuest
local s3_tileWithBonus

local tut
tut = tutorial:new({
    {-- Построить снайпер
        check = function()
            for i = 0, systems.TowerSystem.towers.size - 1 do
                if systems.TowerSystem.towers:get(i).type == TowerType.SNIPER then
                    return true
                end
            end

            return false
        end,
        start = function()
            log("Stage 1 start")
            tut:delay(1, function()
                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_010_010_this_next_level"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_010_020_sniper_tower_well"),
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        log("Stage 1 sm continue")

                        -- Добавляем квест
                        questListItem = ql:addQuestListItem()
                        questListItem:setText(i18n:get("tut_03_010_030_build_sniper_tower"))

                        -- Подсвечиваем
                        managers.UiManager:addHighlight(managers.UiManager:findActor("build_menu_tower_build_button_SNIPER"))
                    end
                }))
            end)
        end,
        done = function()
            log("Stage 1 done")

            managers.UiManager:removeAllHighlights()
            systems.GameStateSystem:addCompletedQuest("Q:0.3:1")

            questListItem:setCompleted(true)
            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)

                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_010_040_sniper_tower_deals"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_010_050_when_changing_target"),
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        tut:startNextStage()
                    end
                }))
            end)
        end
    },
    {-- Победить первую волну
        check = function()
            return systems.WaveSystem:getCompletedWavesCount() >= 1
        end,
        start = function()
            log("Stage 2 start")

            -- Добавляем квест
            questListItem = ql:addQuestListItem()
            questListItem:setText(i18n:get("tut_03_020_010_defeat_first_wave"))

            -- Показываем кнопку вызова волны
            systems.GraphicsSystem.mainUi:showNextWaveButton(false, nil)

            -- После вызова волны скрываем кнопку
            tut:condition(function()
                return systems.WaveSystem.wave ~= nil
            end,
            function()
                systems.GraphicsSystem.mainUi:hideNextWaveButton()
            end)
        end,
        done = function()
            log("Stage 2 done")

            questListItem:setCompleted(true)
            tut:delay(1, function()
                ql:removeQuestListItem(questListItem)

                -- Показываем уровень башни и уникальную характеристику
                sm:queue({
                    tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_020_020_towers_gain_experience"),
                })
                sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        -- Показываем опыт и уровень башни
                        systems.GraphicsSystem.towerMenu:showTowerExperience(true, luajava.createProxy("java.lang.Runnable", {
                            run = function()
                                tut:startNextStage()
                            end
                        }))
                    end
                }))
            end)
        end
    },
    {-- (Появится новый тайл с бонусом опыта) Выбрать тайл и посмотреть информацию о нем
        check = function()
            return systems.MapSystem:getSelectedTile() == s3_tileWithBonus and s3_tileWithBonus ~= nil
        end,
        start = function()
            log("Stage 3 start")

            -- Останавливаем игру
            systems.GraphicsSystem.mainUi:hideNextWaveButton()
            -- systems.GameStateSystem:setGameSpeed(0)
            systems.WaveSystem:freezeTimeToNextWave(true)

            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_030_010_some_platforms_give"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_030_020_check_out_this"),
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 3 sm continue")

                    -- Добавляем тайл
                    s3_tileWithBonus = managers.TileManager:getFactory(TileType.PLATFORM):create()
                    s3_tileWithBonus.bonusType = SpaceTileBonusType.BONUS_EXPERIENCE
                    s3_tileWithBonus.bonusLevel = 5
                    systems.MapSystem:setTile(4, 3, s3_tileWithBonus)
                    systems.MapSystem:showTileWarningParticle(4, 3)

                    -- Подсвечиваем его
					systems.MapSystem:removeHighlights()
                    systems.MapSystem:highlightTile(s3_tileWithBonus)

                    -- Добавляем квест выбора тайла
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_03_030_030_select_platform_with_bonus"))

                    -- Добавляем опциональный квест смены режима отрисовки
                    s3_drawModeQuest = ql:addQuestListItem()
                    s3_drawModeQuest:setText(i18n:get("tut_03_030_040_turn_on_detailed_mode"))
                    tut:condition(function()
                        return systems.MapRenderingSystem:getDrawMode() == DrawMode.DETAILED
                    end,
                    function()
                        s3_drawModeQuest:setCompleted(true)
                    end)
                end
            }))
        end,
        done = function()
            log("Stage 3 done")

            systems.MapSystem:removeHighlights()
            questListItem:setCompleted(true)
            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)
                ql:removeQuestListItem(s3_drawModeQuest)
                tut:startNextStage()
            end)
        end
    },
    {-- Продать первый снайпер
        check = function()
            return systems.TowerSystem.towers.size == 0
        end,
        start = function()
            log("Stage 4 start")

            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_040_010_this_platform_will_increase"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_040_020_theres_not_enough")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 4 sm continue")

                    -- Выбираем башню
                    local tower = systems.TowerSystem.towers:get(0)
                    if tower ~= nil then
                        systems.MapSystem:setSelectedTile(tower:getTile())
                    end

                    -- Открываем меню башни
                    systems.GraphicsSystem.sideMenu:setOffscreen(false)

                    -- Подсвечиваем кнопку продажи
                    managers.UiManager:findActor("tower_menu_sell_button"):setVisible(true)
                    managers.UiManager:addHighlight(managers.UiManager:findActor("tower_menu_sell_button"))

                    -- Добавляем квест
                    questListItem = ql:addQuestListItem()
                    questListItem:setText(i18n:get("tut_03_040_030_sell_existing_tower"))
                end
            }))
        end,
        done = function()
            log("Stage 4 done")

            managers.UiManager:removeAllHighlights()
            questListItem:setCompleted(true)
            tut:delay(1, function()
                ql:removeQuestListItem(questListItem)
                tut:startNextStage()
            end)
        end
    },
    {-- Построить снайпер на новом тайле
        check = function()
            return s3_tileWithBonus.building ~= nil
        end,
        update = function(deltaTime)
            if systems.GameStateSystem:getMoney() < managers.TowerManager:getFactory(enums.TowerType.SNIPER):getBuildPrice(systems.GameValueSystem) then
                -- Не хватает денег на постройку новой башни
                systems.GameStateSystem:triggerGameOver(GameOverReason.QUEST_FAILED)
            end
        end,
        start = function()
            log("Stage 5 start")

            -- Выбираем тайл
            systems.MapSystem:setSelectedTile(s3_tileWithBonus)

            -- Подсвечиваем тайл
			systems.MapSystem:removeHighlights()
            systems.MapSystem:highlightTile(s3_tileWithBonus)

            -- Подсвечиваем кнопку постройки
            managers.UiManager:addHighlight(managers.UiManager:findActor("build_menu_tower_build_button_SNIPER"))

            -- Добавляем квест
            questListItem = ql:addQuestListItem()
            questListItem:setText(i18n:get("tut_03_050_010_build_sniper"))
        end,
        done = function()
            log("Stage 5 done")

            systems.MapSystem:removeHighlights()
            questListItem:setCompleted(true)
            tut:delay(1, function()
                ql:removeQuestListItem(questListItem)
                tut:startNextStage()
            end)
        end
    },
    {-- Победить вторую волну
        check = function()
            return systems.WaveSystem:getCompletedWavesCount() >= 2
        end,
        update = function(deltaTime)
            if s3_tileWithBonus.building == nil then
                -- Продали башню на тайле с бонусом
                systems.GameStateSystem:triggerGameOver(GameOverReason.QUEST_FAILED)
            end
        end,
        start = function()
            log("Stage 6 start")

            -- Добавляем квест
            questListItem = ql:addQuestListItem()
            questListItem:setText(i18n:get("tut_03_060_010_defeat_second_wave"))

            -- Показываем кнопку вызова волны
            systems.GraphicsSystem.mainUi:showNextWaveButton(false, nil)
            systems.WaveSystem:freezeTimeToNextWave(false)
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
    {-- Выбрать навык
        check = function()
            if systems.TowerSystem.towers.size == 0 then return false end

            local tower = systems.TowerSystem.towers:get(0)
            if tower ~= nil then
                for i = 1, Tower.REGULAR_ABILITIES_COUNT do
                    if tower.installedAbilities[i] then
                        return true
                    end
                end
            end

            return false
        end,
        update = function(deltaTime)
            if s3_tileWithBonus.building == nil then
                -- Продали башню на тайле с бонусом
                systems.GameStateSystem:triggerGameOver(GameOverReason.QUEST_FAILED)
            end
        end,
        start = function()
            log("Stage 7 start")
            sm:queue({
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_070_010_tower_gains_abilities"),
                tut.ADVINAS_TAG .. " " .. i18n:get("tut_03_070_020_your_tower_reached")
            })
            sm:runOnContinue(luajava.createProxy("java.lang.Runnable", {
                run = function()
                    log("Stage 7 sm continue")

                    -- Останавливаем волны
                    systems.GraphicsSystem.mainUi:hideNextWaveButton()
                    systems.WaveSystem:freezeTimeToNextWave(true)

                    if systems.TowerSystem.towers.size == 0 then return end -- Нет башен

                    -- Открываем меню башни
                    local tower = systems.TowerSystem.towers:get(0)
                    if tower ~= nil then
                        systems.MapSystem:setSelectedTile(tower:getTile())

                        -- Если уровень башни меньше 4, подгоняем
                        if tower:getLevel() < 4 then
                            tower:addExperienceToMatchLevel(4)
                        end
                    end
                    systems.GraphicsSystem.sideMenu:setOffscreen(false)

                    -- Показываем кнопки навыков башни
                    systems.GraphicsSystem.towerMenu:showTowerAbilities(true, luajava.createProxy("java.lang.Runnable", {
                        run = function()
                            -- Добавляем квест
                            questListItem = ql:addQuestListItem()
                            questListItem:setText(i18n:get("tut_03_070_030_select_ability"))

                            -- Подсвечиваем кнопки навыков
                            managers.UiManager:addHighlight(managers.UiManager:findActor("tower_menu_abilities"))
                        end
                    }))
                end
            }))
        end,
        done = function()
            log("Stage 7 done")

            managers.UiManager:removeAllHighlights()
            systems.GameStateSystem:addCompletedQuest("Q:0.3:2")

            questListItem:setCompleted(true)
            tut:delay(2, function()
                ql:removeQuestListItem(questListItem)
                tut:startNextStage()
            end)
        end
    },
    {-- Победить третью волну
        check = function()
            return false
        end,
        update = function(deltaTime)
            if s3_tileWithBonus.building == nil then
                -- Продали башню на тайле с бонусом
                systems.GameStateSystem:triggerGameOver(GameOverReason.QUEST_FAILED)
            end
        end,
        start = function()
            log("Stage 8 start")

            -- Запускаем волны
            systems.GraphicsSystem.mainUi:showNextWaveButton(false, nil)
            systems.WaveSystem:freezeTimeToNextWave(false)

            -- Добавляем квест
            questListItem = ql:addQuestListItem()
            questListItem:setText(i18n:get("tut_03_080_010_defeat_remaining_waves"))
            systems.GameStateSystem:addCompletedQuest("Q:0.3:3")

            -- Если заспавнились все враги 3-й волны, показываем кнопку скорости игры
            tut:condition(function()
                return (systems.WaveSystem.status ~= WaveSystemStatus.SPAWNING) and systems.WaveSystem.wave.waveNumber >= 3
            end, function()
                log("Showing game speed button")
                systems.GraphicsSystem.mainUi:showGameSpeedButton(true, luajava.createProxy("java.lang.Runnable", {
                    run = function()
                        -- Добавляем квест
                        local quest
                        quest = luajava.createProxy(GNS .. "systems.QuestSystem$Quest", {
                            getTitle = function()
                                return i18n:get("tut_03_080_020_switch_game_speed")
                            end,

                            update = function() end,

                            isCompleted = function()
                                return systems.GameStateSystem:getGameSpeed() > 1
                            end,

                            onCompletion = function()
                                systems.QuestSystem:getListItem(quest):setCompleted(true)
                            end
                        })
                        systems.QuestSystem:addQuest(quest)
                    end
                }))
            end)
        end,
        done = function()
            log("Stage 8 done")
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
    managers.UiManager:findActor("build_menu_modifiers_tab_button"):setVisible(false)
    managers.UiManager:findActor("tower_menu_upgrade"):setVisible(false)
    managers.UiManager:findActor("tower_menu_sell_button"):setVisible(false)
    systems.GraphicsSystem.mainUi:showMessagesButton(false, nil)
    systems.GraphicsSystem.mainUi:hideGameSpeedButton()
    systems.GraphicsSystem.towerMenu:hideTowerExperience()
    systems.GraphicsSystem.towerMenu:hideTowerAbilities()

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