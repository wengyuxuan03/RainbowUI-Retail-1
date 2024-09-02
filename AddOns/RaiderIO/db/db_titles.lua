--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local _, ns = ...

ns.CUSTOM_TITLES = {
	[1] = { "CHARACTER_LF_GUILD_RAID_MYTHIC", nil },
	[2] = { "CHARACTER_LF_GUILD_RAID_HEROIC", nil },
	[3] = { "CHARACTER_LF_GUILD_RAID_NORMAL", nil },
	[4] = { "CHARACTER_LF_GUILD_RAID_DEFAULT", nil },
	[5] = { "CHARACTER_LF_GUILD_MPLUS", nil },
	[6] = { "CHARACTER_LF_GUILD_SOCIAL", nil },
	[7] = { "CHARACTER_LF_GUILD_PVP", nil },
	[8] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 3000 },
	[9] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2950 },
	[10] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2900 },
	[11] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2850 },
	[12] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2800 },
	[13] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2750 },
	[14] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2700 },
	[15] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2650 },
	[16] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2600 },
	[17] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2550 },
	[18] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2500 },
	[19] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2450 },
	[20] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2400 },
	[21] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2350 },
	[22] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2300 },
	[23] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2250 },
	[24] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2200 },
	[25] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2150 },
	[26] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2100 },
	[27] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2050 },
	[28] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 2000 },
	[29] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1950 },
	[30] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1900 },
	[31] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1850 },
	[32] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1800 },
	[33] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1750 },
	[34] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1700 },
	[35] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1650 },
	[36] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1600 },
	[37] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1550 },
	[38] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1500 },
	[39] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1450 },
	[40] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1400 },
	[41] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1350 },
	[42] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1300 },
	[43] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1250 },
	[44] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1200 },
	[45] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1150 },
	[46] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1100 },
	[47] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1050 },
	[48] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 1000 },
	[49] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 950 },
	[50] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 900 },
	[51] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 850 },
	[52] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 800 },
	[53] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 750 },
	[54] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 700 },
	[55] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 650 },
	[56] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 600 },
	[57] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 550 },
	[58] = { "CHARACTER_LF_TEAM_MPLUS_WITH_SCORE", 500 },
	[59] = { "CHARACTER_LF_TEAM_MPLUS_DEFAULT", nil },
	[60] = { "GUILD_LF_RAID_MYTHIC", nil },
	[61] = { "GUILD_LF_RAID_HEROIC", nil },
	[62] = { "GUILD_LF_RAID_NORMAL", nil },
	[63] = { "GUILD_LF_RAID_DEFAULT", nil },
	[64] = { "GUILD_LF_MPLUS_WITH_SCORE", 3000 },
	[65] = { "GUILD_LF_MPLUS_WITH_SCORE", 2950 },
	[66] = { "GUILD_LF_MPLUS_WITH_SCORE", 2900 },
	[67] = { "GUILD_LF_MPLUS_WITH_SCORE", 2850 },
	[68] = { "GUILD_LF_MPLUS_WITH_SCORE", 2800 },
	[69] = { "GUILD_LF_MPLUS_WITH_SCORE", 2750 },
	[70] = { "GUILD_LF_MPLUS_WITH_SCORE", 2700 },
	[71] = { "GUILD_LF_MPLUS_WITH_SCORE", 2650 },
	[72] = { "GUILD_LF_MPLUS_WITH_SCORE", 2600 },
	[73] = { "GUILD_LF_MPLUS_WITH_SCORE", 2550 },
	[74] = { "GUILD_LF_MPLUS_WITH_SCORE", 2500 },
	[75] = { "GUILD_LF_MPLUS_WITH_SCORE", 2450 },
	[76] = { "GUILD_LF_MPLUS_WITH_SCORE", 2400 },
	[77] = { "GUILD_LF_MPLUS_WITH_SCORE", 2350 },
	[78] = { "GUILD_LF_MPLUS_WITH_SCORE", 2300 },
	[79] = { "GUILD_LF_MPLUS_WITH_SCORE", 2250 },
	[80] = { "GUILD_LF_MPLUS_WITH_SCORE", 2200 },
	[81] = { "GUILD_LF_MPLUS_WITH_SCORE", 2150 },
	[82] = { "GUILD_LF_MPLUS_WITH_SCORE", 2100 },
	[83] = { "GUILD_LF_MPLUS_WITH_SCORE", 2050 },
	[84] = { "GUILD_LF_MPLUS_WITH_SCORE", 2000 },
	[85] = { "GUILD_LF_MPLUS_WITH_SCORE", 1950 },
	[86] = { "GUILD_LF_MPLUS_WITH_SCORE", 1900 },
	[87] = { "GUILD_LF_MPLUS_WITH_SCORE", 1850 },
	[88] = { "GUILD_LF_MPLUS_WITH_SCORE", 1800 },
	[89] = { "GUILD_LF_MPLUS_WITH_SCORE", 1750 },
	[90] = { "GUILD_LF_MPLUS_WITH_SCORE", 1700 },
	[91] = { "GUILD_LF_MPLUS_WITH_SCORE", 1650 },
	[92] = { "GUILD_LF_MPLUS_WITH_SCORE", 1600 },
	[93] = { "GUILD_LF_MPLUS_WITH_SCORE", 1550 },
	[94] = { "GUILD_LF_MPLUS_WITH_SCORE", 1500 },
	[95] = { "GUILD_LF_MPLUS_WITH_SCORE", 1450 },
	[96] = { "GUILD_LF_MPLUS_WITH_SCORE", 1400 },
	[97] = { "GUILD_LF_MPLUS_WITH_SCORE", 1350 },
	[98] = { "GUILD_LF_MPLUS_WITH_SCORE", 1300 },
	[99] = { "GUILD_LF_MPLUS_WITH_SCORE", 1250 },
	[100] = { "GUILD_LF_MPLUS_WITH_SCORE", 1200 },
	[101] = { "GUILD_LF_MPLUS_WITH_SCORE", 1150 },
	[102] = { "GUILD_LF_MPLUS_WITH_SCORE", 1100 },
	[103] = { "GUILD_LF_MPLUS_WITH_SCORE", 1050 },
	[104] = { "GUILD_LF_MPLUS_WITH_SCORE", 1000 },
	[105] = { "GUILD_LF_MPLUS_WITH_SCORE", 950 },
	[106] = { "GUILD_LF_MPLUS_WITH_SCORE", 900 },
	[107] = { "GUILD_LF_MPLUS_WITH_SCORE", 850 },
	[108] = { "GUILD_LF_MPLUS_WITH_SCORE", 800 },
	[109] = { "GUILD_LF_MPLUS_WITH_SCORE", 750 },
	[110] = { "GUILD_LF_MPLUS_WITH_SCORE", 700 },
	[111] = { "GUILD_LF_MPLUS_WITH_SCORE", 650 },
	[112] = { "GUILD_LF_MPLUS_WITH_SCORE", 600 },
	[113] = { "GUILD_LF_MPLUS_WITH_SCORE", 550 },
	[114] = { "GUILD_LF_MPLUS_WITH_SCORE", 500 },
	[115] = { "GUILD_LF_MPLUS_DEFAULT", nil },
	[116] = { "GUILD_LF_SOCIAL", nil },
	[117] = { "GUILD_LF_PVP", nil },
	[118] = { "TEAM_LF_MPLUS_WITH_SCORE", 3000 },
	[119] = { "TEAM_LF_MPLUS_WITH_SCORE", 2950 },
	[120] = { "TEAM_LF_MPLUS_WITH_SCORE", 2900 },
	[121] = { "TEAM_LF_MPLUS_WITH_SCORE", 2850 },
	[122] = { "TEAM_LF_MPLUS_WITH_SCORE", 2800 },
	[123] = { "TEAM_LF_MPLUS_WITH_SCORE", 2750 },
	[124] = { "TEAM_LF_MPLUS_WITH_SCORE", 2700 },
	[125] = { "TEAM_LF_MPLUS_WITH_SCORE", 2650 },
	[126] = { "TEAM_LF_MPLUS_WITH_SCORE", 2600 },
	[127] = { "TEAM_LF_MPLUS_WITH_SCORE", 2550 },
	[128] = { "TEAM_LF_MPLUS_WITH_SCORE", 2500 },
	[129] = { "TEAM_LF_MPLUS_WITH_SCORE", 2450 },
	[130] = { "TEAM_LF_MPLUS_WITH_SCORE", 2400 },
	[131] = { "TEAM_LF_MPLUS_WITH_SCORE", 2350 },
	[132] = { "TEAM_LF_MPLUS_WITH_SCORE", 2300 },
	[133] = { "TEAM_LF_MPLUS_WITH_SCORE", 2250 },
	[134] = { "TEAM_LF_MPLUS_WITH_SCORE", 2200 },
	[135] = { "TEAM_LF_MPLUS_WITH_SCORE", 2150 },
	[136] = { "TEAM_LF_MPLUS_WITH_SCORE", 2100 },
	[137] = { "TEAM_LF_MPLUS_WITH_SCORE", 2050 },
	[138] = { "TEAM_LF_MPLUS_WITH_SCORE", 2000 },
	[139] = { "TEAM_LF_MPLUS_WITH_SCORE", 1950 },
	[140] = { "TEAM_LF_MPLUS_WITH_SCORE", 1900 },
	[141] = { "TEAM_LF_MPLUS_WITH_SCORE", 1850 },
	[142] = { "TEAM_LF_MPLUS_WITH_SCORE", 1800 },
	[143] = { "TEAM_LF_MPLUS_WITH_SCORE", 1750 },
	[144] = { "TEAM_LF_MPLUS_WITH_SCORE", 1700 },
	[145] = { "TEAM_LF_MPLUS_WITH_SCORE", 1650 },
	[146] = { "TEAM_LF_MPLUS_WITH_SCORE", 1600 },
	[147] = { "TEAM_LF_MPLUS_WITH_SCORE", 1550 },
	[148] = { "TEAM_LF_MPLUS_WITH_SCORE", 1500 },
	[149] = { "TEAM_LF_MPLUS_WITH_SCORE", 1450 },
	[150] = { "TEAM_LF_MPLUS_WITH_SCORE", 1400 },
	[151] = { "TEAM_LF_MPLUS_WITH_SCORE", 1350 },
	[152] = { "TEAM_LF_MPLUS_WITH_SCORE", 1300 },
	[153] = { "TEAM_LF_MPLUS_WITH_SCORE", 1250 },
	[154] = { "TEAM_LF_MPLUS_WITH_SCORE", 1200 },
	[155] = { "TEAM_LF_MPLUS_WITH_SCORE", 1150 },
	[156] = { "TEAM_LF_MPLUS_WITH_SCORE", 1100 },
	[157] = { "TEAM_LF_MPLUS_WITH_SCORE", 1050 },
	[158] = { "TEAM_LF_MPLUS_WITH_SCORE", 1000 },
	[159] = { "TEAM_LF_MPLUS_WITH_SCORE", 950 },
	[160] = { "TEAM_LF_MPLUS_WITH_SCORE", 900 },
	[161] = { "TEAM_LF_MPLUS_WITH_SCORE", 850 },
	[162] = { "TEAM_LF_MPLUS_WITH_SCORE", 800 },
	[163] = { "TEAM_LF_MPLUS_WITH_SCORE", 750 },
	[164] = { "TEAM_LF_MPLUS_WITH_SCORE", 700 },
	[165] = { "TEAM_LF_MPLUS_WITH_SCORE", 650 },
	[166] = { "TEAM_LF_MPLUS_WITH_SCORE", 600 },
	[167] = { "TEAM_LF_MPLUS_WITH_SCORE", 550 },
	[168] = { "TEAM_LF_MPLUS_WITH_SCORE", 500 },
	[169] = { "TEAM_LF_MPLUS_DEFAULT", nil },
}
