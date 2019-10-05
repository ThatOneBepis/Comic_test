_G.tutorial = {
    ADVINAS_TAG = "[#3d9428]DATASCREAM:[]",
    ENSOR_TAG = "[#03A9F4]Ensor Inc.:[]",
    BASIC_TAG = "[#00897b]Basic:[]",
    CANNON_TAG = "[#e53935]Cannon:[]",
    PYRO_TAG = "[#fb8c00]Flamethrower:[]",
    FREEZE_TAG = "[#1e88e5]Freezing:[]",
    MINIGUN_TAG = "[#8e24aa]Minigun:[]",
    MISSILE_TAG = "[#d81b60]Missile:[]",
    MULTISHOT_TAG = "[#fdd835]Multishot:[]",
    SNIPER_TAG = "[#43a047]Sniper:[]",
    SPLASH_TAG = "[#f4511e]Splash:[]",
    TESLA_TAG = "[#3949ab]Tesla:[]",
    LASER_TAG = "[#039be5]Laser:[]",
    SPAWNER_TAG = "[#632280]Spawner:[]",
    AIR_TAG = "[#00acc1]Antiair:[]",
    LASERBUTHEISWOKE_TAG = "[#039be5]Chad Laser:[]",
    SENTINEL_TAG = "[#206fb4]Sentinel:[]",
    DRONER_TAG = "[#00b1de]Overlord:[]",
    GRIMLOCK_TAG = "[#a08b33]Grimlock:[]",
    PYLON_TAG = "[#a08b33]Pylon:[]"

    new = function(self, tutorialStages)
        tutorialStages = tutorialStages or {}

        local o = {}
        setmetatable(o, self)
        self.__index = self

        self.stages = tutorialStages;
        self.currentStage = 1;
        self.updateTimeAccumulator = 0;
        self.currentStageIsDone = false;
        self.delayedFunctions = {};
        self.conditions = {};

        return o
    end,

    start = function(self)
        for i = 1, #self.stages do
            self.currentStage = i
            if not self.stages[i].check() then
                self.stages[i].start()
                break
            end
        end
    end,

    delay = function(self, delayInSeconds, cb)
        table.insert(self.delayedFunctions, {
            delay = delayInSeconds,
            cb = cb
        })
    end,

    condition = function(self, condition, cb)
        self.conditions[#self.conditions + 1] = {
            condition = condition,
            cb = cb
        }
    end,

    startNextStage = function(self)
        self.currentStage = self.currentStage + 1
        if self.stages[self.currentStage] ~= nil then
            self.currentStageIsDone = false
            self.stages[self.currentStage].start()
        else
            log("tutorial - no stages left")
        end
    end,

    update = function(self, realDeltaTime)
        for i = 1, #self.delayedFunctions do
            local e = self.delayedFunctions[i]
            if e ~= nil then
                e.delay = e.delay - realDeltaTime
                if e.delay <= 0 then
                    self.delayedFunctions[i] = nil
                    e.cb()
                end
            end
        end

        utils.compactnil(self.delayedFunctions)

        for i = 1, #self.conditions do
            local e = self.conditions[i]
            if e ~= nil then
                if e.condition() then
                    e.cb()
                    self.conditions[i] = nil
                end
            end
        end
        utils.compactnil(self.conditions)

        self.updateTimeAccumulator = self.updateTimeAccumulator + realDeltaTime
        if self.updateTimeAccumulator > 0.5 then
            self.updateTimeAccumulator = 0

            if self.stages[self.currentStage] ~= nil and not self.currentStageIsDone then
                -- Еще есть задания
                if self.stages[self.currentStage].check() then
                    self.stages[self.currentStage].done()
                    self.currentStageIsDone = true
                else
                    local updateHandler = self.stages[self.currentStage].update
                    if updateHandler ~= nil then updateHandler(realDeltaTime) end
                end
            end
        end
    end
}