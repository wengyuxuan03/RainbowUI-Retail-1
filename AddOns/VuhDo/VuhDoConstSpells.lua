local GetSpellName = C_Spell.GetSpellName;

--
local tSpellName;
local function VUHDO_getSpellInfoSafe(aSpellID)
	tSpellName = GetSpellName(aSpellID);

	return tSpellName or "!";
end

--------------------
-- Spells by SpellId
--------------------
VUHDO_SPELL_ID = { };
VUHDO_SPELL_ID.ABSOLUTION = VUHDO_getSpellInfoSafe(212056);
VUHDO_SPELL_ID.ACTIVATING_SPECIALIZATION = VUHDO_getSpellInfoSafe(200749);
VUHDO_SPELL_ID.ADAPTIVE_SWARM = VUHDO_getSpellInfoSafe(325727);
VUHDO_SPELL_ID.AIMED_SHOT = VUHDO_getSpellInfoSafe(19434);
VUHDO_SPELL_ID.ANCESTRAL_FORTITUDE = VUHDO_getSpellInfoSafe(85838);
VUHDO_SPELL_ID.ANCESTRAL_SPIRIT = VUHDO_getSpellInfoSafe(2008);
VUHDO_SPELL_ID.ANCESTRAL_VISION = VUHDO_getSpellInfoSafe(212048);
VUHDO_SPELL_ID.APOTHEOSIS = VUHDO_getSpellInfoSafe(392941);
VUHDO_SPELL_ID.ARCANE_BLAST = VUHDO_getSpellInfoSafe(30451);
VUHDO_SPELL_ID.ARCANE_INTELLECT = VUHDO_getSpellInfoSafe(1459);
VUHDO_SPELL_ID.ATONEMENT = VUHDO_getSpellInfoSafe(194384);
VUHDO_SPELL_ID.AZURE_STRIKE = VUHDO_getSpellInfoSafe(362969);
VUHDO_SPELL_ID.BINDING_HEAL = VUHDO_getSpellInfoSafe(32546);
VUHDO_SPELL_ID.CALL_OF_THE_ELEMENTS = VUHDO_getSpellInfoSafe(66842);
VUHDO_SPELL_ID.CAUTERIZING_FLAME = VUHDO_getSpellInfoSafe(374251);
VUHDO_SPELL_ID.CENARION_WARD = VUHDO_getSpellInfoSafe(102351);
VUHDO_SPELL_ID.CHAIN_HEAL = VUHDO_getSpellInfoSafe(1064);
VUHDO_SPELL_ID.CHRONO_FLAME = VUHDO_getSpellInfoSafe(431442);
VUHDO_SPELL_ID.CIRCLE_OF_HEALING = VUHDO_getSpellInfoSafe(34861);
VUHDO_SPELL_ID.CLEANSE_SPIRIT = VUHDO_getSpellInfoSafe(51886);
VUHDO_SPELL_ID.CLEANSE_TOXINS = VUHDO_getSpellInfoSafe(213644);
VUHDO_SPELL_ID.COBRA_SHOT = VUHDO_getSpellInfoSafe(193455);
VUHDO_SPELL_ID.CONCUSSIVE_SHOT = VUHDO_getSpellInfoSafe(5116);
VUHDO_SPELL_ID.CYCLONE = VUHDO_getSpellInfoSafe(33786);
VUHDO_SPELL_ID.DEATH_COIL = VUHDO_getSpellInfoSafe(47541);
VUHDO_SPELL_ID.DEATH_GRIP = VUHDO_getSpellInfoSafe(49576);
VUHDO_SPELL_ID.DESPERATE_PRAYER = VUHDO_getSpellInfoSafe(19236);
VUHDO_SPELL_ID.DISPEL_MAGIC = VUHDO_getSpellInfoSafe(528);
VUHDO_SPELL_ID.DIVINE_AEGIS = VUHDO_getSpellInfoSafe(47753);
VUHDO_SPELL_ID.DIVINE_ILLUMINATION = VUHDO_getSpellInfoSafe(71166);
VUHDO_SPELL_ID.DREAM_BREATH = VUHDO_getSpellInfoSafe(355936);
VUHDO_SPELL_ID.DREAM_FLIGHT = VUHDO_getSpellInfoSafe(359816);
VUHDO_SPELL_ID.ECHO = VUHDO_getSpellInfoSafe(364343);
VUHDO_SPELL_ID.ECHO_OF_LIGHT = VUHDO_getSpellInfoSafe(77489);
VUHDO_SPELL_ID.EARTHLIVING = VUHDO_getSpellInfoSafe(51945);
VUHDO_SPELL_ID.EMERALD_BLOSSOM = VUHDO_getSpellInfoSafe(355913);
VUHDO_SPELL_ID.ETERNAL_FLAME = VUHDO_getSpellInfoSafe(114163);
VUHDO_SPELL_ID.EXPUNGE = VUHDO_getSpellInfoSafe(365585);
VUHDO_SPELL_ID.FAERIE_FIRE = VUHDO_getSpellInfoSafe(770);
VUHDO_SPELL_ID.FAERIE_SWARM = VUHDO_getSpellInfoSafe(106707);
VUHDO_SPELL_ID.FIREBALL = VUHDO_getSpellInfoSafe(133);
VUHDO_SPELL_ID.FLAME_SHOCK = VUHDO_getSpellInfoSafe(188389);
VUHDO_SPELL_ID.FLASH_HEAL = VUHDO_getSpellInfoSafe(2061);
VUHDO_SPELL_ID.FLASH_OF_LIGHT = VUHDO_getSpellInfoSafe(19750);
VUHDO_SPELL_ID.FROSTBOLT = VUHDO_getSpellInfoSafe(116);
VUHDO_SPELL_ID.FROSTBOLT_VOLLEY = VUHDO_getSpellInfoSafe(72905);
VUHDO_SPELL_ID.GIFT_OF_THE_NAARU = VUHDO_getSpellInfoSafe(59547);
VUHDO_SPELL_ID.GENESIS = VUHDO_getSpellInfoSafe(162359);
VUHDO_SPELL_ID.GERMINATION = VUHDO_getSpellInfoSafe(155777);
VUHDO_SPELL_ID.GLIMMER_OF_LIGHT = VUHDO_getSpellInfoSafe(287280);
VUHDO_SPELL_ID.GUARDIAN_SPIRIT = VUHDO_getSpellInfoSafe(47788);
VUHDO_SPELL_ID.HAND_OF_RECKONING = VUHDO_getSpellInfoSafe(62124);
VUHDO_SPELL_ID.HEAL = VUHDO_getSpellInfoSafe(2060);
VUHDO_SPELL_ID.HEALING_TOUCH = VUHDO_getSpellInfoSafe(5185);
VUHDO_SPELL_ID.HEALING_WAVE = VUHDO_getSpellInfoSafe(77472);
VUHDO_SPELL_ID.HOLY_FIRE = VUHDO_getSpellInfoSafe(14914);
VUHDO_SPELL_ID.HOLY_LIGHT = VUHDO_getSpellInfoSafe(82326);
VUHDO_SPELL_ID.HOLY_RADIANCE = VUHDO_getSpellInfoSafe(82327);
VUHDO_SPELL_ID.HOLY_SHOCK = VUHDO_getSpellInfoSafe(20473);
VUHDO_SPELL_ID.HOLY_WORD_CHASTISE = VUHDO_getSpellInfoSafe(88625); -- Segenswort: Züchtigung
VUHDO_SPELL_ID.HOLY_WORD_SALVATION = VUHDO_getSpellInfoSafe(265202);
VUHDO_SPELL_ID.HOLY_WORD_SANCTUARY = VUHDO_getSpellInfoSafe(88686); -- Segenswort: Refugium
VUHDO_SPELL_ID.ICE_BARRIER = VUHDO_getSpellInfoSafe(11426);
VUHDO_SPELL_ID.INNERVATE = VUHDO_getSpellInfoSafe(29166);
VUHDO_SPELL_ID.INTERCESSION = VUHDO_getSpellInfoSafe(391054);
VUHDO_SPELL_ID.LAY_ON_HANDS = VUHDO_getSpellInfoSafe(633);
VUHDO_SPELL_ID.LIFEBIND = VUHDO_getSpellInfoSafe(373267);
VUHDO_SPELL_ID.LIFEBLOOM = VUHDO_getSpellInfoSafe(33763);
VUHDO_SPELL_ID.LIGHTNING_BOLT = VUHDO_getSpellInfoSafe(188196);
VUHDO_SPELL_ID.LIGHT_OF_DAWN = VUHDO_getSpellInfoSafe(85222);
VUHDO_SPELL_ID.LIVING_FLAME = VUHDO_getSpellInfoSafe(361469);
VUHDO_SPELL_ID.LUMINOUS_BARRIER = VUHDO_getSpellInfoSafe(271466);
VUHDO_SPELL_ID.MANA_SHIELD = VUHDO_getSpellInfoSafe(56778); -- MOP?
VUHDO_SPELL_ID.MASS_RESURRECTION = VUHDO_getSpellInfoSafe(212036);
VUHDO_SPELL_ID.MASS_RETURN = VUHDO_getSpellInfoSafe(361178);
VUHDO_SPELL_ID.MEND_PET = VUHDO_getSpellInfoSafe(136);
VUHDO_SPELL_ID.MIND_BLAST = VUHDO_getSpellInfoSafe(8092);
VUHDO_SPELL_ID.MISDIRECTION = VUHDO_getSpellInfoSafe(34477);
VUHDO_SPELL_ID.MOONFIRE = VUHDO_getSpellInfoSafe(8921);
VUHDO_SPELL_ID.MOONKIN_FORM = VUHDO_getSpellInfoSafe(24858);
VUHDO_SPELL_ID.NATURALIZE = VUHDO_getSpellInfoSafe(360823);
VUHDO_SPELL_ID.NATURES_CURE = VUHDO_getSpellInfoSafe(88423);
VUHDO_SPELL_ID.OVERFLOWING_LIGHT = VUHDO_getSpellInfoSafe(414133);
VUHDO_SPELL_ID.PAIN_SUPPRESSION = VUHDO_getSpellInfoSafe(33206);
VUHDO_SPELL_ID.PALA_CLEANSE = VUHDO_getSpellInfoSafe(4987);
VUHDO_SPELL_ID.POWER_WORD_BARRIER = VUHDO_getSpellInfoSafe(62618);
VUHDO_SPELL_ID.POWERWORD_SHIELD = VUHDO_getSpellInfoSafe(17);
VUHDO_SPELL_ID.POWERWORD_SOLACE = VUHDO_getSpellInfoSafe(129250);
VUHDO_SPELL_ID.PRAYER_OF_HEALING = VUHDO_getSpellInfoSafe(596);
VUHDO_SPELL_ID.PRAYER_OF_MENDING = VUHDO_getSpellInfoSafe(33076);
VUHDO_SPELL_ID.PROVOKE = VUHDO_getSpellInfoSafe(115546);
VUHDO_SPELL_ID.PURGE = VUHDO_getSpellInfoSafe(370);
VUHDO_SPELL_ID.PURGE_THE_WICKED = VUHDO_getSpellInfoSafe(204197);
VUHDO_SPELL_ID.PURIFY = VUHDO_getSpellInfoSafe(527);
VUHDO_SPELL_ID.PURIFY_DISEASE = VUHDO_getSpellInfoSafe(213634);
VUHDO_SPELL_ID.PURIFY_SPIRIT = VUHDO_getSpellInfoSafe(77130);
VUHDO_SPELL_ID.RAISE_ALLY = VUHDO_getSpellInfoSafe(61999);
VUHDO_SPELL_ID.REAWAKEN = VUHDO_getSpellInfoSafe(212051);
VUHDO_SPELL_ID.REBIRTH = VUHDO_getSpellInfoSafe(20484);
VUHDO_SPELL_ID.REDEMPTION = VUHDO_getSpellInfoSafe(7328);
VUHDO_SPELL_ID.REGROWTH = VUHDO_getSpellInfoSafe(8936);
VUHDO_SPELL_ID.REJUVENATION = VUHDO_getSpellInfoSafe(774);
VUHDO_SPELL_ID.REMOVE_CORRUPTION = VUHDO_getSpellInfoSafe(2782);
VUHDO_SPELL_ID.REMOVE_CURSE = VUHDO_getSpellInfoSafe(475);
VUHDO_SPELL_ID.RENEW = VUHDO_getSpellInfoSafe(139);
VUHDO_SPELL_ID.RESURRECTION = VUHDO_getSpellInfoSafe(2006);
VUHDO_SPELL_ID.RETURN = VUHDO_getSpellInfoSafe(361227);
VUHDO_SPELL_ID.REVERSION = VUHDO_getSpellInfoSafe(366155);
VUHDO_SPELL_ID.REVITALIZE = VUHDO_getSpellInfoSafe(212040);
VUHDO_SPELL_ID.REVIVE = VUHDO_getSpellInfoSafe(50769);
VUHDO_SPELL_ID.REWIND = VUHDO_getSpellInfoSafe(363534);
VUHDO_SPELL_ID.RIPTIDE = VUHDO_getSpellInfoSafe(61295);
VUHDO_SPELL_ID.RUNE_OF_POWER = VUHDO_getSpellInfoSafe(116011);
VUHDO_SPELL_ID.SACRIFICE = VUHDO_getSpellInfoSafe(7812);
VUHDO_SPELL_ID.SAVAGE_DEFENSE = VUHDO_getSpellInfoSafe(62606);
VUHDO_SPELL_ID.SERENDIPITY = VUHDO_getSpellInfoSafe(63733);
VUHDO_SPELL_ID.SHADOWFORM = VUHDO_getSpellInfoSafe(15473);
VUHDO_SPELL_ID.SHADOWSTEP = VUHDO_getSpellInfoSafe(36554);
VUHDO_SPELL_ID.SHADOW_BOLT = VUHDO_getSpellInfoSafe(686);
VUHDO_SPELL_ID.SHADOW_MEND = VUHDO_getSpellInfoSafe(186263);
VUHDO_SPELL_ID.SHADOW_WORD_PAIN = VUHDO_getSpellInfoSafe(589);
VUHDO_SPELL_ID.SMITE = VUHDO_getSpellInfoSafe(585);
VUHDO_SPELL_ID.SOULSTONE = VUHDO_getSpellInfoSafe(20707);
VUHDO_SPELL_ID.SPELLSTEAL = VUHDO_getSpellInfoSafe(30449);
VUHDO_SPELL_ID.SPIRIT_SHELL = VUHDO_getSpellInfoSafe(109964);
VUHDO_SPELL_ID.SPRING_BLOSSOMS = VUHDO_getSpellInfoSafe(207386);
VUHDO_SPELL_ID.STEADY_SHOT = VUHDO_getSpellInfoSafe(132031);
VUHDO_SPELL_ID.SWIFTMEND = VUHDO_getSpellInfoSafe(18562);
VUHDO_SPELL_ID.TAUNT = VUHDO_getSpellInfoSafe(355);
VUHDO_SPELL_ID.TEMPORAL_SHIELD = VUHDO_getSpellInfoSafe(198111);
VUHDO_SPELL_ID.THROW_GLAIVE = VUHDO_getSpellInfoSafe(185123);
VUHDO_SPELL_ID.TIDAL_WAVES = VUHDO_getSpellInfoSafe(51564);
VUHDO_SPELL_ID.TIME_DILATION = VUHDO_getSpellInfoSafe(357170);
VUHDO_SPELL_ID.TRAIL_OF_LIGHT = VUHDO_getSpellInfoSafe(200128);
VUHDO_SPELL_ID.TRANQUILITY = VUHDO_getSpellInfoSafe(740);
VUHDO_SPELL_ID.VOID_BLAST = VUHDO_getSpellInfoSafe(450405);
VUHDO_SPELL_ID.WILD_GROWTH = VUHDO_getSpellInfoSafe(48438);
VUHDO_SPELL_ID.WIND_SHEAR = VUHDO_getSpellInfoSafe(57994);
VUHDO_SPELL_ID.WING_CLIP = VUHDO_getSpellInfoSafe(195645);
VUHDO_SPELL_ID.WORD_OF_GLORY = VUHDO_getSpellInfoSafe(85673);
VUHDO_SPELL_ID.WRITHING_WARD = VUHDO_getSpellInfoSafe(401238);
VUHDO_SPELL_ID.ZEPHYR = VUHDO_getSpellInfoSafe(374227);

