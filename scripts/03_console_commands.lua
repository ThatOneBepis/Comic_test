--[[
-- Set commands table
-- Mainly used by DeveloperConsole (for example "cmd.help()")
--
-- If commands are not enough for you, use the power of Lua to get more.
 ]]

local GameValueType = luajava.bindClass(GNS .. "enums.GameValueType")
local StatisticsType = luajava.bindClass(GNS .. "enums.StatisticsType")
local MainUiLayer = luajava.bindClass(GNS .. "managers.UiManager$MainUiLayer")

local testQuestItem

_G.cmd = {
    help = function(a1)
        if (a1 == "?") then
            return {
                descr = "Show DeveloperConsole help"
            }
        end

        log("Version " .. CFG.VERSION .. " (build " .. CFG.BUILD .. ") running " .. _VERSION)
        log("Use DeveloperConsole to run any Lua script. There are some predefined functions for easier usage of console:")

        for k, v in pairs(_G.cmd) do
            local info = v("?")
            local cmdArgs = info.args
            local cmdDescr = info.descr
            if cmdArgs == nil then cmdArgs = "" end
            if cmdDescr == nil then cmdDescr = "description not provided" end
            log("    cmd." .. k .. "(" .. cmdArgs .. ") - " .. cmdDescr)
        end
    end,

    setzoom = function(newZoom)
        if (newZoom == "?") then
            return {
                args = "[#888888]double[] zoom",
                descr = "Set camera zooming level. Only works during the game."
            }
        end

        if systems ~= nul then
            newZoom = tonumber(newZoom)
            local cameraController = systems.InputSystem:getCameraController()
            cameraController:setZoom(newZoom);
            log("zoom level set to " .. cameraController.zoom);
        else
            log("Game is not running")
        end
    end,

    setgamespeed = function(newSpeed)
        if (newSpeed == "?") then
            return {
                args = "[#888888]double[] speed",
                descr = "Set game speed. Only works during the game."
            }
        end

        if systems ~= nil and systems.GameStateSystem ~= nil then
            newSpeed = tonumber(newSpeed)

            if newSpeed < 0.01 then newSpeed = 0.01 end
            if newSpeed > 8 then newSpeed = 8 end

            systems.GameStateSystem:setGameSpeed(newSpeed);
            log("game speed set to " .. systems.GameStateSystem:getGameSpeed());
        else
            log("Game is not running")
        end
    end,

    gamevalues = function(a1)
        if (a1 == "?") then
            return {
                descr = "Lists all game values"
            }
        end

        if systems ~= nil and systems.GameStateSystem ~= nil then
            -- In game
            if systems.GameStateSystem.basicLevel ~= nil and systems.GameStateSystem.basicLevel.useStockGameValues then
                log("[#FF9800]This level has disabled Researches, Trophies & Quest prize global effects. Only stock values of level & local effects of level quests are considered.[]")
            end
        end

        local currentEffects = managers.GameValueManager:getCurrentEffects()
        local currentEffectsByType = {} -- index shifted by 1

        for i = 1, GameValueType.values.length do
            currentEffectsByType[i] = {}
        end

        for i = 0, currentEffects.size - 1 do
            local effect = currentEffects:get(i)
            local ebt = currentEffectsByType[effect.type:ordinal() + 1]
            table.insert(ebt, currentEffects:get(i))
        end

        local snap = nil
        if systems ~= nil then
            snap = systems.GameValueSystem:getGlobalSnapshot()
        else
            snap = managers.GameValueManager:getSnapshot()
        end

        for i = 1, GameValueType.values.length do
            local gvt = GameValueType.values[i]
            local ebt = currentEffectsByType[gvt:ordinal() + 1]
            local value = snap:getValue(gvt)

            local parts = {}
            table.insert(parts, gvt:name())
            table.insert(parts, "[#455A64] = [][#FFFFFF]")
            table.insert(parts, tostring(value))
            table.insert(parts, "[]  [#455A64]( []")
            for j, v in ipairs(ebt) do
                local sourceName = v.source:name()
                if sourceName == "STOCK" then
                    table.insert(parts, "[#FFFFFF]")
                elseif sourceName == "LEVEL_STOCK" then
                    table.insert(parts, "[#455A64]LSTCK[] [#90A4AE]")
                elseif sourceName == "RESEARCH" then
                    table.insert(parts, "[#0097A7]RES[] [#4DD0E1]")
                elseif sourceName == "TROPHY" then
                    table.insert(parts, "[#7B1FA2]TRP[] [#BA68C8]")
                elseif sourceName == "LEVEL_QUEST" then
                    table.insert(parts, "[#1976D2]LQST[] [#64B5F6]")
                elseif sourceName == "LEVEL_WAVE_QUEST" then
                    table.insert(parts, "[#388E3C]LWQST[] [#81C784]")
                else
                    table.insert(parts, "[#616161]" .. sourceName .. "[] [#E0E0E0]")
                end

                table.insert(parts, v.delta .. "[]")
                if j ~= #ebt then
                    table.insert(parts, "[#FFFFFF],[] ")
                end
            end

            -- TODO показыать конечное значение, если во время игры

            table.insert(parts, "[#455A64] )[]")
            log(table.concat(parts, ""))
        end
    end,

    researchgvs = function(multiplier)
        if (multiplier == "?") then
            return {
                args = "[#888888]double[] multiplier",
                descr = "Lists all game values affected by researches as Json array for Base"
            }
        end

        if multiplier == nil then multiplier = 1 end

        local currentEffects = managers.GameValueManager:getCurrentEffects()
        local currentEffectsByType = {} -- index shifted by 1

        for i = 1, GameValueType.values.length do
            currentEffectsByType[i] = {}
        end

        for i = 0, currentEffects.size - 1 do
            local effect = currentEffects:get(i)
            local ebt = currentEffectsByType[effect.type:ordinal() + 1]
            table.insert(ebt, currentEffects:get(i))
        end

        local parts = {}
        table.insert(parts, "[\n")
        for i = 1, GameValueType.values.length do
            local gvt = GameValueType.values[i]
            local ebt = currentEffectsByType[gvt:ordinal() + 1]

            local delta = 0
            for j, v in ipairs(ebt) do
                if v.source:name() == "RESEARCH" then
                    delta = delta + v.delta
                end
            end
            if delta ~= 0 then
                delta = delta * multiplier
                table.insert(parts, " { \"t\":\"")
                table.insert(parts, gvt:name())
                table.insert(parts, "\", \"v\":")
                table.insert(parts, delta)
                table.insert(parts, ", \"o\":false, \"b\":false },\n")
            end
        end
        table.insert(parts, "]")
        log(table.concat(parts, ""))
    end,

    dumpui = function(actorName)
        if (actorName == "?") then
            return {
                args = "[#888888]string[] actorName",
                descr = "Dumps UI hierarchy to console. Use nil as actorName to dump everything (will also print elements of this console)"
            }
        end

        local actor
        if actorName ~= nil then
            actor = managers.UiManager:findActor(actorName)
            if actor == nil then
                log("No actors found with name '" .. actorName .. "'")
                return
            end
        end
        managers.UiManager:dumpActorsHierarchy(actor, 0)
    end,

    validateui = function(a1)
        if (a1 == "?") then
            return {
                descr = "Validates UI hierarchy"
            }
        end

        managers.UiManager:findDuplicateActorNames()
        log("No actor name duplicates")
    end,

    uilayers = function(a1)
        if (a1 == "?") then
            return {
                descr = "Prints current UI layers in order of drawing"
            }
        end

        for i = 1, MainUiLayer.values.length do
            local mainUiLayer = MainUiLayer.values[i]
            log("[#FFEB3B]" .. mainUiLayer:name() .. "[]")
            local layers = managers.UiManager.layers[i]
            for j = 1, layers.size do
                local layer = layers:get(j - 1)
                log(layer.name .. " " .. layer.zIndex)
            end
        end
    end,

    testquest = function(a1)
        if (a1 == "?") then
            return {
                descr = "Add or remove a test quest"
            }
        end

        if testQuestItem == nil then
            testQuestItem = systems.GraphicsSystem.questList:addQuestListItem()
            testQuestItem:setText("Test quest")
        else
            systems.GraphicsSystem.questList:removeQuestListItem(testQuestItem)
            testQuestItem = nil
        end
    end,

    statistics = function(a1)
        if (a1 == "?") then
            return {
                descr = "Show global statistics"
            }
        end

        for i = 1, StatisticsType.values.length do
            local statType = StatisticsType.values[i]
            log(statType:name() .. " " .. managers.StatisticsManager:getAllTime(statType) .. " " .. managers.StatisticsManager:getMaxOneGame(statType))
        end
    end,

    makeitem = function(a1)
        if (a1 == "?") then
            return {
                descr = "Show overlay which allows to create any items (Developer mode research required)"
            }
        end

        managers.UiManager.itemCreationOverlay:show()
    end,

    coins = function(count)
        if (count == "?") then
            return {
                args = "[#888888]int[] amount",
                descr = "Give coins (during game)"
            }
        end

        systems.GameStateSystem:addMoney(count, false)
    end,

    health = function(count)
        if (count == "?") then
            return {
                args = "[#888888]int[] amount",
                descr = "Give health (during game)"
            }
        end

        systems.GameStateSystem:addHealth(count)
    end,

    maxexp = function(a1)
        if (a1 == "?") then
            return {
                descr = "Set max exp for the selected tower (during game)"
            }
        end

        local tile = systems.MapSystem:getSelectedTile()
        if tile ~= nil and tile.type == enums.TileType.PLATFORM and tile.building ~= nil and tile.building.buildingType == enums.BuildingType.TOWER then
            tile.building:addExperienceRaw(50000)
        end
    end,

    buildtower = function(towerType, x, y)
        if (towerType == "?") then
            return {
                args = "[#888888]TowerType[] towerType, [#888888]int[] tileX, [#888888]y[] tileY",
                descr = "Build tower on selected Platform tile (during game)"
            }
        end

        local map = systems.MapSystem:getMap()
        local tile = map:getTile(x, y)
        if tile ~= nil and tile.type == enums.TileType.PLATFORM and tile.building == nil then
            systems.MapSystem:setSelectedTile(tile)
            systems.TowerSystem:buildTowerAction(towerType)
        end
        systems.MapSystem:setSelectedTile(nil)
    end,

    filltower = function(towerType)
        if (towerType == "?") then
            return {
                args = "[#888888]TowerType[] towerType",
                descr = "Build tower on all empty Platform tiles (during game)"
            }
        end

        local map = systems.MapSystem:getMap()
        for y = 0, systems.MapSystem:getMap().heightTiles - 1 do
            for x = 0, systems.MapSystem:getMap().widthTiles - 1 do
                local tile = map:getTile(x, y)
                if tile ~= nil and tile.type == enums.TileType.PLATFORM and tile.building == nil then
                    systems.MapSystem:setSelectedTile(tile)
                    systems.TowerSystem:buildTowerAction(towerType)
                end
            end
        end
        systems.MapSystem:setSelectedTile(nil)

        log("Done")
    end,

    hideui = function(a1)
        if (a1 == "?") then
            return {
                descr = "Hide all UI layers. Use back/console/camera controller button to recover"
            }
        end

        for i = 1, managers.UiManager.layers.length do
            local uiLayerArray = managers.UiManager.layers[i]
            for j = 1, uiLayerArray.size do
                uiLayerArray:get(j - 1):getTable():setVisible(false)
            end
        end
    end,

    mainmenu = function(a1)
        if (a1 == "?") then
            return {
                descr = "Go back to main menu"
            }
        end

        managers.ScreenManager:goToMainMenu()
    end,

    addenemy = function(enemyType, speed, health, killScore, killBounty, killExp, tileX, tileY, sideShift)
        if (enemyType == "?") then
            return {
                args = "[#888888]EnemyType[] enemyType, [#888888]float[] speed, [#888888]float[] health, [#888888]int[] killScore, [#888888]int[] killBounty, [#888888]int[] killExp, [#888888]int[] tileX, [#888888]int[] tileY, [#888888]int[] sideShift",
                descr = "Spawn an enemy"
            }
        end

        local creep = managers.EnemyManager:getFactory(enemyType):create()
        creep:setSpeed(speed)
        creep.maxHealth = health;
        creep:setHealth(health);
        creep.killScore = killScore;
        creep.bounty = killBounty;
        creep:setKillExp(killExp);

        local tile = systems.MapSystem:getMap():getTile(tileX, tileY)
        systems.EnemySystem:addEnemy(creep, tile, sideShift)
    end
}

-- Show help message when DeveloperConsole is opened for the first time
local devConsoleWasOpened = false
addEventHandler("DeveloperConsoleShow", function()
    if not devConsoleWasOpened then
        devConsoleWasOpened = true

        _G.cmd.help()
    end
end)