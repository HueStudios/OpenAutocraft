(local recipes {})

(set recipes.items
  [
    [:mc_stick "minecraft:stick:Stick"]
    [:mc_planks "minecraft:planks:Oak Wood Planks"]
    [:mc_log "minecraft:log:Oak Wood"]
    [:mc_dust_redstone "minecraft:redstone:Redstone"]
    [:mc_ingot_iron "minecraft:iron_ingot:Iron Ingot"]
    [:mc_cobblestone "minecraft:cobblestone:Cobblestone"]
    [:mc_piston "minecraft:piston:Piston"]
    [:mc_stone "minecraft:stone:Stone"]
    [:mc_button_stone "minecraft:stone_button:Button"]
    [:oc_keyboard "opencomputers:keyboard:Keyboard"]
    [:oc_buttongroup "opencomputers:material:Button Group"]
    [:oc_arrowkeys "opencomputers:material:Arrow Keys"]
    [:oc_numerickeypad "opencomputers:material:Numeric Keypad"]
    [:oc_cuttingwire "opencomputers:material:Cutting Wire"]
    [:oc_nugget_diamond "opencomputers:material:Diamond Chip"]
    [:mc_ingot_gold "minecraft:gold_ingot:Gold Ingot"]
    [:mc_nugget_gold "minecraft:gold_nugget:Gold Nugget"]
    [:mc_paper "minecraft:paper:Paper"]
    [:oc_transistor "opencomputers:material:Transistor"]
    [:mc_clock "minecraft:clock:Clock"]
    [:mc_nugget_iron "minecraft:iron_nugget:Iron Nugget"]
    [:oc_chip1 "opencomputers:material:Microchip (Tier 1)"]
    [:oc_chip2 "opencomputers:material:Microchip (Tier 2)"]
    [:oc_chip3 "opencomputers:material:Microchip (Tier 3)"]
    [:oc_cpu3 "opencomputers:component:Central Processing Unit (CPU) (Tier 3)"]
    [:oc_alu "opencomputers:material:Arithmetic Logic Unit (ALU)"]
    [:oc_cu "opencomputers:material:Control Unit (CU)"]
    [:mc_diamond "minecraft:diamond:Diamond"]])


(set recipes.recipes
  [
    { :kind "craft" ;"craft" as default ?
      :maxbatch 64 ;64 as default
      :minbatch 1 ;1 as default
      :gamble false ;false as default
      :pattern
        [ 0 0 0
          0 0 0
          0 0 0]
      :result {}}

    { :kind "craft"
      :pattern
        [ 0 0 0
          0 0 0
          0 0 0]
      :result {}}

    ;START
    { :kind "craft"
      :pattern
        [ :mc_log 0 0
          0 0 0
          0 0 0]
      :result {:mc_planks 4}}

    { :kind "craft"
      :pattern
        [ :mc_planks 0 0
          :mc_planks 0 0
          0 0 0]
      :result {:mc_stick 4}}

    { :kind "craft"
      :pattern
        [ :mc_planks :mc_planks :mc_planks
          :mc_cobblestone :mc_ingot_iron :mc_cobblestone
          :mc_cobblestone :mc_dust_redstone :mc_cobblestone]
      :result {:mc_piston 1}}

    { :kind "craft"
      :pattern
        [ :mc_stone 0 0
          0 0 0
          0 0 0]
      :result {:mc_button_stone 1}}

    { :kind "craft"
      :pattern
        [ 0 0 0
          :mc_button_stone :mc_button_stone :mc_button_stone
          :mc_button_stone :mc_button_stone :mc_button_stone]
      :result {:oc_buttongroup 1}}

    { :kind "craft"
      :pattern
        [ 0 0 0
          0 :mc_button_stone 0
          :mc_button_stone :mc_button_stone :mc_button_stone]
      :result {:oc_arrowkeys 1}}

    { :kind "craft"
      :pattern
        [ :mc_button_stone :mc_button_stone :mc_button_stone
          :mc_button_stone :mc_button_stone :mc_button_stone
          :mc_button_stone :mc_button_stone :mc_button_stone]
      :result {:oc_numerickeypad 1}}

    { :kind "craft"
      :pattern
        [ 0 0 0
          :oc_buttongroup :oc_buttongroup :oc_buttongroup
          :oc_buttongroup :oc_arrowkeys :oc_numerickeypad]
      :result {:oc_keyboard 1}}

    { :kind "craft"
      :pattern
        [ :oc_nugget_diamond :mc_dust_redstone :oc_nugget_diamond
          :oc_chip3 :oc_cu :oc_chip3
          :oc_nugget_diamond :oc_alu :oc_nugget_diamond]
      :result {:oc_cpu3 1}}

    { :kind "craft"
      :pattern
        [ 0 0 0
          :mc_stick :mc_nugget_iron :mc_stick
          0 0 0]
      :result {:oc_cuttingwire 1}}

    { :kind "craft"
      :pattern
        [ :oc_cuttingwire :mc_diamond 0
          0 0 0
          0 0 0]
      :result {:oc_nugget_diamond 6}}

    { :kind "craft"
      :pattern
        [ :oc_nugget_diamond :oc_nugget_diamond :oc_nugget_diamond
          :mc_dust_redstone :oc_transistor :mc_dust_redstone
          :oc_nugget_diamond :oc_nugget_diamond :oc_nugget_diamond]
      :result {:oc_chip3 2}}

    { :kind "craft"
      :pattern
        [ 0 :mc_ingot_gold 0
          :mc_ingot_gold :mc_dust_redstone :mc_ingot_gold
          0 :mc_ingot_gold 0]
      :result {:mc_clock 1}}

    { :kind "craft"
      :pattern
        [ :mc_nugget_gold :mc_dust_redstone :mc_nugget_gold
          :oc_transistor :mc_clock :oc_transistor
          :mc_nugget_gold :oc_transistor :mc_nugget_gold]
      :result {:oc_cu 1}}

    { :kind "craft"
      :pattern
        [ :mc_nugget_iron :mc_dust_redstone :mc_nugget_iron
          :oc_transistor :oc_chip1 :oc_transistor
          :mc_nugget_iron :oc_transistor :mc_nugget_iron]
      :result {:oc_alu 1}}

    { :kind "craft"
      :pattern
        [ :mc_nugget_iron :mc_nugget_iron :mc_nugget_iron
          :mc_dust_redstone :oc_transistor :mc_dust_redstone
          :mc_nugget_iron :mc_nugget_iron :mc_nugget_iron]
      :result {:oc_chip1 8}}

    { :kind "craft"
      :pattern
        [ :mc_ingot_gold 0 0
          0 0 0
          0 0 0]
      :result {:mc_nugget_gold 9}}

    { :kind "craft"
      :pattern
        [ :mc_ingot_iron 0 0
          0 0 0
          0 0 0]
      :result {:mc_nugget_iron 9}}

    { :kind "craft"
      :pattern
        [ :mc_ingot_iron :mc_ingot_iron :mc_ingot_iron
          :mc_nugget_gold :mc_paper :mc_nugget_gold
          0 :mc_dust_redstone 0]
      :result {:oc_transistor 8}}

    { :kind "craft"
      :pattern
        [ 0 0 0
          0 0 0
          0 0 0]
      :result {}}

    { :kind "craft"
      :pattern
        [ 0 0 0
          0 0 0
          0 0 0]
      :result {}}])




recipes
