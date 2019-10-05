--[[
-- Put Lua scripts in folder named "userscripts", you can use subfolders if you wish.
-- Files starting with '_' will be ignored.
-- Game will load scripts only at game start, ordered by name. To simplify scripts sorting, you can add a prefix to their names:
--   01_runs_first.lua
--   02_runs_second.lua
--   99_runs_last.lua
 ]]

-- Script is run when all managers are loaded
log("Examples script was successfully loaded")

--====================================================================================================================--
--<                                                Predefined things                                                 >--
--====================================================================================================================--
-- Game game - object of Game instance
-- table systems - all game systems. Systems hold main game logic and methods to work with game components during the game. When game is not running (for example in MainMenu) this table becomes nil. Use this table only between ScriptSystem.setup and ScriptSystem.dispose events. After ScriptSystem.dispose is triggered all systems become invalid
-- table CFG - some constants from game configuration, read only
-- table gdx - all objects from Gdx class (Gdx.app, Gdx.files, Gdx.input, Gdx.graphics, net etc.)
-- table reflection - some methods from Java Reflection API
--   table reflection.getFields(Class class) - get all fields of Java class. Returns an array of java.lang.reflect.Field
-- table enums - all enums (com.prineside.tdi2.enums.*) for easier console usage

-- function log(string message) - log message into STDOUT and DeveloperConsole. You can use LibGDX color coding: "[#44AAFF]Hello[] [#FF9900]world[]!"
-- function warning(string message) - same as log but has "error" message type in both standart & DeveloperConsole log
-- function addEventHandler(string eventName, function listener) - listen to the game event. See examples below
-- function removeEventHandler(string eventName, function listener) - remove event listener

-- Among other things, all libs from LuaJ are loaded
-- See http://www.luaj.org/luaj/3.0/README.html#4 for more details.
-- Btw, luajava lib is enabled, so if you think some features / events are missing, use it.

--====================================================================================================================--
--<                                                      Events                                                      >--
--====================================================================================================================--
-- To listen to different game events, use addEventHandler(string eventName, function listener) as shown below.
local updateCount = 0
local ingameTimePassed = 0
local lastPrintTickCount = -1   -- microseconds in fact

local updateListener = function (deltaTime)
    ingameTimePassed = ingameTimePassed + deltaTime
    updateCount = updateCount + 1

    if lastPrintTickCount == -1 then
        lastPrintTickCount = game:getRealTickCount()
    elseif (game:getRealTickCount() - lastPrintTickCount > 5000000) then
        local realCPS = updateCount / ((game:getRealTickCount() - lastPrintTickCount) / 1000000)
        local ingameCPS = updateCount / ingameTimePassed
        log("Average ScriptSystem.update frequency for the last 5 seconds: " .. realCPS .. " calls/s (" .. ingameCPS .. " calls/s for ingame time)")
        -- Minimum updates-per-ingame-second is defined by CFG.UPDATE_DELTA_TIME (30 FPS) so game will drop some updates at high game speeds for optimal performance. That's why ingameCPS will not fall under 30 calls/s
        updateCount = 0
        ingameTimePassed = 0
        lastPrintTickCount = game:getRealTickCount()
    end
end

addEventHandler("SystemSetup", function()
    addEventHandler("SystemUpdate", updateListener)
    log("Started listening to updates")
end)

addEventHandler("SystemDispose", function()
    removeEventHandler("SystemUpdate", updateListener)
    log("Stoped listening to updates")
end)

--------------------------------------------- Main script lifecycle events ---------------------------------------------
-- GameLoaded()                                      // Game is fully loaded
-- SystemConstruct()                                 // ScriptSystem is constructed
-- SystemSetup()                                     // ScriptSystem is set up (game started). At this point global table "systems" is available and system objects can be cached
-- SystemPostSetup()                                 // All systems were set up. At this point it is safe to work with other systems in regular way
-- SystemUpdate(double deltaTime)                    // Called each frame when all systems are updated. deltaTime - time in in-game (real time * game speed) seconds since last call
-- SystemDraw(SpriteBatch batch, double deltaTime)   // Called each frame when all systems rendered all they need. batch - instance of SpriteBatch currently drawing. deltaTime - time in in-game seconds since last call
-- SystemDispose()                                   // Systems are being disposed. All systems become invalid at this point

----------------------------------------------- DeveloperConsole events ------------------------------------------------
-- DeveloperConsoleShow()                            // DeveloperConsole became visible
-- DeveloperConsoleHide()                            // DeveloperConsole became hidden