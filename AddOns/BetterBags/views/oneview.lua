---@diagnostic disable: duplicate-set-field,duplicate-doc-field
local addonName = ... ---@type string

---@class BetterBags: AceAddon
local addon = LibStub('AceAddon-3.0'):GetAddon(addonName)

---@class Constants: AceModule
local const = addon:GetModule('Constants')

---@class Database: AceModule
local database = addon:GetModule('Database')

---@class ItemFrame: AceModule
local itemFrame = addon:GetModule('ItemFrame')

---@class Items: AceModule
local items = addon:GetModule('Items')

---@class Sort: AceModule
local sort = addon:GetModule('Sort')

---@class GridFrame: AceModule
local grid = addon:GetModule('Grid')

---@class Debug : AceModule
local debug = addon:GetModule('Debug')

---@class Views: AceModule
local views = addon:GetModule('Views')

---@param view View
local function Wipe(view)
  view.content:Wipe()
  if view.freeSlot ~= nil then
    view.freeSlot:Release()
    view.freeSlot = nil
  end
  if view.freeReagentSlot ~= nil then
    view.freeReagentSlot:Release()
    view.freeReagentSlot = nil
  end
  for _, item in pairs(view.itemsByBagAndSlot) do
    item:Release()
  end
  wipe(view.itemsByBagAndSlot)
end

-- ClearButton clears a button and makes it empty while preserving the slot,
-- but does not release it, while also adding it to the deferred items list.
---@param view View
---@param item ItemData
local function ClearButton(view, item)
  debug:Log("ClearButton", "Clearing button for item", item.slotkey)
  local cell = view.itemsByBagAndSlot[item.slotkey]
  local bagid, slotid = view:ParseSlotKey(item.slotkey)
  cell:SetFreeSlots(bagid, slotid, -1, "Recently Deleted")
  view:AddDeferredItem(item.slotkey)
  addon:GetBagFromBagID(bagid).drawOnClose = true
end

-- CreateButton creates a button for an item and adds it to the view.
---@param view View
---@param item ItemData
local function CreateButton(view, item)
  debug:Log("CreateButton", "Creating button for item", item.slotkey)
  view:RemoveDeferredItem(item.slotkey)
  local itemButton = view:GetOrCreateItemButton(item.slotkey)
  itemButton:SetItem(item.slotkey)
  view.content:AddCell(item.slotkey, itemButton)
end

---@param view View
---@param slotkey string
local function UpdateButton(view, slotkey)
  debug:Log("UpdateButton", "Updating button for item", slotkey)
  view:RemoveDeferredItem(slotkey)
  local itemButton = view:GetOrCreateItemButton(slotkey)
  itemButton:SetItem(slotkey)
end

-- UpdateDeletedSlot updates the slot key of a deleted slot, while maintaining the
-- button position and section to prevent a sort from happening.
---@param view View
---@param oldSlotKey string
---@param newSlotKey string
local function UpdateDeletedSlot(view, oldSlotKey, newSlotKey)
  local oldSlotCell = view.itemsByBagAndSlot[oldSlotKey]
  oldSlotCell:SetItem(newSlotKey)
  view.itemsByBagAndSlot[newSlotKey] = oldSlotCell
  view.itemsByBagAndSlot[oldSlotKey] = nil
end

---@param view View
---@param bag Bag
---@param slotInfo SlotInfo
local function OneBagView(view, bag, slotInfo)
  if view.fullRefresh then
    view:Wipe()
    view.fullRefresh = false
  end

  local sizeInfo = database:GetBagSizeInfo(bag.kind, database:GetBagView(bag.kind))

  view.content.compactStyle = const.GRID_COMPACT_STYLE.NONE

  local added, removed, changed = slotInfo:GetChangeset()

  for _, item in pairs(removed) do
    if item.bagid ~= Enum.BagIndex.Keyring then
      local newSlotKey = view:RemoveButton(item)

      -- Clear if the item is empty, otherwise reindex it as a new item has taken it's
      -- place due to the deleted being the head of a stack.
      if not newSlotKey then
        ClearButton(view, item)
      else
        UpdateDeletedSlot(view, item.slotkey, newSlotKey)
      end
    end
  end

  for _, item in pairs(added) do
    if item.bagid ~= Enum.BagIndex.Keyring then
      local updateKey = view:AddButton(item)
      if not updateKey then
        CreateButton(view, item)
      else
        UpdateButton(view, updateKey)
      end
    end
  end

  for _, item in pairs(changed) do
    if item.bagid ~= Enum.BagIndex.Keyring then
      local updateKey, removeKey = view:ChangeButton(item)
      UpdateButton(view, updateKey)
      if updateKey ~= item.slotkey then
        UpdateButton(view, item.slotkey)
      end
      if removeKey then
        ClearButton(view, items:GetItemDataFromSlotKey(removeKey))
      end
    end
  end

  -- Get the free slots section and add the free slots to it.
  for name, freeSlotCount in pairs(slotInfo.emptySlots) do
    if slotInfo.freeSlotKeys[name] ~= nil then
      local itemButton = view:GetOrCreateItemButton(name)
      local freeSlotBag, freeSlotID = view:ParseSlotKey(slotInfo.freeSlotKeys[name])
      itemButton:SetFreeSlots(freeSlotBag, freeSlotID, freeSlotCount, name)
      view.content:AddCell(name, itemButton)
    else
      local itemButton = view:GetOrCreateItemButton(name)
      itemButton:SetFreeSlots(1, 1, freeSlotCount, name)
      view.content:AddCell(name, itemButton)
    end
  end

  if not slotInfo.deferDelete then
    -- Handle items that were removed from the view.
    for slotkey, _ in pairs(view:GetDeferredItems()) do
      view.content:RemoveCell(slotkey)
      view.itemsByBagAndSlot[slotkey]:Wipe()
    end
    view:ClearDeferredItems()
    view.content.maxCellWidth = sizeInfo.columnCount
    -- Sort the items.
    view.content:Sort(sort:GetItemSortFunction(bag.kind, const.BAG_VIEW.ONE_BAG))
    local w, h = view.content:Draw()
    view.content:HideScrollBar()
    bag.frame:SetWidth(w + const.OFFSETS.BAG_LEFT_INSET + -const.OFFSETS.BAG_RIGHT_INSET)
    local bagHeight = h +
    const.OFFSETS.BAG_BOTTOM_INSET + -const.OFFSETS.BAG_TOP_INSET +
    const.OFFSETS.BOTTOM_BAR_HEIGHT + const.OFFSETS.BOTTOM_BAR_BOTTOM_INSET
    bag.frame:SetHeight(bagHeight)
  end
end

---@param parent Frame
---@param kind BagKind
---@return View
function views:NewOneBag(parent, kind)
  local view = views:NewBlankView()
  view.bagview = const.BAG_VIEW.ONE_BAG
  view.kind = kind
  view.content = grid:Create(parent)
  view.content:GetContainer():ClearAllPoints()
  view.content:GetContainer():SetPoint("TOPLEFT", parent, "TOPLEFT", const.OFFSETS.BAG_LEFT_INSET, const.OFFSETS.BAG_TOP_INSET)
  view.content:GetContainer():SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", const.OFFSETS.BAG_RIGHT_INSET, const.OFFSETS.BAG_BOTTOM_INSET + const.OFFSETS.BOTTOM_BAR_BOTTOM_INSET + 20)
  view.content.compactStyle = const.GRID_COMPACT_STYLE.NONE
  view.content:Hide()
  view.Render = OneBagView
  view.WipeHandler = Wipe
  return view
end