-- Monk
VUHDO_SPELL_ID.SOOTHING_MIST = VUHDO_getSpellInfoSafe(115175);
VUHDO_SPELL_ID.RESUSCITATE = VUHDO_getSpellInfoSafe(115178); -- Res
VUHDO_SPELL_ID.DETOX = VUHDO_getSpellInfoSafe(115450); -- Poison/Disease <= Talent Internal Medicine: + Magic
VUHDO_SPELL_ID.ENVELOPING_MIST = VUHDO_getSpellInfoSafe(124682); -- (Serpent Stance only)
VUHDO_SPELL_ID.SURGING_MIST = VUHDO_getSpellInfoSafe(116694);
VUHDO_SPELL_ID.RENEWING_MIST = VUHDO_getSpellInfoSafe(115151);
VUHDO_SPELL_ID.UPLIFT = VUHDO_getSpellInfoSafe(116670);
VUHDO_SPELL_ID.REVIVAL = VUHDO_getSpellInfoSafe(115310);  -- Instant-Gruppenheilung all within vision + Alle 3 Detox
VUHDO_SPELL_ID.ZEN_SPHERE = VUHDO_getSpellInfoSafe(124081);
VUHDO_SPELL_ID.CHI_WAVE = VUHDO_getSpellInfoSafe(115098);
VUHDO_SPELL_ID.LIFE_COCOON = VUHDO_getSpellInfoSafe(116849);
VUHDO_SPELL_ID.ANCIENT_MISTWEAVER_ARTS = VUHDO_getSpellInfoSafe(209520);
VUHDO_SPELL_ID.SOOTHING_MIST_HONOR_TALENT = VUHDO_getSpellInfoSafe(209525);
VUHDO_SPELL_ID.ESSENCE_FONT = VUHDO_getSpellInfoSafe(191840);


