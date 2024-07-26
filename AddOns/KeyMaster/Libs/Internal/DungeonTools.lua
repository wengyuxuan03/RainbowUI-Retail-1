local _, KeyMaster = ...
KeyMaster.DungeonTools = {}
local DungeonTools = KeyMaster.DungeonTools
local Theme = KeyMaster.Theme

local maxModifier = 0.4

--------------------------------
-- Challenge Dungeon Instance Abbreviations.
-- Must be manually maintained.
--------------------------------
--[[ local instanceAbbrTable = {
    [463] = "FALL",     -- Dawn of the Infinite: Galakrond's Fall
    [464] = "RISE",     -- Dawn of the Infinite: Murozond's Rise
    [244] = "AD",       -- Atal'Dazar
    [248] = "WCM",      -- Waycrest Manor
    [199] = "BRH",      -- Black Rook Hold
    [198] = "DHT",      -- Darkheart Thicket
    [168] = "EB",       -- The Everbloom
    [456] = "ToTT"       -- Throne of the Tides
}

function DungeonTools:instanceAbbrs()
    return instanceAbbrTable
end ]]

--------------------------------
-- Dungeon Portal spell IDs
-- Must be manually maintained.
-- https://wago.tools/db2/MapChallengeMode
-- [ChallengeMode Dungeon ID]  Portal Spell ID
--------------------------------
local portalSpellIds = {
    [463] = 424197,     -- Dawn of the Infinite: Galakrond's Fall
    [248] = 424167,     -- Waycrest Manor
    [244] = 424187,     -- Atal'Dazar
    [198] = 424163,     -- Darkheart Thicket
    [199] = 424153,     -- Black Rook Hold
    [464] = 424197,     -- Dawn of the Infinite: Murozond's Rise
    [456] = 424142,     -- Throne of Tides
    [168] = 159901,     -- The Everbloom
    [399] = 393256,     -- Ruby Life Pools
    [400] = 393262,     -- The Nokhud Offensive
    [401] = 393279,     -- The Azure Vault
    [402] = 393273,     -- Algeth'ar Academy
    [403] = 393222,      -- Legacy of Tyr
    [404] = 393276,     -- Neltharus
    [405] = 393267,     -- Brackenhide Hollow
    [406] = 393283,      -- Halls of Infusion
    [503] = 442929,      -- Ara-Kara, City of Echoes
    [502] = 442927,      -- City of Threads
    [505] = 442931,      -- The Dawnbreaker
    [501] = 442926,      -- The Stonevault
    [353] = 272264,      -- Siege of Boralus
    [507] = 396121,      -- The Grim Batol
    [375] = 348533,      -- Mists of Tirna Scithe
    [376] = 348529      -- The Necrotic Wake

}

-- Affix IDs
local OVERFLOWING_ID = 1
local SKITTISH_ID = 2
local VOLCANIC_ID = 3
local NECROTIC_ID = 4
local TEEMING_ID = 5
local RAGING_ID = 6
local BOLSTERING_ID = 7
local SANGUINE_ID = 8
local TYRANNICAL_ID = 9
local FORTIFIED_ID = 10
local BURSTING_ID = 11
local GRIEVOUS_ID = 12
local EXPLOSIVE_ID = 13
local QUAKING_ID = 14
local INFESTED_ID = 16
local SPITEFUL_ID = 123
local STORMING_ID = 124
local ENTAGLING_ID = 134
local AFFLICTED_ID = 135
local INCORPOREAL_ID = 136
local XBASCENDANT_ID = 148
local XBVOIDBOUND_ID = 158
local XBOBLIVION_ID = 159
local XBFRENZIED_ID = 153
local CHALLENGERSPERIL_ID = 152
local XGuile_ID = 147




