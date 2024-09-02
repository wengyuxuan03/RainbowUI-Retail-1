--- Kaliel's Tracker
--- Copyright (c) 2012-2024, Marouan Sabbagh <mar.sabbagh@gmail.com>
--- All Rights Reserved.
---
--- This file is part of addon Kaliel's Tracker.

local _, KT = ...

-- Constants
KT.MODULES = {
    "KT_ScenarioObjectiveTracker",
    "KT_UIWidgetObjectiveTracker",
    "KT_CampaignQuestObjectiveTracker",
    "KT_BonusObjectiveTracker",
    "KT_WorldQuestObjectiveTracker",
    "KT_QuestObjectiveTracker",
    "KT_AdventureObjectiveTracker",
    "KT_AchievementObjectiveTracker",
    "KT_MonthlyActivitiesObjectiveTracker",
    "KT_ProfessionsRecipeTracker"
}

KT.EXPANSION = EXPANSION_NAME10

KT.QUEST_DASH = "- "
KT_QUEST_DASH = KT.QUEST_DASH
KT.RETRIEVING_DATA = RETRIEVING_DATA.."..."

KT.TRACKER_DEFAULT_COLOR = { r = 0.93, g = 0.76, b = 0 }

KT.PLAYER_FACTION_COLORS = {
    Horde = "ff0000",
    Alliance = "007fff"
}

KT.QUALITY_COLORS = {
    Poor = "9d9d9d",
    Common = "ffffff",
    Uncommon = "1eff00",
    Rare = "0070dd",
    Epic = "a335ee",
    Legendary = "ff8000",
    Artifact = "e6cc80"
}

KT.AZERITE_CURRENCY_ID = C_CurrencyInfo.GetAzeriteCurrencyID()
KT.WAR_RESOURCES_CURRENCY_ID = C_CurrencyInfo.GetWarResourcesCurrencyID()
KT.ORDER_RESOURCES_CURRENCY_ID = 1220

KT.WORLD_QUEST_REWARD_TYPE_FLAG_MONEY = 0x0001
KT.WORLD_QUEST_REWARD_TYPE_FLAG_RESOURCES = 0x0002
KT.WORLD_QUEST_REWARD_TYPE_FLAG_ARTIFACT_POWER = 0x0004
KT.WORLD_QUEST_REWARD_TYPE_FLAG_MATERIALS = 0x0008
KT.WORLD_QUEST_REWARD_TYPE_FLAG_EQUIPMENT = 0x0010
KT.WORLD_QUEST_REWARD_TYPE_FLAG_REPUTATION = 0x0020
KT.WORLD_QUEST_REWARD_TYPE_FLAG_OTHERS = 0x10000

-- Blizzard Constants
KT_OBJECTIVE_TRACKER_COLOR["Header"] = { r = 1, g = 0.5, b = 0 }                 -- orange
KT_OBJECTIVE_TRACKER_COLOR["Complete"] = { r = 0.1, g = 0.85, b = 0.1 }          -- green
KT_OBJECTIVE_TRACKER_COLOR["CompleteHighlight"] = { r = 0, g = 1, b = 0 }        -- green
KT_OBJECTIVE_TRACKER_COLOR["TimeLeft2"] = { r = 0, g = 0.5, b = 1 }              -- blue
KT_OBJECTIVE_TRACKER_COLOR["TimeLeft2Highlight"] = { r = 0.3, g = 0.65, b = 1 }  -- blue
KT_OBJECTIVE_TRACKER_COLOR["Label"] = { r = 0.5, g = 0.5, b = 0.5 }              -- gray
KT_OBJECTIVE_TRACKER_COLOR["LabelHighlight"] = { r = 0.6, g = 0.6, b = 0.6 }     -- gray
KT_OBJECTIVE_TRACKER_COLOR["Zone"] = { r = 0.1, g = 0.65, b = 1 }                -- blue
KT_OBJECTIVE_TRACKER_COLOR["ZoneHighlight"] = { r = 0.3, g = 0.8, b = 1 }        -- blue
KT_OBJECTIVE_TRACKER_COLOR["Inactive"] = GRAY_FONT_COLOR                         -- gray
KT_OBJECTIVE_TRACKER_COLOR["InactiveHighlight"] = LIGHTGRAY_FONT_COLOR           -- gray
KT_OBJECTIVE_TRACKER_COLOR["Header"].reverse = KT_OBJECTIVE_TRACKER_COLOR["HeaderHighlight"]
KT_OBJECTIVE_TRACKER_COLOR["HeaderHighlight"].reverse = KT_OBJECTIVE_TRACKER_COLOR["Header"]
KT_OBJECTIVE_TRACKER_COLOR["Complete"].reverse = KT_OBJECTIVE_TRACKER_COLOR["CompleteHighlight"]
KT_OBJECTIVE_TRACKER_COLOR["CompleteHighlight"].reverse = KT_OBJECTIVE_TRACKER_COLOR["Complete"]
KT_OBJECTIVE_TRACKER_COLOR["TimeLeft2"].reverse = KT_OBJECTIVE_TRACKER_COLOR["TimeLeft2Highlight"]
KT_OBJECTIVE_TRACKER_COLOR["TimeLeft2Highlight"].reverse = KT_OBJECTIVE_TRACKER_COLOR["TimeLeft2"]
KT_OBJECTIVE_TRACKER_COLOR["Label"].reverse = KT_OBJECTIVE_TRACKER_COLOR["LabelHighlight"]
KT_OBJECTIVE_TRACKER_COLOR["LabelHighlight"].reverse = KT_OBJECTIVE_TRACKER_COLOR["Label"]
KT_OBJECTIVE_TRACKER_COLOR["Zone"].reverse = KT_OBJECTIVE_TRACKER_COLOR["ZoneHighlight"]
KT_OBJECTIVE_TRACKER_COLOR["ZoneHighlight"].reverse = KT_OBJECTIVE_TRACKER_COLOR["Zone"]
KT_OBJECTIVE_TRACKER_COLOR["Inactive"].reverse = KT_OBJECTIVE_TRACKER_COLOR["InactiveHighlight"]
KT_OBJECTIVE_TRACKER_COLOR["InactiveHighlight"].reverse = KT_OBJECTIVE_TRACKER_COLOR["Inactive"]

-- Max Quests - fix Blizz bug
MAX_QUESTS = C_QuestLog.GetMaxNumQuestsCanAccept()