-- 3000 MASTERY (=>BOM)

-- 5% Stats (=>BOK, Motw, LotE)

-- 10% Stam (PWS, BloodPakt, Commanding shout)

-- 10% Spell Power (Arcane, Dalaran)

-- 10% Atk speed (Unholy Aura)
--[[VUHDO_SPELL_ID.CRACKLING_HOWL = VUHDO_getSpellInfoSafe(128432);
VUHDO_SPELL_ID.SERPENTS_SWIFTNESS = VUHDO_getSpellInfoSafe(128433);
VUHDO_SPELL_ID.SWIFTBLADES_CUNNING = VUHDO_getSpellInfoSafe(113742);
VUHDO_SPELL_ID.UNLEASH_RAGE = VUHDO_getSpellInfoSafe(30809);]]

-- 10% ATK power (Horn of Winter, Trueshot, battle shout)

-- 10% Spell Haste (not needed yet)
--[[moonkin aura,
 mind quickening
 Shadowform
 elemental oath]]

-- 5% Crit (=> Legacy of the white Tiger)


------------------
-- Buff categories
------------------


-- Priest

--------
-- Buffs
--------


-- Priest
VUHDO_SPELL_ID.BUFF_POWER_WORD_FORTITUDE = VUHDO_getSpellInfoSafe(13864);
VUHDO_SPELL_ID.BUFF_SHADOWFIEND      = VUHDO_getSpellInfoSafe(34433);
VUHDO_SPELL_ID.BUFF_POWER_INFUSION   = VUHDO_getSpellInfoSafe(10060);
VUHDO_SPELL_ID.BUFF_VAMPIRIC_EMBRACE = VUHDO_getSpellInfoSafe(15286);
VUHDO_SPELL_ID.BUFF_LEVITATE         = VUHDO_getSpellInfoSafe(1706);


