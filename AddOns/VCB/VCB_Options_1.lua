-- taking care of the panel --
vcbOptions1.TopTxt:SetText("玩家施法條選項!")
-- naming the boxes --
vcbOptions1Box1.TitleTxt:SetText("法術圖示 & 法術名稱")
vcbOptions1Box2.TitleTxt:SetText("目前施法時間")
vcbOptions1Box3.TitleTxt:SetText("目前 & 總共施法時間")
vcbOptions1Box4.TitleTxt:SetText("總共施法時間")
vcbOptions1Box5.TitleTxt:SetText("延遲標示 & 施法條顏色")
vcbOptions1Box6.TitleTxt:SetText("施法斷點")
-- positioning the boxes --
for i = 2, 6, 1 do
	_G["vcbOptions1Box"..i]:SetPoint("TOP", _G["vcbOptions1Box"..i-1], "BOTTOM", 0, 0)
end
-- Checking the Saved Variables --
local function CheckSavedVariables()
	vcbOptions1Box1PopOut1:SetText(VCBrPlayer["Icon"])
	vcbOptions1Box1PopOut2:SetText(VCBrPlayer["NameText"])
	vcbOptions1Box2PopOut1:SetText(VCBrPlayer["CurrentTimeText"]["Position"])
	vcbOptions1Box2PopOut2:SetText(VCBrPlayer["CurrentTimeText"]["Direction"])
	vcbOptions1Box2PopOut3:SetText(VCBrPlayer["CurrentTimeText"]["Sec"])
	vcbOptions1Box3PopOut1:SetText(VCBrPlayer["BothTimeText"]["Position"])
	vcbOptions1Box3PopOut2:SetText(VCBrPlayer["BothTimeText"]["Direction"])
	vcbOptions1Box3PopOut3:SetText(VCBrPlayer["BothTimeText"]["Sec"])
	vcbOptions1Box4PopOut1:SetText(VCBrPlayer["TotalTimeText"]["Position"])
	vcbOptions1Box4PopOut2:SetText(VCBrPlayer["TotalTimeText"]["Sec"])
	vcbOptions1Box5PopOut1:SetText(VCBrPlayer["LagBar"])
	vcbOptions1Box5PopOut2:SetText(VCBrPlayer["Color"])
	vcbOptions1Box6PopOut1:SetText(VCBrPlayer["Ticks"])
end
-- Box 1 Spell's Icon and Spell's Name --
-- pop out 1 Spell's Icon --
-- enter --
vcbOptions1Box1PopOut1:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("法術圖示要顯示在哪裡?") 
end)
-- leave --
vcbOptions1Box1PopOut1:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box1PopOut1, vcbOptions1Box1PopOut1Choice0)
-- sort & clicking --
for i = 1, 3, 1 do
	local k = i - 1
	_G["vcbOptions1Box1PopOut1Choice"..i]:SetParent(vcbOptions1Box1PopOut1Choice0)
	_G["vcbOptions1Box1PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box1PopOut1Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box1PopOut1Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBrPlayer["Icon"] = self.Text:GetText()
			vcbOptions1Box1PopOut1.Text:SetText(self:GetText())
			vcbOptions1Box1PopOut1Choice0:Hide()
		end
	end)
end
vcbOptions1Box1PopOut1Choice3:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["Icon"] = self.Text:GetText()
		vcbOptions1Box1PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box1PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box1PopOut1Choice0.Text:SetText("左")
vcbOptions1Box1PopOut1Choice1.Text:SetText("右")
vcbOptions1Box1PopOut1Choice2.Text:SetText("左和右")
vcbOptions1Box1PopOut1Choice3.Text:SetText("隱藏")
-- pop out 2 Spell's Name --
-- enter --
vcbOptions1Box1PopOut2:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("法術名稱要顯示在哪裡?") 
end)
-- leave --
vcbOptions1Box1PopOut2:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box1PopOut2, vcbOptions1Box1PopOut2Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["vcbOptions1Box1PopOut2Choice"..i]:SetParent(vcbOptions1Box1PopOut2Choice0)
	_G["vcbOptions1Box1PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box1PopOut2Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box1PopOut2Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBrPlayer["NameText"] = self.Text:GetText()
			vcbOptions1Box1PopOut2.Text:SetText(self:GetText())
			vcbOptions1Box1PopOut2Choice0:Hide()
		end
	end)