local weeklyAffixes = { -- DF S4
    [1] = {TYRANNICAL_ID, STORMING_ID, RAGING_ID},
    [2] = {FORTIFIED_ID, ENTAGLING_ID, BOLSTERING_ID},
    [3] = {TYRANNICAL_ID, INCORPOREAL_ID, SPITEFUL_ID},
    [4] = {FORTIFIED_ID, AFFLICTED_ID, RAGING_ID},
    [5] = {TYRANNICAL_ID, VOLCANIC_ID, SANGUINE_ID},
    [6] = {FORTIFIED_ID, STORMING_ID, BURSTING_ID},
    [7] = {TYRANNICAL_ID, AFFLICTED_ID, BOLSTERING_ID},
    [8] = {FORTIFIED_ID, INCORPOREAL_ID, SANGUINE_ID},
    [9] = {TYRANNICAL_ID, ENTAGLING_ID, BURSTING_ID},
    [10] = {FORTIFIED_ID, VOLCANIC_ID, SPITEFUL_ID}
}

function DungeonTools:nextWeeksAffixes(curAffixes)
    local a1, a2, a3 = unpack(curAffixes)
    local thisWeek, nextWeek, nextWeeksAffixes

    for k, v in pairs(weeklyAffixes) do
        if v[1] == a1 and v[2] == a2 and v[3] == a3 then
            thisWeek = k
        end
    end

    nextWeek = thisWeek + 1
    if nextWeek > #weeklyAffixes then
        nextWeek = 1
    end

    nextWeeksAffixes = weeklyAffixes[nextWeek]
    --print("Next Week Affixes: "..C_ChallengeMode.GetAffixInfo(nextWeeksAffixes[1])..C_ChallengeMode.GetAffixInfo(nextWeeksAffixes[2])..C_ChallengeMode.GetAffixInfo(nextWeeksAffixes[3]))
    --print(nextWeeksAffixes)
    return nextWeeksAffixes
end

function DungeonTools:portalSpells()
    return portalSpellIds
end

-- Gets a list of the current weeks affixes.
local weeklyAffixs = nil
function DungeonTools:GetAffixes()
    if weeklyAffixs ~= nil then return weeklyAffixs end
    local affixData = {}
    local affixes = C_MythicPlus.GetCurrentAffixes() -- Bug when this returned nils?
    if (affixes == nil) then return nil end
    for i=1, #affixes, 1 do
       local id = affixes[i].id
       local name, desc, filedataid = C_ChallengeMode.GetAffixInfo(id)
       
       local data = {
          ["id"] = id,
          ["name"] = name,
          ["desc"] = desc,
          ["filedataid"] = filedataid
       }
       tinsert(affixData, data)
    end
    weeklyAffixs = affixData -- stores locally to prevent multiple api calls
    return affixData
 end

 -- Retrieves a dungeon's name by map id.
---@param mapid integer
---@return string or nil
function DungeonTools:GetMapName(mapid)
    local name,_,_,_,_ = C_ChallengeMode.GetMapUIInfo(mapid)

    if (name == nil) then
        KeyMaster:_ErrorMsg("GetMapName", "DungeonTools", "Unable to find mapname for id " .. mapid)   
        return nil   
    end

    return name
end

-- FUNCTION NOTE:
-- C_MythicPlus.GetCurrentSeason()
-- Returns the current Mythic Plus season. Returns -1 until C_MythicPlus.RequestMapInfo() is called at least once.
-- Returns 0 when there is no active season. (To be confirmed)
-- source: https://wowpedia.fandom.com/wiki/API_C_MythicPlus.GetCurrentSeason
local currentSeason
function DungeonTools:GetCurrentSeason(retryCount)
    if currentSeason ~= nil and currentSeason ~= -1 then return currentSeason end
    if retryCount == nil then retryCount = 0 end
    local maxRetryCount = 5    
    
    local seasonNumber = C_MythicPlus.GetCurrentSeason()
    if seasonNumber ~= nil and seasonNumber ~= -1 then
        currentSeason = seasonNumber -- stores locally to prevent multiple api calls
        return currentSeason
    else
        if retryCount < maxRetryCount then
            C_MythicPlus.RequestMapInfo()
            C_Timer.After(3, function() DungeonTools:GetCurrentSeason(retryCount + 1) end)
        else
            KeyMaster:_ErrorMsg("GetCurrentSeason", "DungeonTools.lua", "Failed to get data from C_MythicPlus.GetCurrentSeason() after " .. maxRetryCount .. " retries.")
            return -1
        end
    end