-- Shaman
-- Fire
VUHDO_SPELL_ID.BUFF_FIRE_ELEMENTAL_TOTEM = VUHDO_getSpellInfoSafe(198067);
VUHDO_SPELL_ID.BUFF_MAGMA_TOTEM          = VUHDO_getSpellInfoSafe(8190);
VUHDO_SPELL_ID.BUFF_LIQUID_MAGMA_TOTEM   = VUHDO_getSpellInfoSafe(192222);
-- Air
VUHDO_SPELL_ID.BUFF_WINDWALK_TOTEM        = VUHDO_getSpellInfoSafe(108273);
VUHDO_SPELL_ID.BUFF_CAPACITOR_TOTEM       = VUHDO_getSpellInfoSafe(192058);
VUHDO_SPELL_ID.BUFF_GROUNDING_TOTEM       = VUHDO_getSpellInfoSafe(204336);
VUHDO_SPELL_ID.BUFF_SPIRIT_LINK_TOTEM     = VUHDO_getSpellInfoSafe(98008);
VUHDO_SPELL_ID.BUFF_WIND_RUSH_TOTEM       = VUHDO_getSpellInfoSafe(192077);
VUHDO_SPELL_ID.BUFF_TRANQUIL_AIR_TOTEM    = VUHDO_getSpellInfoSafe(383019);
VUHDO_SPELL_ID.BUFF_STORM_ELEMENTAL_TOTEM = VUHDO_getSpellInfoSafe(192249);
-- Earth
VUHDO_SPELL_ID.BUFF_STONE_BULWARK_TOTEM   = VUHDO_getSpellInfoSafe(108270);
VUHDO_SPELL_ID.BUFF_EARTHGRAB_TOTEM       = VUHDO_getSpellInfoSafe(51485);
VUHDO_SPELL_ID.BUFF_EARTHBIND_TOTEM       = VUHDO_getSpellInfoSafe(2484);
VUHDO_SPELL_ID.BUFF_EARTH_ELEMENTAL_TOTEM = VUHDO_getSpellInfoSafe(198103);
VUHDO_SPELL_ID.BUFF_TREMOR_TOTEM          = VUHDO_getSpellInfoSafe(8143);
VUHDO_SPELL_ID.BUFF_STONESKIN_TOTEM       = VUHDO_getSpellInfoSafe(383017);
-- Water
VUHDO_SPELL_ID.BUFF_HEALING_TIDE_TOTEM     = VUHDO_getSpellInfoSafe(108280);
VUHDO_SPELL_ID.BUFF_HEALING_STREAM_TOTEM   = VUHDO_getSpellInfoSafe(5394);
VUHDO_SPELL_ID.BUFF_MANA_TIDE_TOTEM        = VUHDO_getSpellInfoSafe(16191);
VUHDO_SPELL_ID.BUFF_MANA_SPRING_TOTEM      = VUHDO_getSpellInfoSafe(381930);
VUHDO_SPELL_ID.BUFF_POISON_CLEANSING_TOTEM = VUHDO_getSpellInfoSafe(383013);

