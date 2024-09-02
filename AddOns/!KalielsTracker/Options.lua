--- Kaliel's Tracker
--- Copyright (c) 2012-2024, Marouan Sabbagh <mar.sabbagh@gmail.com>
--- All Rights Reserved.
---
--- This file is part of addon Kaliel's Tracker.

local addonName, KT = ...
KT.forcedUpdate = false

local ACD = LibStub("MSA-AceConfigDialog-3.0")
local ACR = LibStub("AceConfigRegistry-3.0")
local LSM = LibStub("LibSharedMedia-3.0")
local WidgetLists = AceGUIWidgetLSMlists
local _DBG = function(...) if _DBG then _DBG("KT", ...) end end

-- Lua API
local abs = math.abs
local floor = math.floor
local fmod = math.fmod
local format = string.format
local gsub = string.gsub
local ipairs = ipairs
local pairs = pairs
local round = function(n) return floor(n + 0.5) end
local strlen = string.len
local strsplit = string.split
local strsub = string.sub

local db, dbChar
local mediaPath = "Interface\\AddOns\\"..addonName.."\\Media\\"
local anchors = { "TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT" }
local strata = { "BACKGROUND", "LOW", "MEDIUM", "HIGH" }
local flags = { [""] = "無", ["OUTLINE"] = "外框", ["OUTLINE, MONOCHROME"] = "無消除鋸齒外框" }
local textures = { "無", "預設 (暴雪)", "單線", "雙線" }
local modifiers = { [""] = "無", ["ALT"] = "Alt", ["CTRL"] = "Ctrl", ["ALT-CTRL"] = "Alt + Ctrl" }
local realmZones = { ["EU"] = "歐洲", ["NA"] = "北美" }

local cTitle = " "..NORMAL_FONT_COLOR_CODE
local cBold = "|cff00ffe3"
local cWarning = "|cffff7f00"
local cWarning2 = "|cffff4200"
local beta = "|cffff7fff[Beta]|r"
local warning = cWarning.."注意:|r 將會重新載入介面!"

local KTF = KT.frame
local OTF = KT_ObjectiveTrackerFrame

local overlay
local overlayShown = false

local OverlayFrameUpdate, OverlayFrameHide, GetModulesOptionsTable, MoveModule, SetSharedColor, IsSpecialLocale, UpdateOptions  -- functions

local defaults = {
	profile = {
		anchorPoint = "TOPRIGHT",
		xOffset = 0,
		yOffset = -280,
		width = 305,
		maxHeight = 400,
		frameScrollbar = true,
		frameStrata = "LOW",
		
		bgr = "Solid",
		bgrColor = { r=0, g=0, b=0, a=0 },
		border = "無",
		borderColor = KT.TRACKER_DEFAULT_COLOR,
		classBorder = false,
		borderAlpha = 1,
		borderThickness = 16,
		bgrInset = 4,
		progressBar = "Blizzard",

		font = LSM:GetDefault("font"),
		fontSize = 16,
		fontFlag = "",
		fontShadow = 1,
		colorDifficulty = false,
		textWordWrap = false,
		objNumSwitch = false,

		hdrBgr = 2,
		hdrBgrColor = KT.TRACKER_DEFAULT_COLOR,
		hdrBgrColorShare = false,
		hdrTxtColor = KT.TRACKER_DEFAULT_COLOR,
		hdrTxtColorShare = false,
		hdrBtnColor = KT.TRACKER_DEFAULT_COLOR,
		hdrBtnColorShare = false,
		hdrQuestsTitleAppend = true,
		hdrAchievsTitleAppend = true,
		hdrPetTrackerTitleAppend = true,
		hdrTrackerBgrShow = false,
		hdrCollapsedTxt = 1,
		hdrOtherButtons = false,
		keyBindMinimize = "",

		qiBgrBorder = false,
		qiXOffset = -5,
		qiActiveButton = false,
		qiActiveButtonBindingShow = false,

		hideEmptyTracker = false,
		collapseInInstance = true,
		tooltipShow = true,
		tooltipShowRewards = true,
		tooltipShowID = false,
        menuWowheadURL = true,
        menuWowheadURLModifier = "ALT",
        questDefaultActionMap = true,
		questShowTags = true,
		questShowZones = true,

		messageQuest = true,
		messageAchievement = true,
		sink20OutputSink = "RaidWarning",
		sink20Sticky = false,
		soundQuest = false,
		soundQuestComplete = "KT - Default",

		modulesOrder = KT.MODULES,

		addonMasque = false,
		addonPetTracker = true,
		addonTomTom = false,

		hackLFG = true,
		hackWorldMap = true,
	},
	char = {
		collapsed = false,
		quests = {
			num = 0,
			favorites = {},
			cache = {}
		},
		achievements = {
			favorites = {}
		}
	}
}