end

-- Gets a list of the live seasons challenge maps
local currentSeasonMaps
function DungeonTools:GetCurrentSeasonMaps()
    if currentSeasonMaps ~= nil and KeyMaster:GetTableLength(currentSeasonMaps) > 0 then 
        return currentSeasonMaps 
    end

    local maps = C_ChallengeMode.GetMapTable();
    
    local mapTable = {}
    for i,v in ipairs(maps) do
       local name, id, timeLimit, texture, backgroundTexture = C_ChallengeMode.GetMapUIInfo(v)
       mapTable[id] = {
            ["id"] = id,
            ["name"] = name,
            ["timeLimit"] = timeLimit,
            ["texture"] = texture,
            ["backgroundTexture"] = backgroundTexture
       }
    end
    
    currentSeasonMaps = mapTable -- stores locally to prevent multiple api calls
    return mapTable  
end

-- conversion from mapid to abbreviation
function DungeonTools:GetDungeonNameAbbr(mapId --[[int]])
    local a
    if KeyMasterLocals.MAPNAMES[mapId] then
        a = KeyMasterLocals.MAPNAMES[mapId].abbr
    else
        a = KeyMasterLocals.MAPNAMES[9001].abbr
    end
    return a
end

-- Finds portal spells, checks if the client has it and retruns it's information
function DungeonTools:GetPortalSpell(dungeonID)
    local portalSpellId = portalSpellIds[dungeonID]
    if (not portalSpellId) then return nil end -- mapID missing from portalSpellIds table

    local portalSpellName

    local isKnown = IsSpellKnown(portalSpellId)
    if (not isKnown) then
        return nil
    else
        portalSpellName, _ = GetSpellInfo(portalSpellId) -- name, rank, icon, castTime, minRange, maxRange, spellID, originalIcon
        return portalSpellId, portalSpellName
    end
end

 -- Set color of week and off-week key data
 function DungeonTools:GetWeekColor(currentAffix)
    local weeklyAffix, weekColor, offWeekColor, myColor
    local wc = {}
    local cw = {}
    local ow = {}
    cw.r, cw.g, cw.b, _ = Theme:GetThemeColor("party_CurrentWeek")
    ow.r, ow.g, ow.b, _ = Theme:GetThemeColor("party_OffWeek")
    weeklyAffix = DungeonTools:GetAffixes()
    if (weeklyAffix == nil) then
        return 1,1,1
    end
    if(weeklyAffix[1].name == currentAffix) then
        wc.r = cw.r
        wc.g = cw.g
        wc.b = cw.b
    else
        wc.r = ow.r
        wc.g = ow.g
        wc.b = ow.b
    end
    return wc.r, wc.g, wc.b
end

-- Set the font face of the week and off-week key data
function DungeonTools:GetWeekFont(currentAffix)
    local weeklyAffix, weekFont, offWeekFont, myFont, cw, ow
    weekFont = "KeyMasterFontBig"
    offWeekFont = "KeyMasterFontSmall"
    weeklyAffix = DungeonTools:GetAffixes()
    if (weeklyAffix == nil) then
        return offWeekFont
    end
    if(weeklyAffix[1].name == currentAffix) then
        myFont = weekFont
    else
        myFont = offWeekFont
    end
    return myFont
end

function DungeonTools:GetWeeklyAffix()
    local weeklyAffix = DungeonTools:GetAffixes()
    if (weeklyAffix == nil) then
        return "No Affixes"
    end
    return weeklyAffix[1].name