VUHDO_SPELL_ID.BUFF_HEROISM = VUHDO_getSpellInfoSafe(32182);
VUHDO_SPELL_ID.BUFF_BLOODLUST = VUHDO_getSpellInfoSafe(2825);
VUHDO_SPELL_ID.BUFF_EARTH_SHIELD = VUHDO_getSpellInfoSafe(204288);
VUHDO_SPELL_ID.BUFF_EARTH_SHIELD_ELEMENTAL_ORBIT = VUHDO_getSpellInfoSafe(383648);
VUHDO_SPELL_ID.BUFF_LIGHTNING_SHIELD = VUHDO_getSpellInfoSafe(192106);
VUHDO_SPELL_ID.BUFF_WATER_SHIELD = VUHDO_getSpellInfoSafe(52127);
VUHDO_SPELL_ID.WINDFURY_WEAPON = VUHDO_getSpellInfoSafe(33757);
VUHDO_SPELL_ID.FLAMETONGUE_WEAPON = VUHDO_getSpellInfoSafe(318038);
VUHDO_SPELL_ID.EARTHLIVING_WEAPON = VUHDO_getSpellInfoSafe(382021);
VUHDO_SPELL_ID.SKYFURY = VUHDO_getSpellInfoSafe(462854);


-- Paladin
VUHDO_SPELL_ID.BUFF_BEACON_OF_FAITH = VUHDO_getSpellInfoSafe(156910);
VUHDO_SPELL_ID.BUFF_BEACON_OF_LIGHT = VUHDO_getSpellInfoSafe(53563);
VUHDO_SPELL_ID.BUFF_STAY_OF_EXECUTION = VUHDO_getSpellInfoSafe(114917);
VUHDO_SPELL_ID.BUFF_GREATER_BLESSING_OF_KINGS = VUHDO_getSpellInfoSafe(203538);
VUHDO_SPELL_ID.BUFF_GREATER_BLESSING_OF_WISDOM = VUHDO_getSpellInfoSafe(203539);