end
vcbOptions1Box1PopOut2Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["NameText"] = self.Text:GetText()
		vcbOptions1Box1PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box1PopOut2Choice0:Hide()
	end
end)
-- Box 2 Current Cast Time --
-- pop out 1 Current Cast Time --
-- enter --
vcbOptions1Box2PopOut1:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("當前施法時間要顯示在哪裡?") 
end)
-- leave --
vcbOptions1Box2PopOut1:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box2PopOut1, vcbOptions1Box2PopOut1Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["vcbOptions1Box2PopOut1Choice"..i]:SetParent(vcbOptions1Box2PopOut1Choice0)
	_G["vcbOptions1Box2PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box2PopOut1Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box2PopOut1Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBrPlayer["CurrentTimeText"]["Position"] = self.Text:GetText()
			vcbOptions1Box2PopOut1.Text:SetText(self:GetText())
			vcbOptions1Box2PopOut1Choice0:Hide()
		end
	end)
end
vcbOptions1Box2PopOut1Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["CurrentTimeText"]["Position"] = self.Text:GetText()
		vcbOptions1Box2PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box2PopOut1Choice0:Hide()
	end
end)
-- pop out 2 Current Cast Time Direction --
-- enter --
vcbOptions1Box2PopOut2:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("如何顯示時間?|n兩者表示時間在施法時為正數，在引導時為倒數!") 
end)
-- leave --
vcbOptions1Box2PopOut2:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box2PopOut2, vcbOptions1Box2PopOut2Choice0)
-- sort & clicking --
for i = 1, 2, 1 do
	local k = i - 1
	_G["vcbOptions1Box2PopOut2Choice"..i]:SetParent(vcbOptions1Box2PopOut2Choice0)
	_G["vcbOptions1Box2PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box2PopOut2Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box2PopOut2Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBrPlayer["CurrentTimeText"]["Direction"] = self.Text:GetText()
			vcbOptions1Box2PopOut2.Text:SetText(self:GetText())
			vcbOptions1Box2PopOut2Choice0:Hide()
		end
	end)
end
vcbOptions1Box2PopOut2Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["CurrentTimeText"]["Direction"] = self.Text:GetText()
		vcbOptions1Box2PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box2PopOut2Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box2PopOut2Choice0.Text:SetText("正數")
vcbOptions1Box2PopOut2Choice1.Text:SetText("倒數")
vcbOptions1Box2PopOut2Choice2.Text:SetText("兩者")
--  pop out 3 Current Cast Time Sec? --
-- enter --
vcbOptions1Box2PopOut3:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("是否要顯示 '秒' 這個字?") 
end)
-- leave --
vcbOptions1Box2PopOut3:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box2PopOut3, vcbOptions1Box2PopOut3Choice0)
-- sort & clicking --
vcbOptions1Box2PopOut3Choice1:SetParent(vcbOptions1Box2PopOut3Choice0)
vcbOptions1Box2PopOut3Choice1:SetPoint("TOP",vcbOptions1Box2PopOut3Choice0, "BOTTOM", 0, 0)
vcbOptions1Box2PopOut3Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["CurrentTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box2PopOut3.Text:SetText(self:GetText())
		vcbOptions1Box2PopOut3Choice0:Hide()
	end
end)
vcbOptions1Box2PopOut3Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["CurrentTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box2PopOut3.Text:SetText(self:GetText())
		vcbOptions1Box2PopOut3Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box2PopOut3Choice0.Text:SetText("顯示")
vcbOptions1Box2PopOut3Choice1.Text:SetText("隱藏")
-- Box 3 Current & Total Cast Time --
-- pop out 1 Current & Total Cast Time --
-- enter --
vcbOptions1Box3PopOut1:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("目前/總共時間要顯示在哪裡?") 
end)
-- leave --
vcbOptions1Box3PopOut1:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box3PopOut1, vcbOptions1Box3PopOut1Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["vcbOptions1Box3PopOut1Choice"..i]:SetParent(vcbOptions1Box3PopOut1Choice0)
	_G["vcbOptions1Box3PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box3PopOut1Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box3PopOut1Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBrPlayer["BothTimeText"]["Position"] = self.Text:GetText()
			vcbOptions1Box3PopOut1.Text:SetText(self:GetText())
			vcbOptions1Box3PopOut1Choice0:Hide()
		end
	end)
