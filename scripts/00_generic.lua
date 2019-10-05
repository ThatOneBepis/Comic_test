GNS = "com.prineside.tdi2." -- Game name space
CFG = luajava.bindClass(GNS .. "Config")

-- com.prineside.tdi2.enums.*
local enumNames = { 
    "AbilityType",
    "AchievementType",
    "ActionType",
    "BossType",
    "BuffType",
    "BuildingType",
    "CaseType",
    "DamageType",
    "DifficultyMode",
    "EnemyType",
    "ExplosionType",
    "GameValueType",
    "GateType",
    "GeneralizedTowerStatType",
    "ItemCategoryType",
    "ItemType",
    "MinerType",
    "ModifierType",
    "PredefinedCoreTileType",
    "ProjectileType",
    "RequirementType",
    "ResearchCategoryType",
    "ResearchType",
    "ResourceType",
    "ShapeType",
    "SoundType",
    "SpaceTileBonusType",
    "StaticSoundType",
    "StatisticsType",
    "TileType",
    "TowerStatType",
    "TowerType",
    "TrophyType",
    "UnitType"
};
_G.enums = {}
for _, v in pairs(enumNames) do
    _G.enums[v] = luajava.bindClass(GNS .. "enums." .. v)
end

log("Generic scripts loaded")