-- Druid
VUHDO_SPELL_ID.BUFF_MARK_OF_THE_WILD = VUHDO_getSpellInfoSafe(1126);


-- Warlock
VUHDO_SPELL_ID.BUFF_GRIMOIRE_OF_SACRIFICE = VUHDO_getSpellInfoSafe(108503);


-- Mage
VUHDO_SPELL_ID.BUFF_ARCANE_BRILLIANCE  = VUHDO_getSpellInfoSafe(1459);
VUHDO_SPELL_ID.BUFF_ICE_BLOCK          = VUHDO_getSpellInfoSafe(45438);
VUHDO_SPELL_ID.BUFF_COMBUSTION         = VUHDO_getSpellInfoSafe(190319);
VUHDO_SPELL_ID.BUFF_SLOW_FALL          = VUHDO_getSpellInfoSafe(130);
VUHDO_SPELL_ID.BUFF_INVISIBILITY       = VUHDO_getSpellInfoSafe(66);
VUHDO_SPELL_ID.BUFF_ARCANE_FAMILIAR    = VUHDO_getSpellInfoSafe(205022);
VUHDO_SPELL_ID.BUFF_TIMEWARP           = VUHDO_getSpellInfoSafe(80353);


-- Death Knight
VUHDO_SPELL_ID.BUFF_BLOOD_PRESENCE  = VUHDO_getSpellInfoSafe(48263);


-- Warrior
VUHDO_SPELL_ID.BUFF_BATTLE_SHOUT     = VUHDO_getSpellInfoSafe(6673);
VUHDO_SPELL_ID.BUFF_COMMANDING_SHOUT = VUHDO_getSpellInfoSafe(97462);


-- Hunter
VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_CEETAH = VUHDO_getSpellInfoSafe(186257);
VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_CHAMELEON = VUHDO_getSpellInfoSafe(61648);
VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_EAGLE = VUHDO_getSpellInfoSafe(186289);
VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_TURTLE = VUHDO_getSpellInfoSafe(186265);
VUHDO_SPELL_ID.BUFF_ASPECT_OF_THE_WILD = VUHDO_getSpellInfoSafe(193530);
VUHDO_SPELL_ID.BUFF_ANCIENT_HYSTERIA = VUHDO_getSpellInfoSafe(90355);


-- Rogue
VUHDO_SPELL_ID.BUFF_TRICKS_OF_THE_TRADE = VUHDO_getSpellInfoSafe(57934);

VUHDO_SPELL_ID.BUFF_DEADLY_POISON = VUHDO_getSpellInfoSafe(2823);
VUHDO_SPELL_ID.BUFF_WOUND_POISON = VUHDO_getSpellInfoSafe(8679);
VUHDO_SPELL_ID.BUFF_INSTANT_POISON = VUHDO_getSpellInfoSafe(315584);

VUHDO_SPELL_ID.BUFF_CRIPPLING_POISON = VUHDO_getSpellInfoSafe(3408);
VUHDO_SPELL_ID.BUFF_NUMBING_POISON = VUHDO_getSpellInfoSafe(5761);
VUHDO_SPELL_ID.BUFF_ATROPHIC_POISON = VUHDO_getSpellInfoSafe(381637);


-- Monk


-- Evoker
VUHDO_SPELL_ID.BUFF_BLESSING_OF_THE_BRONZE = VUHDO_getSpellInfoSafe(364342);
VUHDO_SPELL_ID.BUFF_FURY_OF_THE_ASPECTS = VUHDO_getSpellInfoSafe(390386);


-- 6.2 Healer Legendary Ring
VUHDO_SPELL_ID.BUFF_ETHERALUS = VUHDO_getSpellInfoSafe(187805);


-- "Global Cooldown" spell
VUHDO_SPELL_ID.GLOBAL_COOLDOWN = 61304;


----------
-- Debuffs
----------