end
vcbOptions1Box3PopOut1Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["BothTimeText"]["Position"] = self.Text:GetText()
		vcbOptions1Box3PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box3PopOut1Choice0:Hide()
	end
end)
-- pop out 2 Current & Total Cast Time Direction --
-- enter --
vcbOptions1Box3PopOut2:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("如何顯示時間?|n兩者表示時間在施法時為正數，在引導時為倒數!") 
end)
-- leave --
vcbOptions1Box3PopOut2:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box3PopOut2, vcbOptions1Box3PopOut2Choice0)
-- sort & clicking --
for i = 1, 2, 1 do
	local k = i - 1
	_G["vcbOptions1Box3PopOut2Choice"..i]:SetParent(vcbOptions1Box3PopOut2Choice0)
	_G["vcbOptions1Box3PopOut2Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box3PopOut2Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box3PopOut2Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBrPlayer["BothTimeText"]["Direction"] = self.Text:GetText()
			vcbOptions1Box3PopOut2.Text:SetText(self:GetText())
			vcbOptions1Box3PopOut2Choice0:Hide()
		end
	end)
end
vcbOptions1Box3PopOut2Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["BothTimeText"]["Direction"] = self.Text:GetText()
		vcbOptions1Box3PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box3PopOut2Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box3PopOut2Choice0.Text:SetText("正數")
vcbOptions1Box3PopOut2Choice1.Text:SetText("倒數")
vcbOptions1Box3PopOut2Choice2.Text:SetText("兩者")
-- pop out 3 Current & Total Cast Time Sec? --
-- enter --
vcbOptions1Box3PopOut3:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("是否要顯示 '秒' 這個字?") 
end)
-- leave --
vcbOptions1Box3PopOut3:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box3PopOut3, vcbOptions1Box3PopOut3Choice0)
-- sort & clicking --
vcbOptions1Box3PopOut3Choice1:SetParent(vcbOptions1Box3PopOut3Choice0)
vcbOptions1Box3PopOut3Choice1:SetPoint("TOP",vcbOptions1Box3PopOut3Choice0, "BOTTOM", 0, 0)
vcbOptions1Box3PopOut3Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["BothTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box3PopOut3.Text:SetText(self:GetText())
		vcbOptions1Box3PopOut3Choice0:Hide()
	end
end)
vcbOptions1Box3PopOut3Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["BothTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box3PopOut3.Text:SetText(self:GetText())
		vcbOptions1Box3PopOut3Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box3PopOut3Choice0.Text:SetText("顯示")
vcbOptions1Box3PopOut3Choice1.Text:SetText("隱藏")
-- Box 4 Total Cast Time --
-- pop out 1 Total Cast Time --
-- enter --
vcbOptions1Box4PopOut1:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("總共施法時間要顯示在哪裡?") 
end)
-- leave --
vcbOptions1Box4PopOut1:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box4PopOut1, vcbOptions1Box4PopOut1Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["vcbOptions1Box4PopOut1Choice"..i]:SetParent(vcbOptions1Box4PopOut1Choice0)
	_G["vcbOptions1Box4PopOut1Choice"..i]:SetPoint("TOP", _G["vcbOptions1Box4PopOut1Choice"..k], "BOTTOM", 0, 0)
	_G["vcbOptions1Box4PopOut1Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			VCBrPlayer["TotalTimeText"]["Position"] = self.Text:GetText()
			vcbOptions1Box4PopOut1.Text:SetText(self:GetText())
			vcbOptions1Box4PopOut1Choice0:Hide()
		end
	end)
end
vcbOptions1Box4PopOut1Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["TotalTimeText"]["Position"] = self.Text:GetText()
		vcbOptions1Box4PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box4PopOut1Choice0:Hide()
	end