end

-- Season to season rating constants with a fallback to the last known season.
-- Works as long as the calculation algorithm doesn’t' change.
local doOnce = 0
---@return table - table of currentseason constants for rating calculations
local function getRatingCalcValues()
    local seasonCalcValues = {
        [11] = { -- DF S3
            baseRating = 20, -- Base score for dungeon completion
            firstAffixLevel = 2, -- lowest M+ Key possible
            fistAffixValue = 10, -- Value of the first affix
            secondAffixLevel = 7, -- Key level the second affix is added
            secondAffixValue = 10, -- Value of the second affix
            thirdAffixLevel = 14, -- Key level the third affix is added
            thirdAffixValue = 10, -- Value of the thrid affix
            thresholdLevel = 10, -- Threshold after which the value of the key changes due to level
            preThresholdValue = 5, -- Value of the pre-threshold levels
            postThresholdValue = 7, -- Value of the post threshold levels
            untimedBaseLevel = 20, -- The level after which untimed keys have no additional value
            twoChestSpeed = 0.8, -- timer % at which a dungeon is 2 chested.
            threeChestSpeed = 0.6, -- timer % at which a dungeon is 3 chested
            bonusTimerRating = 5 -- Bonus/Penalty for timers
        },
        [12] = { -- DF S4 --- THESE ARE GUESSTIMATES AS OF KM v1.0.1!!!!!! ------
            baseRating = 70, -- Base score for dungeon completion
            firstAffixLevel = 2, -- lowest M+ Key possible
            fistAffixValue = 10, -- Value of the first affix
            secondAffixLevel = 5, -- Key level the second affix is added
            secondAffixValue = 10, -- Value of the second affix
            thirdAffixLevel = 10, -- Key level the third affix is added
            thirdAffixValue = 10, -- Value of the thrid affix
            thresholdLevel = 1, -- Threshold after which the value of the key changes due to level
            preThresholdValue = 7, -- Value of the pre-threshold levels
            postThresholdValue = 7, -- Value of the post threshold levels
            untimedBaseLevel = 10, -- The level after which untimed keys have no additional value
            twoChestSpeed = 0.8, -- timer % at which a dungeon is 2 chested.
            threeChestSpeed = 0.6, -- timer % at which a dungeon is 3 chested
            bonusTimerRating = 5 -- Bonus/Penalty for timers
        }
    }

    local mPlusSeason = DungeonTools:GetCurrentSeason()

    -- If curent season # doesn't exist, find the last season numerically and use that.
    if (not seasonCalcValues[mPlusSeason]) then
        -- Set fallback data to last known season.
        local fallbackID = 0
        for k in pairs(seasonCalcValues) do
            if k > fallbackID then
                fallbackID = k
            end
        end
        
        if doOnce == 0 then -- stops debug spam
            KeyMaster:_DebugMsg("getRatingCalcValues","DungeonTools","Could not locate calc data on season "..tostring(mPlusSeason)..". Using season "..tostring(fallbackID).." values.")
            doOnce = 1
        end
        mPlusSeason = fallbackID
    end

    local seasonVars = seasonCalcValues[mPlusSeason]

    return seasonVars

end

-- Calculates the dungeon runs performance based on its timer thresholds. 
---@param dungeonID integer - the id of the dungeon
---@param timeCompleted integer - the runs time in seconds
---@return string - string of the performance i.e. + or +++
function DungeonTools:CalculateChest(dungeonID, timeCompleted)

    local seasonVars = getRatingCalcValues()
    if (not seasonVars) then
        KeyMaster:_ErrorMsg("CalculateChest","DungeonTools","Run time level values could not be loaded.")
        return ""
    end

    if timeCompleted == nil or timeCompleted == 0 then return "" end
    if currentSeasonMaps == nil then
        currentSeasonMaps = DungeonTools:GetCurrentSeasonMaps()
    end
    local timeLimit = currentSeasonMaps[dungeonID].timeLimit
    if(timeCompleted <= (timeLimit * seasonVars.threeChestSpeed)) then return "+++" end
    if(timeCompleted <= (timeLimit * seasonVars.twoChestSpeed)) then return "++" end
    if(timeCompleted <= timeLimit) then return "+" end
    return ""
