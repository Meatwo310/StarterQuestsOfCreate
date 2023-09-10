import mods.create.SequencedAssemblyManager;
import mods.createtweaker.SequencedAssemblyRecipeBuilder;

/*
craftingTable.removeByName("minecraft:candle");
craftingTable.addShaped("candle_x8", <item:minecraft:candle> * 8, [
  [<item:minecraft:string>],
  [<item:minecraft:honeycomb>]
]);
*/

/*
craftingTable.addShapeless("candle_from_torch", <item:minecraft:candle>, [
  <item:minecraft:torch>
]);
*/

// Japanese Traditional Candle, Warosoku
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("seq_japanese_candle")
  .transitionTo(<item:minecraft:bamboo>)
  .require(<item:minecraft:bamboo>)
  .loops(1)
  .addOutput(<item:minecraft:candle> * 2, 1)
  .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:paper>))
  .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:rope>))
  .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:white_carpet>))
  .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create_confectionery:cocoa_butter>))
  .addStep<mods.createtweaker.PressingRecipe>()
);

// Shotgun Shell without Candle
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("seq_shotgun_shell_from_gold_nugget")
  .transitionTo(<item:createarmory:unfinished_shotgun_shell>)
  .require(<item:minecraft:gold_nugget>)
  .loops(1)
  .addOutput(<item:createarmory:shotgun_shell>, 1)
  .addStep<mods.createtweaker.PressingRecipe>()
  .addStep<mods.createtweaker.FillingRecipe>((rb) => rb.require(<fluid:createarmory:molten_brass> * 50))
  .addStep<mods.createtweaker.PressingRecipe>()
  .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:gunpowder>))
  .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:redstone>))
  .addStep<mods.createtweaker.PressingRecipe>()
);

/*
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("seq_tmp")
  .transitionTo(<item:minecraft:dragon_egg>)
  .require(<item:minecraft:dragon_egg>)
  .loops(1)
  .addOutput(<item:minecraft:candle>, 1)
  .addStep<mods.createtweaker.PressingRecipe>()
  .addStep<mods.createtweaker.CuttingRecipe>((rb) => rb.duration(50))
  .addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:minecraft:wooden_buttons>))
  .addStep<mods.createtweaker.FillingRecipe>((rb) => rb.require(<fluid:minecraft:water> * 50))
);
*/