local options = {
	name = "|T"..mediaPath.."KT_logo:22:22:-1:7|t任務追蹤清單增強",
	type = "group",
	get = function(info) return db[info[#info]] end,
	args = {
		general = {
			name = "選項",
			type = "group",
			args = {
				sec0 = {
					name = "資訊",
					type = "group",
					inline = true,
					order = 0,
					args = {
						version = {
							name = "  |cffffd100版本:|r  "..KT.version,
							type = "description",
							width = "normal",
							fontSize = "medium",
							order = 0.11,
						},
						build = {
							name = " |cffffd100Build:|r  Retail",
							type = "description",
							width = "normal",
							fontSize = "medium",
							order = 0.12,
						},
						slashCmd = {
							name = cBold.." /kt|r  |cff808080..............|r  切換 (展開/收起) 任務追蹤清單\n"..
									cBold.." /kt hide|r  |cff808080......|r  切換 (顯示/隱藏) 任務追蹤清單\n"..
									cBold.." /kt config|r  |cff808080...|r  顯示設定選項視窗\n",
							type = "description",
							width = "double",
							order = 0.3,
						},
						news = {
							name = "更新資訊",
							type = "execute",
							disabled = function()
								return not KT.Help:IsEnabled()
							end,
							func = function()
								KT.Help:ShowHelp(true)
							end,
							order = 0.2,
						},
						help = {
							name = "使用說明",
							type = "execute",
							disabled = function()
								return not KT.Help:IsEnabled()
							end,
							func = function()
								KT.Help:ShowHelp()
							end,
							order = 0.4,
						},
						supportersSpacer = {
							name = " ",
							type = "description",
							width = "normal",
							order = 0.51,
						},
						supportersLabel = {
							name = "                |cff00ff00成為贊助者",
							type = "description",
							width = "normal",
							fontSize = "medium",
							order = 0.52,
						},
						supporters = {
							name = "支持贊助",
							type = "execute",
							disabled = function()
								return not KT.Help:IsEnabled()
							end,
							func = function()
								KT.Help:ShowSupporters()
							end,
							order = 0.53,
						},
					},
				},
				sec1 = {
					name = "位置/大小",
					type = "group",
					inline = true,
					order = 1,
					args = {
						anchorPoint = {
							name = "對齊畫面",
							desc = "- 預設: "..defaults.profile.anchorPoint,
							type = "select",
							values = anchors,
							get = function()
								for k, v in ipairs(anchors) do
									if db.anchorPoint == v then
										return k
									end
								end
							end,
							set = function(_, value)
								db.anchorPoint = anchors[value]
								db.xOffset = 0
								db.yOffset = 0
								UpdateOptions()
								KT:MoveTracker()
								OverlayFrameUpdate()
								OTF:Update()
							end,
							order = 1.1,
						},
						xOffset = {
							name = "水平位置",
							desc = "- 預設: "..defaults.profile.xOffset.."\n- 單位: 1",
							type = "range",
							min = 0,
							max = 0,
							step = 1,
							set = function(_, value)
								db.xOffset = value
								KT:MoveTracker()
							end,
							order = 1.2,
						},
						yOffset = {
							name = "垂直位置",
							desc = "- 預設: "..defaults.profile.yOffset.."\n- 單位: 2",
							type = "range",
							min = 0,
							max = 0,
							step = 2,
							set = function(_, value)
								db.yOffset = value
								UpdateOptions(true)
								KT:MoveTracker()
								KT:SetSize()
								OverlayFrameUpdate()
							end,
							order = 1.3,
						},
						maxHeight = {
							name = "最大高度",
							desc = "- 預設: "..defaults.profile.maxHeight.."\n- 單位: 2",
							type = "range",
							min = 100,
							max = 100,
							step = 2,
							set = function(_, value)
								db.maxHeight = value
								KT:SetSize()
								OverlayFrameUpdate()
							end,
							order = 1.4,
						},
						maxHeightShowOverlay = {
							name = "顯示最大高度範圍",
							desc = "顯示區域範圍，更容易看出最大高度的值。",
							type = "toggle",
							width = 1.3,
							get = function()
								return overlayShown
							end,
							set = function()
								overlayShown = not overlayShown
								if overlayShown and not overlay then
									overlay = CreateFrame("Frame", KTF:GetName().."Overlay", KTF)
									overlay:SetFrameLevel(KTF:GetFrameLevel() + 12)
									overlay:EnableMouse(true)
									overlay.texture = overlay:CreateTexture(nil, "BACKGROUND")
									overlay.texture:SetAllPoints()
									overlay.texture:SetColorTexture(0, 1, 0, 0.3)
									OverlayFrameUpdate()
								end
								overlay:SetShown(overlayShown)
							end,
							order = 1.5,
						},
						maxHeightNote = {
							name = cBold.."\n 最大高度會隨著垂直位置而變動。\n"..
								" 內容較少 ... 任務追蹤清單高度會自動縮小。\n"..
								" 內容較多 ... 任務追蹤清單會啟用捲動功能。",
							type = "description",
							order = 1.6,
						},
						frameScrollbar = {
							name = "顯示捲動指示軸",
							desc = "啟用捲動功能時顯示捲動指示軸，使用與邊框相同顏色。",
							type = "toggle",
							set = function()
								db.frameScrollbar = not db.frameScrollbar
								KTF.Bar:SetShown(db.frameScrollbar)
								KT:SetSize()
							end,
							order = 1.7,
						},
						frameStrata = {
							name = "框架層級",
							desc = "- 預設: "..defaults.profile.frameStrata,
							type = "select",
							values = strata,
							get = function()
								for k, v in ipairs(strata) do
									if db.frameStrata == v then
										return k
									end
								end
							end,
							set = function(_, value)
								db.frameStrata = strata[value]
								KTF:SetFrameStrata(strata[value])
								KTF.Buttons:SetFrameStrata(strata[value])
							end,
							order = 1.8,
						},
					},
				},
				sec2 = {
					name = "背景/邊框",
					type = "group",
					inline = true,
					order = 2,
					args = {
						bgr = {
							name = "背景材質",
							type = "select",
							dialogControl = "LSM30_Background",
							values = WidgetLists.background,
							set = function(_, value)
								db.bgr = value
								KT:SetBackground()
							end,
							order = 2.1,
						},
						bgrColor = {
							name = "背景顏色",
							type = "color",
							hasAlpha = true,
							get = function()
								return db.bgrColor.r, db.bgrColor.g, db.bgrColor.b, db.bgrColor.a
							end,
							set = function(_, r, g, b, a)
								db.bgrColor.r = r
								db.bgrColor.g = g
								db.bgrColor.b = b
								db.bgrColor.a = a
								KT:SetBackground()
							end,
							order = 2.2,
						},
						bgrNote = {
							name = cBold.." 使用自訂背景時\n 材質設為白色。",
							type = "description",
							width = "normal",
							order = 2.21,
						},
						border = {
							name = "邊框材質",
							type = "select",
							dialogControl = "LSM30_Border",
							values = WidgetLists.border,
							set = function(_, value)
								db.border = value
								KT:SetBackground()
								KT:MoveButtons()
							end,
							order = 2.3,
						},
						borderColor = {
							name = "邊框顏色",
							type = "color",
							disabled = function()
								return db.classBorder
							end,
							get = function()
								if not db.classBorder then
									SetSharedColor(db.borderColor)
								end
								return db.borderColor.r, db.borderColor.g, db.borderColor.b
							end,
							set = function(_, r, g, b)
								db.borderColor.r = r
								db.borderColor.g = g
								db.borderColor.b = b
								KT:SetBackground()
								KT:SetText()
								SetSharedColor(db.borderColor)
							end,
							order = 2.4,
						},
						classBorder = {
							name = "邊框使用 |cff%s職業顏色|r",
							type = "toggle",
							get = function(info)
								if db[info[#info]] then
									SetSharedColor(KT.classColor)
								end
								return db[info[#info]]
							end,
							set = function()
								db.classBorder = not db.classBorder
								KT:SetBackground()
								KT:SetText()
							end,
							order = 2.5,
						},
						borderAlpha = {
							name = "邊框透明度",
							desc = "- 預設: "..defaults.profile.borderAlpha.."\n- 單位: 0.05",
							type = "range",
							min = 0.1,
							max = 1,
							step = 0.05,
							set = function(_, value)
								db.borderAlpha = value
								KT:SetBackground()
							end,
							order = 2.6,
						},
						borderThickness = {
							name = "邊框粗細",
							desc = "- 預設: "..defaults.profile.borderThickness.."\n- 單位: 0.5",
							type = "range",
							min = 1,
							max = 24,
							step = 0.5,
							set = function(_, value)
								db.borderThickness = value
								KT:SetBackground()
							end,
							order = 2.7,
						},
						bgrInset = {
							name = "背景內縮",
							desc = "- 預設: "..defaults.profile.bgrInset.."\n- 單位: 0.5",
							type = "range",
							min = 0,
							max = 10,
							step = 0.5,
							set = function(_, value)
								db.bgrInset = value
								KT:SetBackground()
								KT:MoveButtons()
							end,
							order = 2.8,
						},
						progressBar = {
							name = "進度條材質",
							type = "select",
							dialogControl = "LSM30_Statusbar",
							values = WidgetLists.statusbar,
							set = function(_, value)
								db.progressBar = value
								KT.forcedUpdate = true
								OTF:Update()
								-- TODO: Update
								--[[if PetTracker then
									PetTracker.Objectives:Update()
								end]]
								KT.forcedUpdate = false
							end,
							order = 2.9,
						},
					},
				},
				sec3 = {
					name = "文字",
					type = "group",
					inline = true,
					order = 3,
					args = {
						font = {
							name = "字體",
							type = "select",
							dialogControl = "LSM30_Font",
							values = WidgetLists.font,
							set = function(_, value)
								db.font = value
								KT.forcedUpdate = true
								KT:SetText()
								OTF:Update()
								-- TODO: Update
								--[[if PetTracker then
									PetTracker.Objectives:Update()
								end]]
								KT.forcedUpdate = false
							end,
							order = 3.1,
						},
						fontSize = {
							name = "文字大小",
							type = "range",
							min = 10,
							max = 20,
							step = 1,
							set = function(_, value)
								db.fontSize = value
								KT.forcedUpdate = true
								KT:SetText()
								OTF:Update()
								-- TODO: Update
								--[[if PetTracker then
									PetTracker.Objectives:Update()
								end]]
								KT.forcedUpdate = false
							end,
							order = 3.2,
						},
						fontFlag = {
							name = "文字樣式",
							type = "select",
							values = flags,
							get = function()
								for k, v in pairs(flags) do
									if db.fontFlag == k then
										return k
									end
								end
							end,
							set = function(_, value)
								db.fontFlag = value
								KT.forcedUpdate = true
								KT:SetText()
								OTF:Update()
								-- TODO: Update
								--[[if PetTracker then
									PetTracker.Objectives:Update()
								end]]
								KT.forcedUpdate = false
							end,
							order = 3.3,
						},
						fontShadow = {
							name = "文字陰影",
							desc = warning,
							type = "toggle",
							confirm = true,
							confirmText = warning,
							get = function()
								return (db.fontShadow == 1)
							end,
							set = function(_, value)
								db.fontShadow = value and 1 or 0
								ReloadUI()	-- WTF
							end,
							order = 3.4,
						},
						colorDifficulty = {
							name = "使用難度顏色",
							desc = "任務標題的顏色代表難度。",
							type = "toggle",
							set = function()
								db.colorDifficulty = not db.colorDifficulty
								OTF:Update()
								QuestMapFrame_UpdateAll()
							end,
							order = 3.5,
						},
						textWordWrap = {
							name = "文字自動換行",
							desc = "單行或兩行過長的文字使用 ... 來省略。 ",
							type = "toggle",
							set = function()
								db.textWordWrap = not db.textWordWrap
								KT.forcedUpdate = true
								OTF:Update()
								KT.forcedUpdate = false
							end,
							order = 3.6,
						},
						objNumSwitch = {
							name = "目標數字在前面",
							desc = "將目標數字移動至每行的最前方。 "..
								   cBold.."只適用於德文, 西班牙文, 法文和俄文。",
							descStyle = "inline",
							type = "toggle",
							width = 2.2,
							disabled = function()
								return not IsSpecialLocale()
							end,
							set = function()
								db.objNumSwitch = not db.objNumSwitch
								OTF:Update()
							end,
							order = 3.7,
						},
					},
				},
				sec4 = {
					name = "標題列",
					type = "group",
					inline = true,
					order = 4,
					args = {
						hdrBgrLabel = {
							name = " 材質",
							type = "description",
							width = "half",
							fontSize = "medium",
							order = 4.01,
						},
						hdrBgr = {
							name = "",
							type = "select",
							values = textures,
							get = function()
								for k, v in ipairs(textures) do
									if db.hdrBgr == k then
										return k
									end
								end
							end,
							set = function(_, value)
								db.hdrBgr = value
								KT:SetBackground()
							end,
							order = 4.011,
						},
						hdrBgrColor = {
							name = "顏色",
							desc = "設定標題列材質的顏色。",
							type = "color",
							width = "half",
							disabled = function()
								return (db.hdrBgr < 3 or db.hdrBgrColorShare)
							end,
							get = function()
								return db.hdrBgrColor.r, db.hdrBgrColor.g, db.hdrBgrColor.b
							end,
							set = function(_, r, g, b)
								db.hdrBgrColor.r = r
								db.hdrBgrColor.g = g
								db.hdrBgrColor.b = b
								KT:SetBackground()
							end,
							order = 4.012,
						},
						hdrBgrColorShare = {
							name = "使用邊框顏色",
							desc = "材質使用與邊框相同的顏色。",
							type = "toggle",
							disabled = function()
								return (db.hdrBgr < 3)
							end,
							set = function()
								db.hdrBgrColorShare = not db.hdrBgrColorShare
								KT:SetBackground()
							end,
							order = 4.013,
						},
						hdrTrackerBgrSpacer1 = {
							name = " ",
							type = "description",
							width = "half",
							order = 4.014,
						},
						hdrTrackerBgrShow = {
							name = "顯示標題列材質",
							type = "toggle",
							width = "normal+half",
							disabled = function()
								return (db.hdrBgr == 1)
							end,
							set = function()
								db.hdrTrackerBgrShow = not db.hdrTrackerBgrShow
								KT:SetBackground()
							end,
							order = 4.015,
						},
						hdrTrackerBgrSpacer2 = {
							name = " ",
							type = "description",
							width = "normal",
							order = 4.016,
						},
						hdrTxtLabel = {
							name = " 文字",
							type = "description",
							width = "half",
							fontSize = "medium",
							order = 4.02,
						},
						hdrTxtColor = {
							name = "顏色",
							desc = "設定標題列文字的顏色。",
							type = "color",
							width = "half",
							disabled = function()
								KT:SetText()
								return (db.hdrBgr == 2 or db.hdrTxtColorShare)
							end,
							get = function()
								return db.hdrTxtColor.r, db.hdrTxtColor.g, db.hdrTxtColor.b
							end,
							set = function(_, r, g, b)
								db.hdrTxtColor.r = r
								db.hdrTxtColor.g = g
								db.hdrTxtColor.b = b
								KT:SetText()
							end,
							order = 4.021,
						},
						hdrTxtColorShare = {
							name = "使用邊框顏色",
							desc = "標題列文字使用與邊框相同的顏色。",
							type = "toggle",
							disabled = function()
								return (db.hdrBgr == 2)
							end,
							set = function()
								db.hdrTxtColorShare = not db.hdrTxtColorShare
								KT:SetText()
							end,
							order = 4.022,
						},
						hdrTxtSpacer = {
							name = " ",
							type = "description",
							width = "normal",
							order = 4.023,
						},
						hdrBtnLabel = {
							name = " 按鈕",
							type = "description",
							width = "half",
							fontSize = "medium",
							order = 4.03,
						},
						hdrBtnColor = {
							name = "顏色",
							desc = "設定所有標題列按鈕的顏色。",
							type = "color",
							width = "half",
							disabled = function()
								return (db.hdrBgr == 2 or db.hdrBtnColorShare)
							end,
							get = function()
								return db.hdrBtnColor.r, db.hdrBtnColor.g, db.hdrBtnColor.b
							end,
							set = function(_, r, g, b)
								db.hdrBtnColor.r = r
								db.hdrBtnColor.g = g
								db.hdrBtnColor.b = b
								KT:SetBackground()
							end,
							order = 4.032,
						},
						hdrBtnColorShare = {
							name = "使用邊框顏色",
							desc = "所有標題列按鈕都使用與邊框相同的顏色。",
							type = "toggle",
							disabled = function()
								return (db.hdrBgr == 2)
							end,
							set = function()
								db.hdrBtnColorShare = not db.hdrBtnColorShare
								KT:SetBackground()
							end,
							order = 4.033,
						},
						hdrBtnSpacer = {
							name = " ",
							type = "description",
							width = "normal",
							order = 4.034,
						},
						sec4SpacerMid1 = {
							name = " ",
							type = "description",
							order = 4.035,
						},
						hdrQuestsTitleAppend = {
							name = "顯示任務數量",
							desc = "在任務標題中顯示任務數量。",
							type = "toggle",
							width = "normal+half",
							set = function()
								db.hdrQuestsTitleAppend = not db.hdrQuestsTitleAppend
								KT:SetQuestsHeaderText(true)
							end,
							order = 4.04,
						},
						hdrAchievsTitleAppend = {
							name = "顯示成就點數",
							desc = "在成就標題中顯示成就點數。",
							type = "toggle",
							width = "normal+half",
							set = function()
								db.hdrAchievsTitleAppend = not db.hdrAchievsTitleAppend
								KT:SetAchievsHeaderText(true)
							end,
							order = 4.05,
						},
						-- TODO: Update
						--[[hdrPetTrackerTitleAppend = {	-- Addon - PetTracker
							name = "顯示已收藏的戰寵數量",
							desc = "在戰寵助手 PetTracker 的標題中顯示已收藏的戰寵數量。",
							type = "toggle",
							width = "normal+half",
							disabled = function()
								return not KT.AddonPetTracker.isLoaded
							end,
							set = function()
								db.hdrPetTrackerTitleAppend = not db.hdrPetTrackerTitleAppend
								KT.AddonPetTracker:SetPetsHeaderText(true)
							end,
							order = 4.06,
						},]]
						sec4SpacerMid2 = {
							name = " ",
							type = "description",
							order = 4.07,
						},
						hdrCollapsedTxtLabel = {
							name = "      最小化時的摘要文字",
							type = "description",
							width = "normal",
							fontSize = "medium",
							order = 4.09,
						},
						hdrCollapsedTxt1 = {
							name = "無",
							desc = "最小化時縮短追蹤清單的寬度。",
							type = "toggle",
							width = "half",
							get = function()
								return (db.hdrCollapsedTxt == 1)
							end,
							set = function()
								db.hdrCollapsedTxt = 1
								OTF:Update()
							end,
							order = 4.091,
						},
						hdrCollapsedTxt2 = {
							name = "|T"..mediaPath.."KT_logo:22:22:2:0|t "..KT.title,
							type = "toggle",
							width = "normal",
							get = function()
								return (db.hdrCollapsedTxt == 2)
							end,
							set = function()
								db.hdrCollapsedTxt = 2
								OTF:Update()
							end,
							order = 4.092,
						},
						hdrOtherButtons = {
							name = "顯示任務日誌和成就按鈕",
							type = "toggle",
							width = "double",
							set = function()
								db.hdrOtherButtons = not db.hdrOtherButtons
								KT:SetOtherButtons()
								KT:SetBackground()
								OTF:Update()
							end,
							order = 4.10,
						},
						keyBindMinimize = {
							name = "按鍵 - 最小化按鈕",
							type = "keybinding",
							set = function(_, value)
								SetOverrideBinding(KTF, false, db.keyBindMinimize, nil)
								if value ~= "" then
									local key = GetBindingKey("EXTRAACTIONBUTTON1")
									if key == value then
										SetBinding(key)
										SaveBindings(GetCurrentBindingSet())
									end
									SetOverrideBindingClick(KTF, false, value, KTF.MinimizeButton:GetName())
								end
								db.keyBindMinimize = value
							end,
							order = 4.11,
						},
					},
				},
				sec5 = {
					name = "任務物品按鈕",
					type = "group",
					inline = true,
					order = 5,
					args = {
						qiBgrBorder = {
							name = "顯示按鈕區塊的背景和邊框",
							type = "toggle",
							width = "double",
							set = function()
								db.qiBgrBorder = not db.qiBgrBorder
								KT:SetBackground()
								KT:MoveButtons()
							end,
							order = 5.1,
						},
						qiXOffset = {
							name = "水平位置",
							type = "range",
							min = -10,
							max = 10,
							step = 1,
							set = function(_, value)
								db.qiXOffset = value
								KT:MoveButtons()
							end,
							order = 5.2,
						},
						qiActiveButton = {
							name = "啟用大型任務物品按鈕  ",
							desc = "距離最近的任務的物品按鈕顯示為 \"額外快捷鍵\"。\n"..
								   cBold.."和 額外快捷鍵1 使用相同的快捷鍵。",
							descStyle = "inline",
							width = "double",
							type = "toggle",
                            confirm = true,
                            confirmText = warning,
							set = function()
								db.qiActiveButton = not db.qiActiveButton
								if db.qiActiveButton then
									KT.ActiveButton:Enable()
								else
									KT.ActiveButton:Disable()
                                end
                                ReloadUI()
							end,
							order = 5.3,
						},
						keyBindActiveButton = {
							name = "按鍵 - 大型任務物品按鈕",
							type = "keybinding",
							disabled = function()
								return not db.qiActiveButton
							end,
							get = function()
								local key = GetBindingKey("EXTRAACTIONBUTTON1")
								return key
							end,
							set = function(_, value)
								local key = GetBindingKey("EXTRAACTIONBUTTON1")
								if key then
									SetBinding(key)
								end
								if value ~= "" then
									if db.keyBindMinimize == value then
										SetOverrideBinding(KTF, false, db.keyBindMinimize, nil)
										db.keyBindMinimize = ""
									end
									SetBinding(value, "EXTRAACTIONBUTTON1")
								end
								SaveBindings(GetCurrentBindingSet())
							end,
							order = 5.4,
						},
						qiActiveButtonBindingShow = {
							name = "顯示大型任務物品按鈕按鍵文字",
							width = "normal+half",
							type = "toggle",
							disabled = function()
								return not db.qiActiveButton
							end,
							set = function()
								db.qiActiveButtonBindingShow = not db.qiActiveButtonBindingShow
								KTF.ActiveFrame:Hide()
								KT.ActiveButton:Update()
							end,
							order = 5.5,
						},
						qiActiveButtonSpacer = {
							name = " ",
							type = "description",
							width = "half",
							order = 5.51,
						},
						qiActiveButtonUnlock = {
							name = UNLOCK,
							type = "execute",
							disabled = function()
								return not db.qiActiveButton
							end,
							func = function()
								HideUIPanel(SettingsPanel)
								KTF.ActiveFrame.overlay:Show()
								StaticPopup_Show(addonName.."_LockUI", nil, "大型任務物品按鈕已經解鎖。\n拖曳移動它，完成後按下鎖定。\n\n"..cBold.."右鍵點一下|r移動控制項\n會恢復成預設位置。")
							end,
							order = 5.6,
						},
						addonMasqueLabel = {
							name = " 外觀選項 - 用於任務物品按鈕和大型任務物品按鈕",
							type = "description",
							width = "double",
							fontSize = "medium",
							order = 5.7,
						},
						addonMasqueOptions = {
							name = "按鈕外觀 Masque",
							type = "execute",
							disabled = function()
								return (not C_AddOns.IsAddOnLoaded("Masque") or not db.addonMasque or not KT.AddonOthers:IsEnabled())
							end,
							func = function()
								SlashCmdList["MASQUE"]()
							end,
							order = 5.71,
						},
					},
				},
				sec6 = {
					name = "其他選項",
					type = "group",
					inline = true,
					order = 6,
					args = {
						trackerTitle = {
							name = cTitle.."追蹤清單",
							type = "description",
							fontSize = "medium",
							order = 6.1,
						},
						hideEmptyTracker = {
							name = "隱藏空的清單",
							type = "toggle",
							set = function()
								db.hideEmptyTracker = not db.hideEmptyTracker
								OTF:Update()
							end,
							order = 6.11,
						},
						collapseInInstance = {
							name = "副本中最小化",
							desc = "進入副本時將追蹤清單收合起來。注意: 啟用自動過濾時會展開清單。",
							type = "toggle",
							set = function()
								db.collapseInInstance = not db.collapseInInstance
							end,
							order = 6.12,
						},
						tooltipTitle = {
							name = "\n"..cTitle.."滑鼠提示",
							type = "description",
							fontSize = "medium",
							order = 6.2,
						},
						tooltipShow = {
							name = "顯示滑鼠提示",
							desc = "顯示任務/世界任務/成就/事件的滑鼠提示。",
							type = "toggle",
							set = function()
								db.tooltipShow = not db.tooltipShow
							end,
							order = 6.21,
						},
						tooltipShowRewards = {
							name = "顯示獎勵",
							desc = "在滑鼠提示內顯示任務獎勵 - 神兵之力、職業大廳資源、金錢、裝備...等。",
							type = "toggle",
							disabled = function()
								return not db.tooltipShow
							end,
							set = function()
								db.tooltipShowRewards = not db.tooltipShowRewards
							end,
							order = 6.22,
						},
						tooltipShowID = {
							name = "顯示 ID",
							desc = "在滑鼠提示內顯示任務/世界任務/成就的 ID。",
							type = "toggle",
							disabled = function()
								return not db.tooltipShow
							end,
							set = function()
								db.tooltipShowID = not db.tooltipShowID
							end,
							order = 6.23,
						},
						menuTitle = {
							name = "\n"..cTitle.."選單項目",
							type = "description",
							fontSize = "medium",
							order = 6.3,
						},
                        menuWowheadURL = {
							name = "Wowhead URL",
							desc = "在追蹤清單和任務記錄內顯示 Wowhead 網址選單項目。",
							type = "toggle",
							set = function()
								db.menuWowheadURL = not db.menuWowheadURL
							end,
							order = 6.31,
						},
                        menuWowheadURLModifier = {
							name = "Wowhead URL 輔助鍵",
							type = "select",
							values = modifiers,
							get = function()
								for k, v in pairs(modifiers) do
									if db.menuWowheadURLModifier == k then
										return k
									end
								end
							end,
							set = function(_, value)
								db.menuWowheadURLModifier = value
							end,
							order = 6.32,
						},
                        questTitle = {
                            name = cTitle.."\n 任務",
                            type = "description",
                            fontSize = "medium",
                            order = 6.4,
                        },
                        questDefaultActionMap = {
                            name = "任務預設動作 - 世界地圖",
                            desc = "將點擊任務的預設動作設為 \"世界地圖\"，停用時預設動作會是 \"任務內容\"。",
                            type = "toggle",
                            width = "normal+half",
                            set = function()
                                db.questDefaultActionMap = not db.questDefaultActionMap
                            end,
                            order = 6.41,
                        },
						questShowTags = {
							name = "顯示任務標籤",
							desc = "在任務追蹤清單中顯示/隱藏任務標籤 (任務等級、任務類型)。",
							type = "toggle",
							set = function()
								db.questShowTags = not db.questShowTags
								OTF:Update()
							end,
							order = 6.42,
						},
						questShowZones = {
							name = "顯示任務區域",
							desc = "在任務追蹤清單中顯示/隱藏任務區域。",
							type = "toggle",
							set = function()
								db.questShowZones = not db.questShowZones
								OTF:Update()
							end,
							order = 6.43,
						},
						questAutoTrack = {
							name = "自動追蹤新任務",
							desc = "接受任務時自動追蹤任務，使用遊戲內建的 \"autoQuestWatch\" 參數值。\n"..warning,
							type = "toggle",
							confirm = true,
							confirmText = warning,
							get = function()
								return GetCVarBool("autoQuestWatch")
							end,
							set = function(_, value)
								SetCVar("autoQuestWatch", value)
								ReloadUI()
							end,
							order = 6.44,
						},
						questProgressAutoTrack = {
							name = "自動追蹤任務進度",
							desc = "自動監控任務進度更新，使用遊戲內建的 \"autoQuestProgress\" 參數值。\n"..warning,
							type = "toggle",
							width = "normal+half",
							confirm = true,
							confirmText = warning,
							get = function()
								return GetCVarBool("autoQuestProgress")
							end,
							set = function(_, value)
								SetCVar("autoQuestProgress", value)
								ReloadUI()
							end,
							order = 6.45,
						},
					},
				},
				sec7 = {
					name = "通知訊息",
					type = "group",
					inline = true,
					order = 7,
					args = {
						messageQuest = {
							name = "任務訊息",
							type = "toggle",
							set = function()
								db.messageQuest = not db.messageQuest
							end,
							order = 7.1,
						},
						messageAchievement = {
							name = "成就訊息",
							width = 1.1,
							type = "toggle",
							set = function()
								db.messageAchievement = not db.messageAchievement
							end,
							order = 7.2,
						},
						-- LibSink
					},
				},
				sec8 = {
					name = "通知音效",
					type = "group",
					inline = true,
					order = 8,
					args = {
						soundQuest = {
							name = "任務音效",
							type = "toggle",
							set = function()
								db.soundQuest = not db.soundQuest
							end,
							order = 8.1,
						},
						soundQuestComplete = {
							name = "完成音效",
							desc = "插件音效的開頭為 \"KT - \"。",
							type = "select",
							width = 1.2,
							disabled = function()
								return not db.soundQuest
							end,
							dialogControl = "LSM30_Sound",
							values = WidgetLists.sound,
							set = function(_, value)
								db.soundQuestComplete = value
							end,
							order = 8.11,
						},
					},
				},
			},
		},
		modules = {
			name = "模組",
			type = "group",
			args = {
				sec1 = {
					name = "模組順序",
					type = "group",
					inline = true,
					order = 1,
				},
			},
		},
		addons = {
			name = "支援插件",
			type = "group",
			args = {
				desc = {
					name = "|cff00d200綠色|r - 相容版本 - 這個版本經過測試並且已經支援。\n"..
							"|cffff0000紅色|r - 不相容版本 - 這個版本尚未經過測試，可能需要修改程式碼。\n"..
							"請回報任何問題。",
					type = "description",
					order = 0,
				},
				sec1 = {
					name = "插件",
					type = "group",
					inline = true,
					order = 1,
					args = {
						addonMasque = {
							name = "按鈕外觀 Masque",
							desc = "版本: %s",
							descStyle = "inline",
							type = "toggle",
							width = 1.05,
							confirm = true,
							confirmText = warning,
							disabled = function()
								return (not C_AddOns.IsAddOnLoaded("Masque") or not KT.AddonOthers:IsEnabled())
							end,
							set = function()
								db.addonMasque = not db.addonMasque
								ReloadUI()
							end,
							order = 1.11,
						},
						addonMasqueDesc = {
							name = "Masque 提供更改任務物品按鈕外觀的功能。\n同時也會影響大型任務物品按鈕",
							type = "description",
							width = "double",
							order = 1.12,
						},
						addonPetTracker = {
							name = "戰寵助手 PetTracker",
							desc = "版本: %s",
							descStyle = "inline",
							type = "toggle",
							width = 1.05,
							confirm = true,
							confirmText = warning,
							disabled = function()
								-- TODO: Update
								return true
							end,
							set = function()
								-- TODO: Update
								db.addonPetTracker = false
								ReloadUI()
							end,
							order = 1.21,
						},
						addonPetTrackerDesc = {
							name = "支援在任務追蹤清單增強裡面顯示 PetTracker 的區域寵物追蹤，同時也修正了顯示上的一些問題。",
							type = "description",
							width = "double",
							order = 1.22,
						},
						addonTomTom = {
							name = "TomTom 導航箭頭",
							desc = "版本: %s",
							descStyle = "inline",
							type = "toggle",
							width = 1.05,
							confirm = true,
							confirmText = warning,
							disabled = function()
								return not C_AddOns.IsAddOnLoaded("TomTom")
							end,
							set = function()
								db.addonTomTom = not db.addonTomTom
								ReloadUI()
							end,
							order = 1.31,
						},
						addonTomTomDesc = {
							name = "TomTom 的支援性整合了暴雪的 POI 和 TomTom 的導航箭頭。",
							type = "description",
							width = "double",
							order = 1.32,
						},
					},
				},
				sec2 = {
					name = "介面套裝插件",
					type = "group",
					inline = true,
					order = 2,
					args = {
						elvui = {
							name = "ElvUI",
							type = "toggle",
							disabled = true,
							order = 2.1,
						},
						tukui = {
							name = "Tukui",
							type = "toggle",
							disabled = true,
							order = 2.2,
						},
						nibrealui = {
							name = "RealUI",
							type = "toggle",
							disabled = true,
							order = 2.3,
						},
					},
				},
			},
		},
		hacks = {
			name = "駭客工具",
			type = "group",
			args = {
				desc = {
					name = cWarning.."警告:|r 駭客工具可能會影響其他插件\n\n請回報任何未提及的負面影響。",
					type = "description",
					order = 0,
				},
				sec1 = {
					name = DUNGEONS_BUTTON,
					type = "group",
					inline = true,
					order = 1,
					args = {
						hackLFG = {
							name = "尋求組隊駭客工具",
							desc = cBold.."影響在任務追蹤清單中尋找隊伍用的小眼睛。|r"..
									"啟用駭客工具時按鈕可以正常使用，不會發生錯誤。停用時將無法使用按鈕。\n\n"..
									cWarning2.."負面影響:|r\n"..
									"- 建立預組隊伍的對話框中會隱藏 \"目標\" 項目。\n"..
									"- 預組隊伍列表中項目的滑鼠提示會隱藏第二行 (綠色) 的 \"目標\"。\n"..
									"- 建立預組隊伍的對話框不會自動設定好 \"標題\"，\n"..
									"  例如 M+ 鑰石層數。\n",
							descStyle = "inline",
							type = "toggle",
							width = "full",
							confirm = true,
							confirmText = warning,
							set = function()
								db.hackLFG = not db.hackLFG
								ReloadUI()
							end,
							order = 1.1,
						},
					},
				},
				sec2 = {
					name = WORLDMAP_BUTTON,
					type = "group",
					inline = true,
					order = 2,
					args = {
						hackWorldMap = {
							name = "世界地圖駭客工具 "..beta,
							desc = cBold.."影響世界地圖|r並且移除汙染錯誤。"..
									"這個駭客工具移除了對受限函數 SetPassThroughButtons 的呼叫。"..
									"停用駭客工具時，世界地圖顯示會導致錯誤。"..
									"由於追蹤清單與遊戲框架有很多互動，所以無法消除這些錯誤。\n\n"..
									cWarning2.."負面影響:|r 在魔獸世界 11.0.2 尚未可知。\n",
							descStyle = "inline",
							type = "toggle",
							width = "full",
							confirm = true,
							confirmText = warning,
							set = function()
								db.hackWorldMap = not db.hackWorldMap
								ReloadUI()
							end,
							order = 2.1,
						},
					},
				},
			},
		},
	},
}

local general = options.args.general.args
local modules = options.args.modules.args
local addons = options.args.addons.args
local hacks = options.args.hacks.args

function KT:CheckAddOn(addon, version, isUI)
	local name = strsplit("_", addon)
	local ver = isUI and "" or "---"
	local result = false
	local path
	if C_AddOns.IsAddOnLoaded(addon) then
		local actualVersion = C_AddOns.GetAddOnMetadata(addon, "Version") or "unknown"
		actualVersion = gsub(actualVersion, "(.*%S)%s+", "%1")
		ver = isUI and "  -  " or ""
		ver = (ver.."|cff%s"..actualVersion.."|r"):format(actualVersion == version and "00d200" or "ff0000")
		result = true
	end
	if not isUI then
		path =  addons.sec1.args["addon"..name]
		path.desc = path.desc:format(ver)
	else
		local path =  addons.sec2.args[strlower(name)]
		path.name = path.name..ver
		path.disabled = not result
		path.get = function() return result end
	end
	return result
end

function KT:OpenOptions()
	if not EditModeManagerFrame:IsEditModeActive() then
		Settings.OpenToCategory(self.optionsFrame.general.name, true)
	end
end

function KT:InitProfile(event, database, profile)
	ReloadUI()
end

function KT:SetupOptions()
	self.db = LibStub("AceDB-3.0"):New(strsub(addonName, 2).."DB", defaults, true)
	self.options = options
	db = self.db.profile
	dbChar = self.db.char

	general.sec2.args.classBorder.name = general.sec2.args.classBorder.name:format(self.RgbToHex(self.classColor))

	general.sec7.args.messageOutput = self:GetSinkAce3OptionsDataTable()
	general.sec7.args.messageOutput.inline = true
	general.sec7.args.messageOutput.disabled = function() return not (db.messageQuest or db.messageAchievement) end
	self:SetSinkStorage(db)

	options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	options.args.profiles.confirm = true
	options.args.profiles.args.reset.confirmText = warning
	options.args.profiles.args.new.confirmText = warning
	options.args.profiles.args.choose.confirmText = warning
	options.args.profiles.args.copyfrom.confirmText = warning
	if not options.args.profiles.plugins then
		options.args.profiles.plugins = {}
	end
	options.args.profiles.plugins[addonName] = {
		clearTrackerDataDesc1 = {
			name = "清空當前角色已追蹤的任務內容資料 (不包含設定)。",
			type = "description",
			order = 0.1,
		},
		clearTrackerData = {
			name = "清空清單資料",
			desc = "清空已追蹤內容的資料。",
			type = "execute",
			confirmText = "清空清單資料 - "..cBold..self.playerName,
			func = function()
				dbChar.quests.cache = {}
				for i = 1, #db.filterAuto do
					db.filterAuto[i] = nil
				end
				self:SetBackground()
				KT.QuestsCache_Init()
				OTF:Update()
			end,
			order = 0.2,
		},
		clearTrackerDataDesc2 = {
			name = "當前角色: "..cBold..self.playerName,
			type = "description",
			width = "double",
			order = 0.3,
		},
		clearTrackerDataDesc4 = {
			name = "",
			type = "description",
			order = 0.4,
		}
	}

	ACR:RegisterOptionsTable(addonName, options, nil)
	
	self.optionsFrame = {}
	self.optionsFrame.general = ACD:AddToBlizOptions(addonName, "任務-追蹤清單", nil, "general")
	self.optionsFrame.modules = ACD:AddToBlizOptions(addonName, options.args.modules.name, "任務-追蹤清單", "modules")
	self.optionsFrame.addons = ACD:AddToBlizOptions(addonName, options.args.addons.name, "任務-追蹤清單", "addons")
	self.optionsFrame.hacks = ACD:AddToBlizOptions(addonName, options.args.hacks.name, "任務-追蹤清單", "hacks")
	self.optionsFrame.profiles = ACD:AddToBlizOptions(addonName, options.args.profiles.name, "任務-追蹤清單", "profiles")

	self.db.RegisterCallback(self, "OnProfileChanged", "InitProfile")
	self.db.RegisterCallback(self, "OnProfileCopied", "InitProfile")
	self.db.RegisterCallback(self, "OnProfileReset", "InitProfile")

	-- Disable some options
	if not IsSpecialLocale() then
		db.objNumSwitch = false
	end
end

SettingsPanel:HookScript("OnHide", function(self)
	OverlayFrameHide()
end)

function OverlayFrameUpdate()
	if overlay then
		overlay:SetSize(db.width, db.maxHeight)
		overlay:ClearAllPoints()
		overlay:SetPoint(db.anchorPoint, 0, 0)
	end
end

function OverlayFrameHide()
	if overlayShown then
		overlay:Hide()
		overlayShown = false
	end
end

function GetModulesOptionsTable()
	local numModules = #db.modulesOrder
	local text
	local defaultModule, defaultText
	local numSkipped = 0
	local args = {
		descCurOrder = {
			name = cTitle.."目前順序",
			type = "description",
			width = "double",
			fontSize = "medium",
			order = 0.1,
		},
		descDefOrder = {
			name = "|T:1:20|t"..cTitle.."預設順序",
			type = "description",
			width = "normal",
			fontSize = "medium",
			order = 0.2,
		},
		descModules = {
			name = "\n * "..TRACKER_HEADER_DUNGEON.." / "..CHALLENGE_MODE.." / "..TRACKER_HEADER_SCENARIO.." / "..TRACKER_HEADER_PROVINGGROUNDS.."\n",
			type = "description",
			order = 20,
		},
	}

	for i, module in ipairs(db.modulesOrder) do
		if _G[module].Header then
			text = _G[module].Header.Text:GetText()
			if module == "KT_ScenarioObjectiveTracker" then
				text = text.." *"
			elseif module == "KT_UIWidgetObjectiveTracker" then
				text = "[ "..ZONE.." ]"
			end

			defaultModule = numSkipped == 0 and _G[KT.MODULES[i]] or _G[KT.MODULES[i - numSkipped]]
			defaultText = defaultModule.Header.Text:GetText()
			if defaultModule == KT_ScenarioObjectiveTracker then
				defaultText = defaultText.." *"
			elseif defaultModule == KT_UIWidgetObjectiveTracker then
				defaultText = "[ "..ZONE.." ]"
			end

			args["pos"..i] = {
				name = " "..text,
				type = "description",
				width = "normal",
				fontSize = "medium",
				order = i,
			}
			args["pos"..i.."up"] = {
				name = (i > 1) and "上移" or " ",
				desc = text,
				type = (i > 1) and "execute" or "description",
				width = "half",
				func = function()
					MoveModule(i, "up")
				end,
				order = i + 0.1,
			}
			args["pos"..i.."down"] = {
				name = (i < numModules) and "下移" or " ",
				desc = text,
				type = (i < numModules) and "execute" or "description",
				width = "half",
				func = function()
					MoveModule(i)
				end,
				order = i + 0.2,
			}
			args["pos"..i.."default"] = {
				name = "|T:1:24|t|cff808080"..defaultText,
				type = "description",
				width = "normal",
				fontSize = "medium",
				order = i + 0.3,
			}
		else
			numSkipped = numSkipped + 1
		end
	end
	return args
end

function MoveModule(idx, direction)
	local text = strsub(modules.sec1.args["pos"..idx].name, 2)
	local tmpIdx = (direction == "up") and idx-1 or idx+1
	local tmpText = strsub(modules.sec1.args["pos"..tmpIdx].name, 2)
	modules.sec1.args["pos"..tmpIdx].name = " "..text
	modules.sec1.args["pos"..tmpIdx.."up"].desc = text
	modules.sec1.args["pos"..tmpIdx.."down"].desc = text
	modules.sec1.args["pos"..idx].name = " "..tmpText
	modules.sec1.args["pos"..idx.."up"].desc = tmpText
	modules.sec1.args["pos"..idx.."down"].desc = tmpText

	local module = tremove(db.modulesOrder, idx)
	tinsert(db.modulesOrder, tmpIdx, module)

	OTF.modules[tmpIdx].uiOrder = idx
	OTF.modules[idx].uiOrder = tmpIdx
	OTF.needsSorting = true
	OTF:Update()
end

function SetSharedColor(color)
	local name = "使用邊框|cff"..KT.RgbToHex(color).."顏色|r"
	local sec4 = general.sec4.args
	sec4.hdrBgrColorShare.name = name
	sec4.hdrTxtColorShare.name = name
	sec4.hdrBtnColorShare.name = name
end

function IsSpecialLocale()
	return (KT.locale == "deDE" or
			KT.locale == "esES" or
			KT.locale == "frFR" or
			KT.locale == "ruRU")
end

function UpdateOptions(updateValues)
	local options = options.args.general.args.sec1.args
	local screenWidth = round(GetScreenWidth())
	local screenHeight = round(GetScreenHeight())
	local xOffsetMax = screenWidth - db.width
	local yOffsetMax = screenHeight - options.maxHeight.min
	local anchorLeft = (db.anchorPoint == "TOPLEFT" or db.anchorPoint == "BOTTOMLEFT")
	local directionUp = (db.anchorPoint == "BOTTOMLEFT" or db.anchorPoint == "BOTTOMRIGHT")

	if anchorLeft then
		options.xOffset.min = 0
		options.xOffset.max = xOffsetMax
	else
		options.xOffset.min = xOffsetMax * -1
		options.xOffset.max = 0
	end

	if directionUp then
		options.yOffset.min = 0
		options.yOffset.max = yOffsetMax
	else
		options.yOffset.min = yOffsetMax * -1
		options.yOffset.max = 0
	end

	options.maxHeight.max = screenHeight - abs(db.yOffset)

	if updateValues then
		if abs(db.yOffset) + db.maxHeight > screenHeight then
			db.maxHeight = options.maxHeight.max
		end
	end
end

local function SetAlert(type)
	if not type then return end

	if type == "trackedQuests" then
		local trackedQuests = GetCVar("trackedQuests")
		if trackedQuests ~= "" and trackedQuests ~= "v11" then
			local character = UnitName("player")
			local realm = GetRealmName()
			general.alert = {
				name = "Alert - Automatically tracked quests",
				type = "group",
				inline = true,
				order = 0.1,
				args = {
					alertIcon = {
						name = "|T"..STATICPOPUP_TEXTURE_ALERT..":36:36:8:-2|t",
						type = "description",
						width = 0.2,
						order = 1.1,
					},
					alertText = {
						name = "You are probably having problem with automatically tracked quests after every Login or Reload UI, try the following steps to fix it.",
						type = "description",
						width = 2.8,
						fontSize = "medium",
						order = 1.2,
					},
					alertSpacer = {
						name = " ",
						type = "description",
						width = 0.2,
						order = 2.1,
					},
					alertText2 = {
						name = "- Go to the directory:  ...\\World of Warcraft\\_retail_\\WTF\\Account\\...ACCOUNT...\\"..realm.."\\"..character.."\n"..
								"- Open the file:  "..cBold.."config-cache.wtf|r\n"..
								"- Search for the string:  "..cBold.."SET trackedQuests \""..trackedQuests.."\"|r\n"..
								"- Change it to:  "..cBold.."SET trackedQuests \"v11\"|r\n"..
								"- Restart WoW",
						type = "description",
						width = 2.8,
						order = 2.2,
					},
				},
			}
		end
	end
end

-- Init
KT:RegEvent("PLAYER_ENTERING_WORLD", function(eventID)
	SetAlert("trackedQuests")
	modules.sec1.args = GetModulesOptionsTable()
	UpdateOptions()
	KT:RegEvent("UI_SCALE_CHANGED", function()
		UpdateOptions()
	end)
	KT:UnregEvent(eventID)
end)

hooksecurefunc(UIParent, "SetScale", function(self)
	UpdateOptions()
end)