---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- this file will be reloaded if it changes during gameplay,
-- 	so only assign to values or define things here.

function patch_ShowBoonInfoScreen(base, lootName, codexScreen, codexEntryName, codexEntryData)
	printMsg("%s", lootName)
	if string.find(lootName, "Siuhnexus%-RewardControl") == nil then
		base(lootName, codexScreen, codexEntryName, codexEntryData)
		return
	end
	printMsg("Weight Info Open Trigger")
end