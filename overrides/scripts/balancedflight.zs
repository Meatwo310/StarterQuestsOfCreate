import mods.create.MechanicalCrafterManager;

<recipetype:create:mechanical_crafting>.removeByName("create:mechanical_crafting/ascended_flight_ring");
craftingTable.addShaped("ascended_flight_ring", <item:balancedflight:ascended_flight_ring>, [
  [<item:minecraft:gold_block>, <item:minecraft:gold_block>, <item:minecraft:gold_block>],
  [<item:balancedflight:flight_anchor>, <item:minecraft:elytra>, <item:balancedflight:flight_anchor>],
  [<item:minecraft:gold_block>, <item:minecraft:gold_block>, <item:minecraft:gold_block>]
]);