VUHDO_SPELL_ID.DEBUFF_WEAKENED_SOUL = VUHDO_getSpellInfoSafe(6788);
VUHDO_SPELL_ID.DEBUFF_FROST_BLAST = VUHDO_getSpellInfoSafe(27808);
VUHDO_SPELL_ID.DEBUFF_ANCIENT_HYSTERIA = VUHDO_getSpellInfoSafe(19372);
VUHDO_SPELL_ID.DEBUFF_IGNITE_MANA = VUHDO_getSpellInfoSafe(19659);
VUHDO_SPELL_ID.DEBUFF_TAINTED_MIND = VUHDO_getSpellInfoSafe(16567);
VUHDO_SPELL_ID.DEBUFF_VIPER_STING = VUHDO_getSpellInfoSafe(39413); -- MOP
VUHDO_SPELL_ID.DEBUFF_SILENCE = VUHDO_getSpellInfoSafe(30225);
VUHDO_SPELL_ID.DEBUFF_MAGMA_SHACKLES = VUHDO_getSpellInfoSafe(19496);
VUHDO_SPELL_ID.DEBUFF_FROSTBOLT = VUHDO_getSpellInfoSafe(116);
VUHDO_SPELL_ID.DEBUFF_PSYCHIC_HORROR = VUHDO_getSpellInfoSafe(64044);
VUHDO_SPELL_ID.DEBUFF_HUNTERS_MARK = VUHDO_getSpellInfoSafe(1130);
VUHDO_SPELL_ID.DEBUFF_SLOW = VUHDO_getSpellInfoSafe(31589);
VUHDO_SPELL_ID.DEBUFF_ARCANE_CHARGE = VUHDO_getSpellInfoSafe(36032);
VUHDO_SPELL_ID.DEBUFF_IMPOTENCE = VUHDO_getSpellInfoSafe(51340);
VUHDO_SPELL_ID.DEBUFF_DECAYED_STR = VUHDO_getSpellInfoSafe(35760);
VUHDO_SPELL_ID.DEBUFF_DECAYED_INT = VUHDO_getSpellInfoSafe(31555);
VUHDO_SPELL_ID.DEBUFF_CRIPPLE = VUHDO_getSpellInfoSafe(18381);
VUHDO_SPELL_ID.DEBUFF_CHILLED = VUHDO_getSpellInfoSafe(6136); -- MOP
VUHDO_SPELL_ID.DEBUFF_CONEOFCOLD = VUHDO_getSpellInfoSafe(120);
VUHDO_SPELL_ID.DEBUFF_CONCUSSIVESHOT = VUHDO_getSpellInfoSafe(5116);
VUHDO_SPELL_ID.DEBUFF_THUNDERCLAP = VUHDO_getSpellInfoSafe(8147);
VUHDO_SPELL_ID.DEBUFF_DAZED = VUHDO_getSpellInfoSafe(1604);
VUHDO_SPELL_ID.DEBUFF_FALTER = VUHDO_getSpellInfoSafe(32859);
VUHDO_SPELL_ID.DEBUFF_UNSTABLE_AFFL = VUHDO_getSpellInfoSafe(30108);
VUHDO_SPELL_ID.DEBUFF_DREAMLESS_SLEEP = VUHDO_getSpellInfoSafe(15822);
VUHDO_SPELL_ID.DEBUFF_GREATER_DREAMLESS = VUHDO_getSpellInfoSafe(24360);
VUHDO_SPELL_ID.DEBUFF_MAJOR_DREAMLESS = VUHDO_getSpellInfoSafe(28504);
VUHDO_SPELL_ID.DEBUFF_FROST_SHOCK = VUHDO_getSpellInfoSafe(46180);
VUHDO_SPELL_ID.DEBUFF_DELUSIONS_OF_JINDO = VUHDO_getSpellInfoSafe(24306);
VUHDO_SPELL_ID.DEBUFF_MIND_VISION = VUHDO_getSpellInfoSafe(2096);
VUHDO_SPELL_ID.DEBUFF_MUTATING_INJECTION = VUHDO_getSpellInfoSafe(28169);
VUHDO_SPELL_ID.DEBUFF_BANISH = VUHDO_getSpellInfoSafe(8994);
VUHDO_SPELL_ID.DEBUFF_PHASE_SHIFT = VUHDO_getSpellInfoSafe(8611);
VUHDO_SPELL_ID.DEBUFF_SONIC_BURST = VUHDO_getSpellInfoSafe(64140);
VUHDO_SPELL_ID.DEBUFF_MARK_OF_THE_NECROMANCER = VUHDO_getSpellInfoSafe(184450);
VUHDO_SPELL_ID.DEBUFF_BEFOULED = VUHDO_getSpellInfoSafe(189030);
VUHDO_SPELL_ID.DEBUFF_TOUCH_OF_HARM = VUHDO_getSpellInfoSafe(180164);
VUHDO_SPELL_ID.DEBUFF_MARK_OF_DOOM = VUHDO_getSpellInfoSafe(181099);
VUHDO_SPELL_ID.DEBUFF_MOMENTUM = VUHDO_getSpellInfoSafe(198108);
VUHDO_SPELL_ID.DEBUFF_OVERFLOW = VUHDO_getSpellInfoSafe(221772);
VUHDO_SPELL_ID.DEBUFF_SHADOW_LICK = VUHDO_getSpellInfoSafe(228253);
VUHDO_SPELL_ID.DEBUFF_CORRUPTED_AXION = VUHDO_getSpellInfoSafe(232450);
VUHDO_SPELL_ID.DEBUFF_TIME_RELEASE = VUHDO_getSpellInfoSafe(206609);
VUHDO_SPELL_ID.DEBUFF_EMBRACE_OF_THE_ECLIPSE = VUHDO_getSpellInfoSafe(233263);
VUHDO_SPELL_ID.DEBUFF_CHILLED_BLOOD = VUHDO_getSpellInfoSafe(245586);
VUHDO_SPELL_ID.DEBUFF_IMMUNOSUPPRESSION = VUHDO_getSpellInfoSafe(265206);
VUHDO_SPELL_ID.DEBUFF_DECAYING_MIND = VUHDO_getSpellInfoSafe(278961);
VUHDO_SPELL_ID.DEBUFF_UMBRAL_SHELL = VUHDO_getSpellInfoSafe(284722);
VUHDO_SPELL_ID.DEBUFF_UNLEASHED_VOID = VUHDO_getSpellInfoSafe(306184);
VUHDO_SPELL_ID.DEBUFF_CLOAK_OF_FLAMES = VUHDO_getSpellInfoSafe(338600);
VUHDO_SPELL_ID.DEBUFF_NECROTIC_BOLT = VUHDO_getSpellInfoSafe(320462);
VUHDO_SPELL_ID.DEBUFF_NECROTIC_BOLT_VOLLEY = VUHDO_getSpellInfoSafe(330868);
VUHDO_SPELL_ID.DEBUFF_NECROTIC_WOUND = VUHDO_getSpellInfoSafe(223929);
VUHDO_SPELL_ID.DEBUFF_FATIGUED = VUHDO_getSpellInfoSafe(264689);
VUHDO_SPELL_ID.DEBUFF_VEIL_OF_DARKNESS = VUHDO_getSpellInfoSafe(347704);
VUHDO_SPELL_ID.DEBUFF_DESTABILIZE = VUHDO_getSpellInfoSafe(351091);



