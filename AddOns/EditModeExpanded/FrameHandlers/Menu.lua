local addonName, addon = ...

local lib = LibStub:GetLibrary("EditModeExpanded-1.0")

function addon:initMenuBar()
    local db = addon.db.global
    if db.EMEOptions.menu then
        lib:RegisterHideable(MicroMenuContainer)
        lib:RegisterToggleInCombat(MicroMenuContainer)
        C_Timer.After(1, function()
            if lib:IsFrameMarkedHidden(MicroMenuContainer) then
                MicroMenuContainer:Hide()
            end
        end)
        local enabled = false
        local padding
        lib:RegisterCustomCheckbox(MicroMenuContainer, "Set padding to zero",
            function()
                enabled = true
                for key, button in ipairs(MicroMenu:GetLayoutChildren()) do
                    if key ~= 1 then
                        local a, b, c, d, e = button:GetPoint(1)
                        if (key == 2) and (not padding) then
                            padding = d
                        end
                        button:ClearAllPoints()
                        button:SetPoint(a, b, c, d-(3*(key-1)), e)
                    end
                end
                MicroMenu:SetWidth(MicroMenu:GetWidth() - 30)
                MicroMenuContainer:SetWidth(MicroMenu:GetWidth()*MicroMenu:GetScale())
            end,
            
            function(init)
                if not init then
                    enabled = false
                    for key, button in ipairs(MicroMenu:GetLayoutChildren()) do
                        if key ~= 1 then
                            local a, b, c, d, e = button:GetPoint(1)
                            button:ClearAllPoints()
                            button:SetPoint(a, b, c, d+(3*(key-1)), e)
                        end
                    end
                    MicroMenu:SetWidth(MicroMenu:GetWidth() + 30)
                    MicroMenuContainer:SetWidth(MicroMenu:GetWidth()*MicroMenu:GetScale())
                end
            end
        )
        
        hooksecurefunc(MicroMenuContainer, "Layout", function(...)
            if OverrideActionBar.isShown then return end
            if PetBattleFrame and PetBattleFrame:IsShown() then return end

            if enabled and padding and ((math.floor((select(4, MicroMenu:GetLayoutChildren()[2]:GetPoint(1))*100) + 0.5)/100) == (math.floor((padding*100) + 0.5)/100)) then
                for key, button in ipairs(MicroMenu:GetLayoutChildren()) do
                    if key ~= 1 then
                        local a, b, c, d, e = button:GetPoint(1)
                        button:ClearAllPoints()
                        button:SetPoint(a, b, c, d-(3*(key-1)), e)
                    end
                end
                MicroMenu:SetWidth(MicroMenu:GetWidth() - 30)
            end
        end)
        
        lib:RegisterCustomCheckbox(MicroMenuContainer, "Use 10.0 style buttons (requires reload)", addon.EnableSkinMicroMenuBW, addon.DisableSkinMicroMenuBW, "10.0Style")
        lib:RegisterCustomCheckbox(MicroMenuContainer, "Use Shadowlands style buttons (requires reload)", addon.EnableSkinMicroMenuSL, addon.DisableSkinMicroMenuSL, "SLStyle")
    end
    
    if db.EMEOptions.bags then
        lib:RegisterHideable(BagsBar)
        lib:RegisterToggleInCombat(BagsBar)
        C_Timer.After(1, function()
            if lib:IsFrameMarkedHidden(BagsBar) then
                BagsBar:Hide()
            end
        end)
        
        do
            local alreadyInit, noInfinite
            ContainerFrame1:HookScript("OnShow", function()
                if alreadyInit then return end
                alreadyInit = true
                addon:continueAfterCombatEnds(function()
                    ContainerFrame1:SetUserPlaced(false)
                    lib:RegisterFrame(ContainerFrame1, "Main Bag", db.ContainerFrame1)
                    hooksecurefunc("UpdateContainerFrameAnchors", function()
                        if noInfinite then return end
                        if InCombatLockdown() then return end
                        noInfinite = true
                        lib:RepositionFrame(ContainerFrame1)
                        ContainerFrame1:SetUserPlaced(false)
                        noInfinite = false
                    end)
                end)
            end)
        end
        
        do
            local alreadyInit, noInfinite
            ContainerFrameCombinedBags:HookScript("OnShow", function()
                if alreadyInit then return end
                alreadyInit = true
                addon:continueAfterCombatEnds(function()
                    lib:RegisterFrame(ContainerFrameCombinedBags, "Combined Bags", db.ContainerFrameCombinedBags)
                    hooksecurefunc("UpdateContainerFrameAnchors", function()
                        if noInfinite then return end
                        if InCombatLockdown() then return end
                        noInfinite = true
                        lib:RepositionFrame(ContainerFrameCombinedBags)
                        noInfinite = false
                    end)
                end)
            end)
        end
    end
end
