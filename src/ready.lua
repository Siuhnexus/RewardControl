---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- here is where your mod sets up all the things it will do.
-- this file will not be reloaded if it changes during gameplay
-- 	so you will most likely want to have it reference
--	values and functions later defined in `reload.lua`.

ModUtil.mod.Path.Wrap("ShowBoonInfoScreen", function(base, lootName, codexScreen, codexEntryName, codexEntryData)
	return patch_ShowBoonInfoScreen(base, lootName, codexScreen, codexEntryName, codexEntryData)
end)

table.insert(Game.CodexOrdering.Order, "Siuhnexus_RewardControl_RewardAlgorithms")
Game.CodexOrdering.Siuhnexus_RewardControl_RewardAlgorithms = {
	"Important Info", "Run Progress", "World Shop"
}

local chapterEntries = {}
chapterEntries["Important Info"] = {
	Entries =
	{
		{
			UnlockGameStateRequirements = {},
			Text = "{#CodexItalicFormat}Every reward type is weighted. Please note that changing the weights (in the offerings menu of the following codex entries) removes some restrictions on some rewards. For example, usually hammers can only be offered once per underworld region and only twice per run. However, in order to always have a reward to choose regardless of the weight configuration these restrictions have to be lifted.",
		},
	},
	Image = "Codex_Portrait_ChaosBiome",
}
chapterEntries["Run Progress"] = {
	Entries =
	{
		{
			UnlockGameStateRequirements = {},
			Text = "{#CodexItalicFormat}This determines most room rewards.",
		},
	},
	Image = "Codex_Portrait_BiomeErebus",
	BoonInfoLootName = "Siuhnexus-RewardControl_RunProgress",
}
chapterEntries["World Shop"] = {
	Entries =
	{
		{
			UnlockGameStateRequirements = {},
			Text = "{#CodexItalicFormat}This determines charon's regular underworld shops.",
		},
	},
	Image = "Codex_Portrait_Charon",
	BoonInfoLootName = "Siuhnexus-RewardControl_WorldShop",
}
Game.CodexData.Siuhnexus_RewardControl_RewardAlgorithms = {
	TitleText = "Reward Algorithms",
	Icon = "GUI\\Screens\\Codex\\Icon-Weapons",
	Entries = chapterEntries
}

table.insert(Game.ScreenData.Codex.Tabs,  { X = -15, Y = -88, Animation = "GUI\\Screens\\Codex\\CategoryTab1", Highlight = "GUI\\Screens\\Codex\\CategoryTabHighlight1", Active = "GUI\\Screens\\Codex\\CategoryTabActiveHighlightOverlay1" })
