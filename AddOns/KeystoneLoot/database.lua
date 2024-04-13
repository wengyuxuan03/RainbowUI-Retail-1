local AddonName, KeystoneLoot = ...;

local dbVersion = 1;
local dbCharacterVersion = 1;


local function RemoveOldSeason()
	local currentSeasonDB = KeystoneLootCharDB.currentSeason;
	local currentSeason = KeystoneLoot:GetSeasonId();

	if (currentSeason ~= currentSeasonDB) then
		wipe(KeystoneLootCharDB.favoriteLoot);

		KeystoneLootCharDB.currentSeason = currentSeason;
	end
end


function KeystoneLoot:CheckDB()
	if (KeystoneLootDB == nil or KeystoneLootDB.dbVersion == nil) then
		KeystoneLootDB = {
			dbVersion = 0
		};
	end

	if (dbVersion > KeystoneLootDB.dbVersion) then
		if (KeystoneLootDB.dbVersion == 0) then
			KeystoneLootDB.minimapButtonEnabled = true;
			KeystoneLootDB.minimapButtonPosition = 195;
			KeystoneLootDB.lootReminderEnabled = true;
			KeystoneLootDB.showNewText = false;
			KeystoneLootDB.favoritesShowAllSpecs = false;
		end

		KeystoneLootDB.dbVersion = KeystoneLootDB.dbVersion + 1;
		self:CheckDB();
	end
end

function KeystoneLoot:CheckCharacterDB()
	if (KeystoneLootCharDB == nil or KeystoneLootCharDB.dbVersion == nil) then
		KeystoneLootCharDB = {
			dbVersion = 0
		};
	end

	if (dbCharacterVersion > KeystoneLootCharDB.dbVersion) then
		if (KeystoneLootCharDB.dbVersion == 0) then
			KeystoneLootCharDB.currentSeason = self:GetSeasonId();
			KeystoneLootCharDB.selectedSlotId = 0;
			KeystoneLootCharDB.selectedClassId = select(3, UnitClass('player'));
			KeystoneLootCharDB.selectedSpecId = (GetSpecializationInfo(GetSpecialization() or 1)) or 0;
			KeystoneLootCharDB.selectedDungeonItemLevel = 0;
			KeystoneLootCharDB.favoriteLoot = {};
		end

		KeystoneLootCharDB.dbVersion = KeystoneLootCharDB.dbVersion + 1;
		self:CheckCharacterDB();
		return;
	end

	RemoveOldSeason();
end

function KeystoneLoot:GetFavoriteItemList(challengeModeId, overrideSpecId)
	local specId = overrideSpecId or KeystoneLootCharDB.selectedSpecId;
	local _, _, playerClassId = UnitClass('player');
	local classId = KeystoneLootCharDB.selectedClassId;
	local favoriteLoot = KeystoneLootCharDB.favoriteLoot;
	local _itemList = {};

	if (favoriteLoot[challengeModeId] == nil) then
		return _itemList;
	end

	if (playerClassId == classId and KeystoneLootDB.favoritesShowAllSpecs) then
		local _tmp = {};

		for specId, specList in next, favoriteLoot[challengeModeId] do
			for itemId, itemInfo in next, specList do
				_tmp[itemId] = {
					itemId = itemId,
					specId = specId,
					icon = itemInfo.icon
				};
			end
		end

		for _, itemInfo in next, _tmp do
			table.insert(_itemList, itemInfo);
		end
	elseif (favoriteLoot[challengeModeId][specId]) then
		for itemId, itemInfo in next, favoriteLoot[challengeModeId][specId] do
			table.insert(_itemList, {
				itemId = itemId,
				icon = itemInfo.icon
			});
		end
	end

	return _itemList;
end

function KeystoneLoot:IsFavoriteItem(itemId, overrideSpecId)
	local specId = overrideSpecId or KeystoneLootCharDB.selectedSpecId;
	local favoriteLoot = KeystoneLootCharDB.favoriteLoot;

	for _, specList in next, favoriteLoot do
		if (specList[specId] and specList[specId][itemId]) then
			return true;
		end
	end
end

function KeystoneLoot:AddFavoriteItem(challengeModeId, specId, itemId, icon)
	local favoriteLoot = KeystoneLootCharDB.favoriteLoot;

	if (favoriteLoot[challengeModeId] == nil) then
		favoriteLoot[challengeModeId] = {};
	end

	if (favoriteLoot[challengeModeId][specId] == nil) then
		favoriteLoot[challengeModeId][specId] = {};
	end

	favoriteLoot[challengeModeId][specId][itemId] = {
		icon = icon
	};
end

function KeystoneLoot:RemoveFavoriteItem(itemId, specId)
	local favoriteLoot = KeystoneLootCharDB.favoriteLoot;

	if (specId == nil) then
		for _, specList in next, favoriteLoot do
			for _, itemList in next, specList do
				if (itemList[itemId]) then
					itemList[itemId] = nil;
				end
			end
		end
	else
		for _, specList in next, favoriteLoot do
			if (specList[specId] and specList[specId][itemId]) then
				specList[specId][itemId] = nil;
				break;
			end
		end
	end
end