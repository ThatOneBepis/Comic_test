local MainUiLayer = luajava.bindClass(GNS .. "managers.UiManager$MainUiLayer")
local StringFormatter = luajava.bindClass(GNS .. "utils.StringFormatter")
local Label = luajava.bindClass("com.badlogic.gdx.scenes.scene2d.ui.Label")
local LabelStyle = luajava.bindClass("com.badlogic.gdx.scenes.scene2d.ui.Label$LabelStyle")
local Color = luajava.bindClass("com.badlogic.gdx.graphics.Color")

local realTimePassed = 0
local gameTimePassed = 0
local lastCheckedTickCount = -1
local lastPrintedGameSeconds
local lastPrintedRealSeconds

local timersLayer
local gameTimerLabel
local realTimerLabel

local updateListener = function (deltaTime)
    gameTimePassed = gameTimePassed + deltaTime

    if lastCheckedTickCount ~= -1 then
        realTimePassed = realTimePassed + (game:getRealTickCount() - lastCheckedTickCount) / 1000000
    end
    lastCheckedTickCount = game:getRealTickCount()

    local gameSeconds = math.floor(gameTimePassed)
    local realSeconds = math.floor(systems.GameStateSystem.playRealTime) -- math.floor(realTimePassed)
    if lastPrintedGameSeconds ~= gameSeconds or lastPrintedRealSeconds ~= realSeconds then
        lastPrintedGameSeconds = gameSeconds
        lastPrintedRealSeconds = realSeconds
        gameTimerLabel:setText(StringFormatter:digestTime(gameSeconds))
        realTimerLabel:setText(StringFormatter:digestTime(realSeconds))
    end
end

addEventHandler("SystemSetup", function()
    gameTimePassed = 0
    realTimePassed = 0
    lastCheckedTickCount = -1

    timersLayer = managers.UiManager:addLayer(MainUiLayer.SCREEN, 9001, "Timers")
    local labelStyle = luajava.newInstance("com.badlogic.gdx.scenes.scene2d.ui.Label$LabelStyle", managers.AssetManager:getFont(CFG.FONT_SIZE_SMALL), Color.WHITE)
    local labelsTable = luajava.newInstance("com.badlogic.gdx.scenes.scene2d.ui.Table")
    timersLayer:getTable():add(labelsTable):expand():top():left():padTop(136):padLeft(186)

    local gameHintLabel = luajava.newInstance("com.badlogic.gdx.scenes.scene2d.ui.Label", "G: ", labelStyle)
    gameTimerLabel = luajava.newInstance("com.badlogic.gdx.scenes.scene2d.ui.Label", "Game", labelStyle)
    local realHintLabel = luajava.newInstance("com.badlogic.gdx.scenes.scene2d.ui.Label", "R: ", labelStyle)
    realTimerLabel = luajava.newInstance("com.badlogic.gdx.scenes.scene2d.ui.Label", "Real", labelStyle)
    labelsTable:add(gameHintLabel)
    labelsTable:add(gameTimerLabel):width(120)
    labelsTable:add(realHintLabel)
    labelsTable:add(realTimerLabel)

    addEventHandler("SystemUpdate", updateListener)
    log("Timers script started")
end)

addEventHandler("SystemDispose", function()
    managers.UiManager:removeLayer(timersLayer);

    removeEventHandler("SystemUpdate", updateListener)
    log("Timers script stopped")
end)