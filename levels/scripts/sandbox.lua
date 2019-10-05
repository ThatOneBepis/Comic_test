local TAG = "sandbox"

local AimStrategy = luajava.bindClass(GNS .. "Tower$AimStrategy")

local setupListener
local disposeListener

local sp
sp = scenarioPlayer:new()

-- Сценарий -----------------------------------

sp:addAction(0, function() -- Выполняется сразу (прошло 0 секунд)
    -- Выдаем много монет
    cmd.coins(100000)
    -- Показываем уведомление с подсказкой
    managers.UiManager.notifications:add("Press P or switch game speed to start the script", nil, nil, nil)
    -- Ставим игру на паузу - следующие действия не будут выполнены, пока игра не будет снята с паузы (время остановлено на 0)
    cmd.setgamespeed(0)
end)

sp:addAction(0.1, function() -- Выполняется через 0.1 секунд (почти сразу, как только игра была снята с паузы)
    -- Прячем интерфейс
    cmd.hideui()

    -- Строим Теслы на всех платформах
    -- cmd.filltower(enums.TowerType.TESLA)

    -- ...или на случайных платформах (кастомный скрипт, который ставит рандомные башни на рандомных 50% платформ)
    local map = systems.MapSystem:getMap()
    for y = 0, map.heightTiles - 1 do
        for x = 0, map.widthTiles - 1 do
            local tile = map:getTile(x, y)
            if tile ~= nil and tile.type == enums.TileType.PLATFORM and tile.building == nil and systems.GameStateSystem:randomFloat() < 0.5 then
                -- Берем рандомный тип башни
                local towerType = enums.TowerType.values[utils.syncRandInt(enums.TowerType.values.length - 1) + 1]
                -- Строим ее
                local tower = systems.TowerSystem:buildTower(towerType, AimStrategy.RANDOM, x, y)
                -- Устанавливаем первый навык выбранным
                systems.TowerSystem:setAbilityInstalled(tower, 0, true)
            end
        end
    end
end)

sp:addAction(5, function() -- Через 5 секунд
    -- С интервалом в 0.15 секунд добавляем врагов на все тайлы в первом ряду карты, повторяем 100 раз
    sp:addInterval(0.15, function()
        for y = 0, 22 do -- От низу к верху, проходим по всем платформам и спавним врага
            cmd.addenemy(enums.EnemyType.REGULAR, 1, 100, 1, 1000, 1000, 0, y, -1)
        end
    end, 100, nil)
end)

-- ... и т.д.

-- Конец сценария -----------------------------------

local updateListener = function(deltaTime)
    sp:update(deltaTime)
end

setupListener = function()
    addEventHandler("SystemUpdate", updateListener)
    addEventHandler("SystemDispose", disposeListener)
end

disposeListener = function()
    removeEventHandler("SystemUpdate", updateListener)
    removeEventHandler("SystemPostSetup", setupListener)
    removeEventHandler("SystemDispose", disposeListener)
end

addEventHandler("SystemPostSetup", setupListener)