end

function DungeonTools:GetChestTimers(mapId)
    local mapTable = DungeonTools:GetCurrentSeasonMaps()
    local timeLimit = mapTable[mapId].timeLimit

    local seasonVars = getRatingCalcValues()
    if (not seasonVars) then
        KeyMaster:_ErrorMsg("GetChestTimers","DungeonTools","Run time level values could not be loaded.")
        return
    end

    local chestTimers = {
        ["3chest"] = timeLimit * seasonVars.threeChestSpeed,
        ["2chest"] = timeLimit * seasonVars.twoChestSpeed,
        ["1chest"] = timeLimit
    }
    return chestTimers
end

---@param level integer - level of mythic plus key to calculate
---@return integer - (Base rating + afffix score)
local function getBaseScore(level)

    local seasonVars = getRatingCalcValues()
    if (not seasonVars) then
        KeyMaster:_ErrorMsg("getBaseScore","DungeonTools","Season reating calculation values could not be loaded.")
        return 0
    end

    -- Every completed key has a bonus of X rating
    local baseRating = seasonVars.baseRating

    -- First X levels are worth X rating per level
    local firstRating = 0
    if level >= seasonVars.thresholdLevel then
        firstRating = seasonVars.thresholdLevel * seasonVars.preThresholdValue
    else
        firstRating = level * seasonVars.preThresholdValue
    end

    -- Every level after X is worth X rating per level
    local secondRating = 0
    if level > seasonVars.thresholdLevel then
        secondRating = (level - seasonVars.thresholdLevel) * seasonVars.postThresholdValue
    end

    -- Every affix added is worth X rating
    -- S3 Affixes are added at key level 2, 7 and 14
    -- S4 Affixes are added at key level 2, 5 and 10
    local affixScore = 0
    if level >= seasonVars.firstAffixLevel then
        affixScore = affixScore + seasonVars.fistAffixValue
    end
    if level >= seasonVars.secondAffixLevel then
        affixScore = affixScore +  seasonVars.secondAffixValue
    end
    if level >= seasonVars.thirdAffixLevel then
        affixScore = affixScore + seasonVars.thirdAffixValue
    end

    --print("Base: For level "..level.." is "..tostring(baseRating + firstRating + secondRating + affixScore).." ")
    return baseRating + firstRating + secondRating + affixScore
end

---@param dungeonID integer
---@param keyLevel integer level of mythic plus key to calculate
---@param runTime integer
---@return integer Total score for a dungeon by dungeon id, key level, and run time.
function DungeonTools:CalculateRating(dungeonID, keyLevel, runTime)
    -- ((totaltime - runTime)/(totaltime * maxModifier)) * 5 = bonusScore
    -- Subtract 5 if overtime

    local seasonVars = getRatingCalcValues()
    if (not seasonVars) then
        KeyMaster:_ErrorMsg("CalculateRating","DungeonTools","Season reating calculation values could not be loaded.")
        return 0
    end
    
    if (keyLevel < seasonVars.firstAffixLevel) then
        return 0
    end

    if currentSeasonMaps == nil then
        currentSeasonMaps = DungeonTools:GetCurrentSeasonMaps()
    end
    local bonusRating = 0
    local dungeonTimeLimit = currentSeasonMaps[dungeonID].timeLimit
    -- Runs over time by 40% are a 0 score.
    if(runTime > (dungeonTimeLimit + (dungeonTimeLimit * maxModifier))) then
        return 0
    end
    
    -- Calculate the bonus score from timer
    local numerator = dungeonTimeLimit - runTime
    local denominator = dungeonTimeLimit * maxModifier
    local quotient = numerator/denominator    
    if(quotient >= 1) then bonusRating = seasonVars.bonusTimerRating
    elseif(quotient <= -1) then bonusRating = -seasonVars.bonusTimerRating
    else bonusRating = quotient * seasonVars.bonusTimerRating end

    if(runTime > dungeonTimeLimit) then
        bonusRating  = bonusRating - seasonVars.bonusTimerRating
    end
    
    -- Untimed keys over 20 use the base score of a 20. - DF S3
    local base = seasonVars.untimedBaseLevel

    if(keyLevel > base and runTime > dungeonTimeLimit) then
        keyLevel = base
    end
    return getBaseScore(keyLevel) + bonusRating