--
VUHDO_NAME_TO_SPELL = {
	[VUHDO_SPELL_ID.ETERNAL_FLAME] = VUHDO_SPELL_ID.WORD_OF_GLORY,
	[VUHDO_SPELL_ID.HOLY_WORD_SANCTUARY] = VUHDO_SPELL_ID.HOLY_WORD_CHASTISE,
	[VUHDO_SPELL_ID.FAERIE_SWARM] = VUHDO_SPELL_ID.FAERIE_FIRE,
	[VUHDO_SPELL_ID.HOLY_FIRE] = VUHDO_SPELL_ID.MIND_BLAST,
	[VUHDO_SPELL_ID.PURGE_THE_WICKED] = VUHDO_SPELL_ID.SHADOW_WORD_PAIN,
	[VUHDO_SPELL_ID.ANCIENT_MISTWEAVER_ARTS] = VUHDO_SPELL_ID.SOOTHING_MIST_HONOR_TALENT, 
	[VUHDO_SPELL_ID.CONCUSSIVE_SHOT] = VUHDO_SPELL_ID.WING_CLIP,
	[VUHDO_SPELL_ID.NATURALIZE] = VUHDO_SPELL_ID.EXPUNGE,
	[VUHDO_SPELL_ID.HOLY_WORD_SALVATION] = VUHDO_SPELL_ID.APOTHEOSIS,
};



--
VUHDO_REPLACE_SPELL_NAME = {
	[VUHDO_SPELL_ID.HOLY_WORD_SANCTUARY] = VUHDO_SPELL_ID.HOLY_WORD_CHASTISE,
	[VUHDO_SPELL_ID.PURGE_THE_WICKED] = VUHDO_SPELL_ID.SHADOW_WORD_PAIN,
	[VUHDO_SPELL_ID.ANCIENT_MISTWEAVER_ARTS] = VUHDO_SPELL_ID.SOOTHING_MIST_HONOR_TALENT, 
	[VUHDO_SPELL_ID.CONCUSSIVE_SHOT] = VUHDO_SPELL_ID.WING_CLIP,
};



--
VUHDO_NATIVE_ASSIGN_SPELLS = {
	[VUHDO_SPELL_ID.SOULSTONE] = true, -- wirkt auf tote und lebendige
--	[VUHDO_SPELL_ID.SURGING_MIST] = true, -- wird instant bei soothing mist
--	[VUHDO_SPELL_ID.ENVELOPING_MIST] = true,
};
