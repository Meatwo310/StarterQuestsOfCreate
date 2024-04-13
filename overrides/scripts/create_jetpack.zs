import mods.create.MechanicalCrafterManager;

<recipetype:create:mechanical_crafting>.removeByName("create_jetpack:jetpack");
craftingTable.addShaped("jetpack_easy", <item:create_jetpack:jetpack>, [
  [<item:minecraft:iron_nugget>, <item:create:golden_sheet>, <item:minecraft:iron_nugget>],
  [<item:create:cogwheel>, <item:create:copper_backtank>, <item:create:cogwheel>],
  [<item:create:chute>, <item:create:golden_sheet>, <item:create:chute>]
]);

<recipetype:create:mechanical_crafting>.removeByName("create_jetpack:netherite_jetpack");
craftingTable.addShaped("netherite_jetpack_easy", <item:create_jetpack:netherite_jetpack>, [
  [<item:minecraft:iron_nugget>, <item:create:golden_sheet>, <item:minecraft:iron_nugget>],
  [<item:create:cogwheel>, <item:create:netherite_backtank>, <item:create:cogwheel>],
  [<item:create:chute>, <item:create:golden_sheet>, <item:create:chute>]
]);