end

--CalculateDungeonTotal - Calculates a dungeons overall score contributing to a players rating.
---@param seasonAffixScore1 integer - best score for dungeon for a weekly affix
---@param seasonAffixScore2 integer - best score for dungeon for a weekly affix
---@return integer - the total rating for the dungeons scores
function DungeonTools:CalculateDungeonTotal(seasonAffixScore1, seasonAffixScore2)
    local total
    if(seasonAffixScore1 > seasonAffixScore2) then
        total = KeyMaster:RoundSingleDecimal(seasonAffixScore1 * 1.5) + KeyMaster:RoundSingleDecimal(seasonAffixScore2 * 0.5)
    else
        total = KeyMaster:RoundSingleDecimal(seasonAffixScore1 * 0.5) + KeyMaster:RoundSingleDecimal(seasonAffixScore2 * 1.5)
    end
    return total
end

---@return table - Challenge Mode Completion Information
function DungeonTools:ChallengeModeCompletionInfo()
    ---@param mapChallengeModeID number
    local mapChallengeModeID
    ---@param level number
    local level
    ---@param time number - Time in milliseconds
    local time
    ---@param onTime boolean
    local onTime
    ---@param keystoneUpgradeLevels number
    local keystoneUpgradeLevels
    ---@param practiceRun boolean
    local practiceRun
    ---@param oldOverallDungeonScore number
    local oldOverallDungeonScore
    ---@param newOverallDungeonScore number
    local newOverallDungeonScore
    ---@param IsMapRecord boolean
    local IsMapRecord
    ---@param IsAffixRecord boolean
    local IsAffixRecord
    ---@param PrimaryAffix number
    local PrimaryAffix
    ---@param isEligibleForScore boolean
    local isEligibleForScore
    ---@param members table - [#]{(string) memberGUID, (string) name}
    local members

    mapChallengeModeID, level, time, onTime, keystoneUpgradeLevels, practiceRun, oldOverallDungeonScore, newOverallDungeonScore, IsMapRecord, IsAffixRecord, PrimaryAffix, isEligibleForScore, members = C_ChallengeMode.GetCompletionInfo()
    --if KeyMaster:GetTableLength(completionData) > 0 then
        C_Timer.After(3, function()
            local mapName = DungeonTools:GetMapName(mapChallengeModeID)
            local timeStatus
            if onTime then timeStatus = "a timed" else timeStatus = "an untimed" end
            local plusText = "+"..tostring(keystoneUpgradeLevels)
            if not mapName then KeyMaster:_ErrorMsg("ChallengeModeCompletionInfo","DungeonTools", "Could not find mapID "..tostring(mapChallengeModeID)) 
                return
            end
            --KeyMaster:Print("You've completed "..timeStatus.." "..mapName.. " ("..level..") at "..plusText.." in "..(KeyMaster:FormatDurationSec(time))) -- todo: Point to function for party announcements.
        end)
    --else
        --KeyMaster:_ErrorMsg("ChallengeModeCompletionInfo", "DungeonTools", "CompletionInfo returned empty data.")
    --end
end