end)
-- pop out 2 Total Cast Time Sec? --
-- enter --
vcbOptions1Box4PopOut2:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("是否要顯示 '秒' 這個字?") 
end)
-- leave --
vcbOptions1Box4PopOut2:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box4PopOut2, vcbOptions1Box4PopOut2Choice0)
-- sort & clicking --
vcbOptions1Box4PopOut2Choice1:SetParent(vcbOptions1Box4PopOut2Choice0)
vcbOptions1Box4PopOut2Choice1:SetPoint("TOP",vcbOptions1Box4PopOut2Choice0, "BOTTOM", 0, 0)
vcbOptions1Box4PopOut2Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["TotalTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box4PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box4PopOut2Choice0:Hide()
	end
end)
vcbOptions1Box4PopOut2Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["TotalTimeText"]["Sec"] = self.Text:GetText()
		vcbOptions1Box4PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box4PopOut2Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box4PopOut2Choice0.Text:SetText("顯示")
vcbOptions1Box4PopOut2Choice1.Text:SetText("隱藏")
-- Box 4 Lag Bar & Castbar's Color --
-- pop out 1 Lag Bar --
-- enter --
vcbOptions1Box5PopOut1:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("是否要顯示延遲標示?") 
end)
-- leave --
vcbOptions1Box5PopOut1:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box5PopOut1, vcbOptions1Box5PopOut1Choice0)
-- sort & clicking --
vcbOptions1Box5PopOut1Choice1:SetParent(vcbOptions1Box5PopOut1Choice0)
vcbOptions1Box5PopOut1Choice1:SetPoint("TOP",vcbOptions1Box5PopOut1Choice0, "BOTTOM", 0, 0)
vcbOptions1Box5PopOut1Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["LagBar"] = self.Text:GetText()
		vcbOptions1Box5PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box5PopOut1Choice0:Hide()
	end
end)
vcbOptions1Box5PopOut1Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["LagBar"] = self.Text:GetText()
		vcbOptions1Box5PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box5PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box5PopOut1Choice0.Text:SetText("顯示")
vcbOptions1Box5PopOut1Choice1.Text:SetText("隱藏")
-- pop out 2 Castbar's Color --
-- enter --
vcbOptions1Box5PopOut2:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("施法條要顯示什麼顏色?") 
end)
-- leave --
vcbOptions1Box5PopOut2:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box5PopOut2, vcbOptions1Box5PopOut2Choice0)
-- sort & clicking --
vcbOptions1Box5PopOut2Choice1:SetParent(vcbOptions1Box5PopOut2Choice0)
vcbOptions1Box5PopOut2Choice1:SetPoint("TOP",vcbOptions1Box5PopOut2Choice0, "BOTTOM", 0, 0)
vcbOptions1Box5PopOut2Choice2:SetParent(vcbOptions1Box5PopOut2Choice0)
vcbOptions1Box5PopOut2Choice2:SetPoint("TOP",vcbOptions1Box5PopOut2Choice1, "BOTTOM", 0, 0)
vcbOptions1Box5PopOut2Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["Color"] = self.Text:GetText()
		vcbOptions1Box5PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box5PopOut2Choice0:Hide()
	end
end)
vcbOptions1Box5PopOut2Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["Color"] = self.Text:GetText()
		vcbOptions1Box5PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box5PopOut2Choice0:Hide()
	end
end)
vcbOptions1Box5PopOut2Choice2:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["Color"] = self.Text:GetText()
		vcbOptions1Box5PopOut2.Text:SetText(self:GetText())
		vcbOptions1Box5PopOut2Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box5PopOut2Choice0.Text:SetText("預設顏色")
