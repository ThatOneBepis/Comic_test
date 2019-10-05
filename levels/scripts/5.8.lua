
local TAG = "5.8.lua: "
local i18n = managers.LocaleManager.i18n

log(TAG .. "script was successfully loaded")

local BOSS_WAVE_NUMBER = 5

local sm -- systems.GraphicsSystem.storylineMessages
local st -- systems.GraphicsSystem.subtitles
local setupListener
local disposeListener

local forceSubtitles = false

local walkablePlatformsEnabled = false

local tut
tut = tutorial:new({
    {
        check = function()
            return false
        end,
        start = function()
            if not systems.GameStateSystem.gameIsContinued then
                local messages = {
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_010_so_we_got_to_the"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_020_apparently_ensor_uses"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_030_do_you_remember"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_040_but_our_goal")
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

            -- Субтитры перед боссами
            -- 17 волна - Брут
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber >= 15 and systems.WaveSystem.wave.waveNumber <= 19 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_050_broot_will_appear")
                }, 2, 5)
            end)

            -- 20 волн - брут побежден
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber > 20 and systems.WaveSystem.wave.waveNumber < 35 and systems.WaveSystem:getCompletedWavesCount() >= 20 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_060_okey_warming_up")
                }, 2, 5)
            end)

            -- 37 волна - Стеки
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber >= 35 and systems.WaveSystem.wave.waveNumber <= 39 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_070_stakey_is_coming")
                }, 2, 5)
            end)

            -- 40 волн - Стеки побежден
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber > 40 and systems.WaveSystem.wave.waveNumber < 55 and systems.WaveSystem:getCompletedWavesCount() >= 40 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_080_great_moving_on")
                }, 2, 5)
            end)

            -- 57 волна - Конструктор
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber >= 55 and systems.WaveSystem.wave.waveNumber <= 59 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_090_a_few_waves")
                }, 2, 5)
            end)

            -- 60 волн - Конструктор побежден
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber > 60 and systems.WaveSystem.wave.waveNumber < 65 and systems.WaveSystem:getCompletedWavesCount() >= 60 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_093_well_done_most_bosses")
                }, 2, 5)
            end)

            -- 75 волна - Мобчейн
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber >= 75 and systems.WaveSystem.wave.waveNumber <= 79 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_096_well_quess_who_coming"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_097_but_we_have_something")
                }, 2, 5)
            end)

            -- 80 волн - Мобчейн побежден
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber > 80 and systems.WaveSystem.wave.waveNumber < 85 and systems.WaveSystem:getCompletedWavesCount() >= 80 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_100_good_job_now_starts")
                }, 2, 5)
            end)

            -- 97 волна - Метафор
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber >= 95 and systems.WaveSystem.wave.waveNumber <= 99 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_110_just_a_few_waves")
                }, 2, 5)
            end)

            -- 100 волна - Метафор начало
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber == 100 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_120_uses_small_enemies")
                }, 2, 5)
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_130_seems_that_he_has")
                }, 12, 5)
            end)

            -- Метафор - здоровье упало до 75%
            tut:condition(function()
                if systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber == 100 then
                    -- 100 волна, ищем босса
                    local boss = nil
                    for i = 0, systems.MapSystem.spawnedEnemies.size - 1 do
                        local enemy = systems.MapSystem.spawnedEnemies:get(i)
                        if enemy.type == enums.EnemyType.METAPHOR_BOSS then
                            boss = enemy
                            break
                        end
                    end
                    if boss ~= nil then
                        -- Босса нашли
                        if boss:getHealth() / boss.maxHealth < 0.75 then
                            return true
                        end
                    end
                end

                return false
            end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_140_he_turned_off"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_150_i_think_two_more")
                }, 2, 5)
            end)

            -- Метафор - здоровье упало до 25%
            tut:condition(function()
                if systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber == 100 then
                    -- 100 волна, ищем босса
                    local boss = nil
                    for i = 0, systems.MapSystem.spawnedEnemies.size - 1 do
                        local enemy = systems.MapSystem.spawnedEnemies:get(i)
                        if enemy.type == enums.EnemyType.METAPHOR_BOSS then
                            boss = enemy
                            break
                        end
                    end
                    if boss ~= nil then
                        -- Босса нашли
                        if boss:getHealth() / boss.maxHealth < 0.25 then
                            return true
                        end
                    end
                end

                return false
            end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_160_just_a_little_more")
                }, 2, 5)
            end)

            -- 100 волн - Метафор побежден
            tut:condition(function() return systems.WaveSystem.wave ~= nil and systems.WaveSystem.wave.waveNumber > 100 and systems.WaveSystem.wave.waveNumber < 110 and systems.WaveSystem:getCompletedWavesCount() >= 100 end, function()
                st:schedule({
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_170_nothing_stands_in_my_way"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_180_i_leave_you_my_copy"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_190_one_more_thing"),
                    tut.ADVINAS_TAG .. " " .. i18n:get("lvlsub_5_8_200_you_did_well")
                }, 2, 5)
            end)
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

updateListener = function(deltaTime)
    --log("u " .. systems.WaveSystem:hashCode())
    if not walkablePlatformsEnabled then
        if systems.WaveSystem:getCompletedWavesCount() >= 80 then
            walkablePlatformsEnabled = true

            -- Включаем проход по платформам
            if not CFG:isHeadless() then systems.MapSystem:showTileWarningParticle(9, 15) end
            local tileFactory = managers.TileManager:getFactory(enums.TileType.GAME_VALUE)
            local tile = tileFactory:create(enums.GameValueType.ENEMIES_WALK_ON_PLATFORMS, 1)
            systems.MapSystem:setTile(9, 15, tile)

            -- Убираем телепорты с индексом 0 (красные)
            local gates = systems.MapSystem:getMap().gatesArray;
            local gatesToRemove = {}

            for i=0, gates.size - 1 do
                local gate = gates:get(i)
                if gate:getType() == enums.GateType.TELEPORT and gate.index == 0 then
                    table.insert(gatesToRemove, { gate:getX(), gate:getY(), gate:getSide() })
                end
            end

            for i, v in ipairs(gatesToRemove) do
                systems.MapSystem:setGate(v[1], v[2], v[3], nil)
            end
        end
    end
end

setupListener = function()
    -- Узнаем, надо ли показывать оверлей с сообщениями
    forceSubtitles = managers.BasicLevelManager:getLevel("5.8").maxReachedWave >= BOSS_WAVE_NUMBER or systems.GameStateSystem.gameIsContinued

    if not CFG:isHeadless() and not systemProvider.config.headless then
        sm = systems.GraphicsSystem.storylineMessages
        st = systems.GraphicsSystem.subtitles

        tut:start()
        systems.GameStateSystem.listeners:add(stateSystemListener)
    end

    addEventHandler("SystemDispose", disposeListener)
    addEventHandler("SystemUpdate", updateListener)
    log(TAG .. "Started")
end

disposeListener = function()
    if not CFG:isHeadless() and not systemProvider.config.headless then
        systems.GameStateSystem.listeners:remove(stateSystemListener)
    end

    removeEventHandler("SystemPostSetup", setupListener)
    removeEventHandler("SystemDispose", disposeListener)
    removeEventHandler("SystemUpdate", updateListener)
    log(TAG .. "Stopped")
end

addEventHandler("SystemPostSetup", setupListener)