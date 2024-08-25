local myname, ns = ...

local core = LibStub("AceAddon-3.0"):GetAddon("SilverDragon")
local module = core:NewModule("TomTom", "AceEvent-3.0")
local Debug = core.Debug

function module:OnInitialize()
	self.db = core.db:RegisterNamespace("TomTom", {
		profile = {
			enabled = true,
			mob = true,
			loot = true,
			duration = 120,
			mappinenhanced = true,
			blizzard = true,
			tomtom = true,
			dbm = false,
			replace = false,
			popup = true,
			whiledead = true,
		},
	})

	local config = core:GetModule("Config", true)
	if config then
		config.options.plugins.tomtom = {
			tomtom = {
				type = "group",
				name = "Waypoints",
				get = function(info) return self.db.profile[info[#info]] end,
				set = function(info, v) self.db.profile[info[#info]] = v end,
				args = {
					about = config.desc("When we see a mob via its minimap icon, we can ask an arrow to point us to it", 0),
					enabled = config.toggle("Automatically", "Make a waypoint as soon as something is seen", 20),
					types = {
						type = "group",
						inline = true,
						name = "Make a waypoint for...",
						order = 25,
						args = {
							mob = config.toggle("Mobs", "Make a waypoint for mobs", 23),
							loot = config.toggle("Loot", "Make a waypoint for loot", 27),
						},
					},
					whiledead = config.toggle("While dead", "...even when you're dead", 30),
					blizzard = config.toggle("Use built-in", "Use the built-in Blizzard waypoints", 40),
					mappinenhanced = config.toggle("Use MapPinEnhanced", "If MapPinEnhanced is installed, use it", 50, nil, function() return not MapPinEnhanced end),
					tomtom = config.toggle("Use TomTom", "If TomTom is installed, use it", 60, nil, function() return not TomTom end),
					dbm = config.toggle("Use DeadlyBossMods", "If DeadlyBossMods is installed, use it", 70, nil, function() return not DBM end),
					replace = config.toggle("Replace waypoints", "Replace an existing waypoint if one is set", 80),
					duration = {
						type = "range",
						name = "Duration",
						desc = "How long to wait before clearing the waypoint if you don't reach it",
						min = 0, max = (10 * 60), step = 5,
						order = 90,
					},
					popup = config.toggle("Remove when target popup closed", "Clear the waypoint when the click target popup is closed. Only when you manually close it.", 100),
				},
			},
		}
	end
end

function module:OnEnable()
	core.RegisterCallback(self, "Announce")
	core.RegisterCallback(self, "AnnounceLoot")
	core.RegisterCallback(self, "PopupHide")
end


local sources = {
	grouptarget = true,
	vignette = true,
	['point-of-interest'] = true,
	groupsync = true,
	fake = true,
	darkmagic = false, -- only know where the player is
}
function module:Announce(_, id, zone, x, y, is_dead, source, unit)
	if not (self.db.profile.enabled and self.db.profile.mob) then return end
	if not self.db.profile.whiledead and UnitIsDead("player") then return end
	if not (source and sources[source]) then return end
	if not (zone and x and y and x > 0 and y > 0) then return end
	self:PointTo(id, zone, x, y, self.db.profile.duration)
end

function module:AnnounceLoot(_, name, id, zone, x, y, vignetteGUID)
	if not (self.db.profile.enabled and self.db.profile.loot) then return end
	if not self.db.profile.whiledead and UnitIsDead("player") then return end
	-- if not sources.vignette then return end
	if not (zone and x and y and x > 0 and y > 0) then return end
	self:PointTo(name, zone, x, y, self.db.profile.duration)
end

function module:CanPointTo(zone)
	if not zone then return false end
	local db = self.db.profile
	if MapPinEnhanced and db.mappinenhanced then return true end
	if TomTom and db.tomtom then return true end
	if DBM and db.dbm then return true end
	if db.blizzard and C_Map.CanSetUserWaypointOnMap and C_Map.CanSetUserWaypointOnMap(zone) then return true end
	return false
end

do
	local waypoints = {}
	local previous
	function module:PointTo(id, zone, x, y, duration, force)
		Debug("Waypoint.PointTo", id, zone, x, y, duration, force)
		local db = self.db.profile
		local title = type(id) == "number" and core:GetMobLabel(id) or id or UNKNOWN
		if MapPinEnhanced and MapPinEnhanced.AddPin and db.mappinenhanced then
			MapPinEnhanced:AddPin{
				mapID = zone,
				x = x,
				y = y,
				setTracked = db.replace,
				title = title,
			}
		end
		if TomTom and db.tomtom then
			if waypoints.tomtom then
				TomTom:RemoveWaypoint(waypoints.tomtom)
			end
			waypoints.tomtom = TomTom:AddWaypoint(zone, x, y, {
				title = title,
				persistent = false,
				minimap = false,
				world = false,
				-- Tomtom has multiple waypoints, so we'll interpret the "don't replace" as "don't push onto the crazy arrow"
				crazy = force or db.replace or not (waypoints.tomtom and TomTom:IsValidWaypoint(waypoints.tomtom)),
				cleardistance = 25
			})
			waypoints.tomtom.mobid = id
		end
		if DBM and db.dbm and (db.replace or not DBM.Arrow:IsShown()) then
			waypoints.dbm = {mobid = id}
			DBM.Arrow:ShowRunTo(
				x * 100,
				y * 100,
				25, -- clear distance
				(duration and duration > 0) and duration or nil,
				true, -- "legacy" which I think means to use per-zone coords rather than world coords
				true, -- unused
				title,
				zone
			)
		end
		if db.blizzard and C_Map.CanSetUserWaypointOnMap and C_Map.CanSetUserWaypointOnMap(zone) and x > 0 and y > 0 then
			previous = C_Map.GetUserWaypoint()
			if previous then
				previous.wasTracked = C_SuperTrack.IsSuperTrackingUserWaypoint()
			end
			local uiMapPoint = UiMapPoint.CreateFromCoordinates(zone, x, y)
			if (not previous) or db.replace or force then
				C_Map.SetUserWaypoint(uiMapPoint)
				C_SuperTrack.SetSuperTrackedUserWaypoint(true)
				waypoints.blizzard = C_Map.GetUserWaypoint()
			end
		end

		if duration and duration > 0 then
			C_Timer.After(duration, function()
				self:Hide(id)
			end)
		end
	end
	function module:Hide(id)
		Debug("Waypoint.Hide", id)
		local db = self.db.profile
		if waypoints.blizzard then
			Debug("Hiding C_Map")
			local waypoint = waypoints.blizzard
			local stillCurrent = C_Map.GetUserWaypoint()
			if stillCurrent and waypoint.uiMapID == stillCurrent.uiMapID and Vector2DMixin.IsEqualTo(waypoint.position, stillCurrent.position) then
				C_Map.ClearUserWaypoint()
				if previous then
					-- restore the one we replaced
					C_Map.SetUserWaypoint(previous)
					C_SuperTrack.SetSuperTrackedUserWaypoint(previous.wasTracked)
					previous = nil
				end
				waypoints.blizzard = nil
			end
		end
		if TomTom and db.tomtom and waypoints.tomtom then
			if waypoints.tomtom.mobid == id then
				Debug("Hiding TomTom")
				TomTom:RemoveWaypoint(waypoints.tomtom)
				-- tomtom doesn't need to restore a waypoint, because it has a stack
				waypoints.tomtom = nil
			end
		end
		if DBM and db.dbm and waypoints.dbm then
			if waypoints.dbm.mobid == id then
				Debug("Hiding DBM")
				-- no way to tell if it's still the same
				DBM.Arrow:Hide()
				waypoints.dbm = nil
			end
		end
	end

	function module:PopupHide(_, id, zone, x, y, automatic)
		Debug("Waypoint.PopupHide", id, zone, x, y, automatic)
		if self.db.profile.popup and not automatic then
			self:Hide(id, zone, x, y)
		end
	end
end
