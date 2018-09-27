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
    [:oc_numerickeypad "opencomputers:material:Numeric Keypad"]])

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
        [ 0 0 0
          0 0 0
          0 0 0]
      :result {}}])




recipes
