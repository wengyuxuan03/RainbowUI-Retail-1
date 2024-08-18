--------------------------------------- 聊天框的簡化(支持上下箭頭選取历史)-- Author:M-------------------------------------local chatHistory = {}local function AddHistoryLine(self, text)    if (not text or text == "") then return end    local type = self:GetAttribute("chatType")    if (type == "WHISPER") then        text = text:gsub("^/%w+%s*%S+%s*", "")    elseif (string.find(text, "^/script")) then    else        text = text:gsub("^/%w+%s*", "")    end    if (text == "") then return end    for i, v in ipairs(chatHistory[self]) do        if (v == text) then            table.remove(chatHistory[self], i)            break        end    end    table.insert(chatHistory[self], 1, text)endlocal function GetHistoryLine(self, keyPress)	if not TinyChatDB or TinyChatDB.HistoryNeedAlt then return end -- 上下鍵選擇是否需要按住 Alt    local increment    if (keyPress == "UP") then        increment = 1    elseif (keyPress == "DOWN") then        increment = -1    else        return    end    chatHistory[self].index = chatHistory[self].index + increment    local text = chatHistory[self][chatHistory[self].index]    if (text) then        self:SetText(text)		self:SetCursorPosition(strlen(text))    else        chatHistory[self].index = chatHistory[self].index - increment    endendlocal function ResetHistoryIndex(self)    chatHistory[self].index = 0endlocal EDIT_BOX_TEXTURES = {	"Left",	"Mid",	"Right",	"FocusLeft",	"FocusMid",	"FocusRight",}local function simplify(self)    if not self or self.hasSimplified then return end    local name = self:GetName()    self.hasSimplified = true    self:SetClampRectInsets(0, 0, 0, 0)    self:SetResizeBounds(100, 50, UIParent:GetWidth(), UIParent:GetHeight()) -- 10.0 fix    	if not C_AddOns.IsAddOnLoaded("InputInput") then -- InputInput 相容性修正，一起使用時不更改輸入框		local editbox = _G[name.."EditBox"]				if not C_AddOns.IsAddOnLoaded("ls_Glass") then -- ls_Glass 相容性修正，一起使用時不更改輸入框背景			local bg = editbox:CreateTexture(nil, "BACKGROUND")			bg:SetColorTexture( 0, 0, 0, 0.7)			bg:SetAllPoints()						for _, texture in next, EDIT_BOX_TEXTURES do				_G[editbox:GetName() .. texture]:SetTexture(0)			end		end				editbox:SetAltArrowKeyMode(false)		chatHistory[editbox] = { index = 0 }		editbox:HookScript("OnEditFocusLost", ResetHistoryIndex)		editbox:HookScript("OnArrowPressed", GetHistoryLine)		hooksecurefunc(editbox, "AddHistoryLine", AddHistoryLine)	end        local chatTab = _G[name.."Tab"]    local tabFont = chatTab:GetFontString()    tabFont:SetFont(tabFont:GetFont(), 12, "NORMAL")    chatTab:HookScript("OnEnter", function(self)    --    UIFrameFadeIn(GeneralDockManager, 1, GeneralDockManager:GetAlpha(), 1)    end)    chatTab:HookScript("OnLeave", function(self)    --    UIFrameFadeOut(GeneralDockManager, 2, GeneralDockManager:GetAlpha(), 0)    end)enddo		--所有聊天框簡化一下		for i = 1, NUM_CHAT_WINDOWS do			simplify(_G["ChatFrame"..i])		end				if (BN_TOAST_LEFT_OFFSET) then			BN_TOAST_LEFT_OFFSET = BN_TOAST_LEFT_OFFSET + 50			BN_TOAST_TOP_OFFSET = BN_TOAST_TOP_OFFSET + 32		end				--快速滾動 ctrl首尾 shift跳3行		hooksecurefunc("FloatingChatFrame_OnMouseScroll", function(self, delta)			if (delta > 0) then				if IsControlKeyDown() then self:ScrollToTop()				elseif IsShiftKeyDown() then self:ScrollUp() self:ScrollUp() end			else				if IsControlKeyDown() then self:ScrollToBottom()				elseif IsShiftKeyDown() then self:ScrollDown() self:ScrollDown() end			end		end)    --动态创建的聊天框也要处理,並且讓密語窗口支持雙擊回復    hooksecurefunc("FCF_SetTemporaryWindowType", function(chatFrame, chatType, chatTarget)        simplify(chatFrame)        chatFrame:ScrollToBottom()        _G[chatFrame:GetName().."Tab"]:SetScript("OnDoubleClick", function(self)            if (chatType == "WHISPER" or chatType == "BN_WHISPER") then                local editBox = ChatEdit_ChooseBoxForSend()                editBox:SetAttribute("chatType", chatType)                editBox:SetAttribute("tellTarget", chatTarget)                ChatEdit_ActivateChat(editBox)                editBox:SetText(editBox:GetText())            end        end)    end)end