vcbOptions1Box5PopOut2Choice1.Text:SetText("職業顏色")
vcbOptions1Box5PopOut2Choice2.Text:SetText("法術類型顏色")
-- Box 6 Ticks of the Spells --
-- pop out 1 Ticks of the Spells --
-- enter --
vcbOptions1Box6PopOut1:SetScript("OnEnter", function(self)
	vcbEnteringMenus(self)
	GameTooltip:SetText("是否要顯示施法斷點?") 
end)
-- leave --
vcbOptions1Box6PopOut1:SetScript("OnLeave", vcbLeavingMenus)
-- drop down --
vcbClickPopOut(vcbOptions1Box6PopOut1, vcbOptions1Box6PopOut1Choice0)
-- sort & clicking --
vcbOptions1Box6PopOut1Choice1:SetParent(vcbOptions1Box6PopOut1Choice0)
vcbOptions1Box6PopOut1Choice1:SetPoint("TOP",vcbOptions1Box6PopOut1Choice0, "BOTTOM", 0, 0)
vcbOptions1Box6PopOut1Choice0:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["Ticks"] = self.Text:GetText()
		vcbOptions1Box6PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box6PopOut1Choice0:Hide()
	end
end)
vcbOptions1Box6PopOut1Choice1:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		VCBrPlayer["Ticks"] = self.Text:GetText()
		vcbOptions1Box6PopOut1.Text:SetText(self:GetText())
		vcbOptions1Box6PopOut1Choice0:Hide()
	end
end)
-- naming --
vcbOptions1Box6PopOut1Choice0.Text:SetText("顯示")
vcbOptions1Box6PopOut1Choice1.Text:SetText("隱藏")
-- naming button choices for spell's name, current cast time, current & total time, and total time --
for i = 1, 4, 1 do
	if i == 1 then
		_G["vcbOptions1Box"..i.."PopOut2Choice0"].Text:SetText("左上")
		_G["vcbOptions1Box"..i.."PopOut2Choice1"].Text:SetText("左")
		_G["vcbOptions1Box"..i.."PopOut2Choice2"].Text:SetText("左下")
		_G["vcbOptions1Box"..i.."PopOut2Choice3"].Text:SetText("上")
		_G["vcbOptions1Box"..i.."PopOut2Choice4"].Text:SetText("中")
		_G["vcbOptions1Box"..i.."PopOut2Choice5"].Text:SetText("下")
		_G["vcbOptions1Box"..i.."PopOut2Choice6"].Text:SetText("右上")
		_G["vcbOptions1Box"..i.."PopOut2Choice7"].Text:SetText("右")
		_G["vcbOptions1Box"..i.."PopOut2Choice8"].Text:SetText("右下")
		_G["vcbOptions1Box"..i.."PopOut2Choice9"].Text:SetText("隱藏")
	else
		_G["vcbOptions1Box"..i.."PopOut1Choice0"].Text:SetText("左上")
		_G["vcbOptions1Box"..i.."PopOut1Choice1"].Text:SetText("左")
		_G["vcbOptions1Box"..i.."PopOut1Choice2"].Text:SetText("左下")
		_G["vcbOptions1Box"..i.."PopOut1Choice3"].Text:SetText("上")
		_G["vcbOptions1Box"..i.."PopOut1Choice4"].Text:SetText("中")
		_G["vcbOptions1Box"..i.."PopOut1Choice5"].Text:SetText("下")
		_G["vcbOptions1Box"..i.."PopOut1Choice6"].Text:SetText("右上")
		_G["vcbOptions1Box"..i.."PopOut1Choice7"].Text:SetText("右")
		_G["vcbOptions1Box"..i.."PopOut1Choice8"].Text:SetText("右下")
		_G["vcbOptions1Box"..i.."PopOut1Choice9"].Text:SetText("隱藏")
	end
end
-- Showing the panel --
vcbOptions1:HookScript("OnShow", function(self)
	CheckSavedVariables()
	if vcbOptions2:IsShown() then vcbOptions2:Hide() end
	if vcbOptions3:IsShown() then vcbOptions3:Hide() end
	if vcbOptions4:IsShown() then vcbOptions4:Hide() end
	vcbOptions00Tab1.Text:SetTextColor(vcbHighColor:GetRGB())
	vcbOptions00Tab2.Text:SetTextColor(vcbDeafultColor:GetRGB())
	vcbOptions00Tab3.Text:SetTextColor(vcbDeafultColor:GetRGB())
	vcbOptions00Tab4.Text:SetTextColor(vcbDeafultColor:GetRGB())
end)
