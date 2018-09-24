(local seeds {})

(set seeds.items
  [
    "immersiveengineering:conveyor:Conveyor Belt"
    "immersiveengineering:material:Iron Mechanical Component"
    "immersiveengineering:metal:Copper Ingot"
    "immersiveengineering:metal:Iron Plate"
    "immersiveengineering:treated_wood:Treated Wood Planks"
    "immersiveengineering:wooden_device0:Item Router"
    "minecraft:bow:Bow"
    "minecraft:bucket:Bucket"
    "minecraft:chest:Oak Chest"
    "minecraft:cobblestone:Cobblestone"
    "minecraft:diamond:Diamond"
    "minecraft:dispenser:Dispenser"
    "minecraft:dropper:Dropper"
    "minecraft:glass_bottle:Glass Bottle"
    "minecraft:glass:Glass"
    "minecraft:gold_ingot:Gold Ingot"
    "minecraft:gold_nugget:Gold Nugget"
    "minecraft:hopper:Hopper"
    "minecraft:iron_ingot:Iron Ingot"
    "minecraft:iron_nugget:Iron Nugget"
    "minecraft:ladder:Ladder"
    "minecraft:leather:Leather"
    "minecraft:log:Oak Wood"
    "minecraft:paper:Paper"
    "minecraft:piston:Piston"
    "minecraft:planks:Oak Wood Planks"
    "minecraft:redstone_torch:Redstone Torch"
    "minecraft:redstone:Redstone"
    "minecraft:reeds:Sugar Canes"
    "minecraft:stick:Stick"
    "minecraft:string:String"
    "opencomputers:component:Component Bus (Tier 3)"
    "opencomputers:component:Component Bus (Tier 2)"
    "opencomputers:component:Memory (Tier 3.5)"
    "opencomputers:component:Memory (Tier 2)"
    "opencomputers:component:Server (Tier 3)"
    "opencomputers:material:Control Unit (CU)"
    "opencomputers:material:Cutting Wire"
    "opencomputers:material:Diamond Chip"
    "opencomputers:material:Microchip (Tier 1)"
    "opencomputers:material:Microchip (Tier 2)"
    "opencomputers:material:Microchip (Tier 3)"
    "opencomputers:material:Printed Circuit Board (PCB)"
    "opencomputers:material:Transistor"
    "opencomputers:tool:Analyzer"
    "opencomputers:transposer:Transposer"
    "opencomputers:upgrade:Inventory Controller Upgrade"
    "opencomputers:upgrade:Tank Controller Upgrade"
    "minecraft:obsidian:Obsidian"
    "minecraft:iron_bars:Iron Bars"
    "opencomputers:card:Wireless Network Card (Tier 2)"
    "opencomputers:relay:Relay"
    "opencomputers:powerdistributor:Power Distributor"
    "minecraft:ender_pearl:Ender Pearl"
    "opencomputers:material:Card Base"
    "opencomputers:cable:Cable"
    "opencomputers:card:Network Card"
    "opencomputers:rack:Rack"
    "minecraft:clock:Clock"
    "opencomputers:component:Central Processing Unit (CPU) (Tier 3)"
    "opencomputers:material:Arithmetic Logic Unit (ALU)"
    "opencomputers:card:Graphics Card (Tier 2)"
    "opencomputers:component:Accelerated Processing Unit (APU) (Tier 2)"
    "minecraft:glowstone_dust:Glowstone Dust"
    "opencomputers:screen3:Screen (Tier 3)"
    "opencomputers:upgrade:Generator Upgrade"
    "opencomputers:capacitor:Capacitor"
    "opencomputers:upgrade:Battery Upgrade (Tier 1)"
    "opencomputers:upgrade:Battery Upgrade (Tier 2)"
    "opencomputers:upgrade:Battery Upgrade (Tier 3)"
    "minecraft:iron_bars:Iron Bars"
    "opencomputers:charger:Charger"
    "enderio:item_material:Grains of Infinity"
    "enderio:item_basic_capacitor:Basic Capacitor"
    "enderio:item_basic_capacitor:Double-Layer Capacitor"
    "enderio:item_basic_capacitor:Octadic Capacitor"
    "enderio:item_alloy_ingot:Energetic Alloy Ingot"
    "enderio:item_alloy_ingot:Vibrant Alloy Ingot"
    "actuallyadditions:item_dust:Crushed Coal"
    "minecraft:glowstone:Glowstone"
    "opencomputers:material:Button Group"
    "opencomputers:material:Arrow Keys"
    "opencomputers:material:Numeric Keypad"
    "minecraft:stone:Stone"
    "minecraft:stone_button:Button"
    "opencomputers:keyboard:Keyboard"
    ""])


(set seeds.recipes
  [
    { :pattern
      [ 0 0 0
        0 0 0
        0 0 0]
      :result {}}

    { :pattern
      [ "minecraft:log:Oak Wood" 0 0
        0 0 0
        0 0 0]
      :result {"minecraft:planks:Oak Wood Planks" 4}}

    { :pattern
      [ "minecraft:planks:Oak Wood Planks" 0 0
        "minecraft:planks:Oak Wood Planks" 0 0
        0 0 0]
      :result {"minecraft:stick:Stick" 4}}

    { :pattern
      [ "minecraft:stick:Stick" 0 "minecraft:stick:Stick"
        "minecraft:stick:Stick" "minecraft:stick:Stick" "minecraft:stick:Stick"
        "minecraft:stick:Stick" 0 "minecraft:stick:Stick"]
      :result {"minecraft:ladder:Ladder" 3}}

    { :pattern
      [ 0 0 0
        "minecraft:reeds:Sugar Canes" "minecraft:reeds:Sugar Canes" "minecraft:reeds:Sugar Canes"
        0 0 0]
      :result {"minecraft:paper:Paper" 3}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" 0 0
        0 0 0
        0 0 0]
      :result {"minecraft:iron_nugget:Iron Nugget" 9}}

    { :pattern
      [ "minecraft:gold_ingot:Gold Ingot" 0 0
        0 0 0
        0 0 0]
      :result {"minecraft:gold_nugget:Gold Nugget" 9}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot"
        "minecraft:gold_nugget:Gold Nugget" "minecraft:paper:Paper" "minecraft:gold_nugget:Gold Nugget"
        0 "minecraft:redstone:Redstone" 0]
      :result {"opencomputers:material:Transistor" 8}}

    { :pattern
      [ "minecraft:iron_nugget:Iron Nugget" "minecraft:iron_nugget:Iron Nugget" "minecraft:iron_nugget:Iron Nugget"
        "minecraft:redstone:Redstone" "opencomputers:material:Transistor" "minecraft:redstone:Redstone"
        "minecraft:iron_nugget:Iron Nugget" "minecraft:iron_nugget:Iron Nugget" "minecraft:iron_nugget:Iron Nugget"]
      :result {"opencomputers:material:Microchip (Tier 1)" 8}}

    { :pattern
      [ "minecraft:gold_nugget:Gold Nugget" "minecraft:gold_nugget:Gold Nugget" "minecraft:gold_nugget:Gold Nugget"
        "minecraft:redstone:Redstone" "opencomputers:material:Transistor" "minecraft:redstone:Redstone"
        "minecraft:gold_nugget:Gold Nugget" "minecraft:gold_nugget:Gold Nugget" "minecraft:gold_nugget:Gold Nugget"]
      :result {"opencomputers:material:Microchip (Tier 2)" 4}}

    { :pattern
      [ "opencomputers:material:Diamond Chip" "opencomputers:material:Diamond Chip" "opencomputers:material:Diamond Chip"
        "minecraft:redstone:Redstone" "opencomputers:material:Transistor" "minecraft:redstone:Redstone"
        "opencomputers:material:Diamond Chip" "opencomputers:material:Diamond Chip" "opencomputers:material:Diamond Chip"]
      :result {"opencomputers:material:Microchip (Tier 3)" 2}}

    { :pattern
      [ 0 0 0
        "minecraft:stick:Stick" "minecraft:iron_nugget:Iron Nugget" "minecraft:stick:Stick"
        0 0 0]
      :result {"opencomputers:material:Cutting Wire" 1}}

    { :pattern
      [ "opencomputers:material:Cutting Wire" "minecraft:diamond:Diamond" 0
        0 0 0
        0 0 0]
      :result {"opencomputers:material:Diamond Chip" 6}}
    ;tbe
    { :pattern
      [ 0 0 0
        "minecraft:iron_ingot:Iron Ingot" 0 "minecraft:iron_ingot:Iron Ingot"
        0 "minecraft:iron_ingot:Iron Ingot" 0]
      :result {"minecraft:bucket:Bucket" 1}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" 0 "minecraft:iron_ingot:Iron Ingot"
        "minecraft:iron_ingot:Iron Ingot" "minecraft:chest:Oak Chest" "minecraft:iron_ingot:Iron Ingot"
        0 "minecraft:iron_ingot:Iron Ingot" 0]
      :result {"minecraft:hopper:Hopper" 1}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" "opencomputers:upgrade:Inventory Controller Upgrade" "minecraft:iron_ingot:Iron Ingot"
        "minecraft:hopper:Hopper" "minecraft:bucket:Bucket" "minecraft:hopper:Hopper"
        "minecraft:iron_ingot:Iron Ingot" "opencomputers:upgrade:Tank Controller Upgrade" "minecraft:iron_ingot:Iron Ingot"]
      :result {"opencomputers:transposer:Transposer" 4}}

    { :pattern
      [ "minecraft:planks:Oak Wood Planks" "minecraft:planks:Oak Wood Planks" "minecraft:planks:Oak Wood Planks"
        "minecraft:cobblestone:Cobblestone" "minecraft:iron_ingot:Iron Ingot" "minecraft:cobblestone:Cobblestone"
        "minecraft:cobblestone:Cobblestone" "minecraft:redstone:Redstone" "minecraft:cobblestone:Cobblestone"]
      :result {"minecraft:piston:Piston" 1}}

    { :pattern
      [ "minecraft:cobblestone:Cobblestone" "minecraft:cobblestone:Cobblestone" "minecraft:cobblestone:Cobblestone"
        "minecraft:cobblestone:Cobblestone" 0 "minecraft:cobblestone:Cobblestone"
        "minecraft:cobblestone:Cobblestone" "minecraft:redstone:Redstone" "minecraft:cobblestone:Cobblestone"]
      :result {"minecraft:dropper:Dropper" 1}}

    { :pattern
      [ "minecraft:redstone:Redstone" 0 0
        "minecraft:stick:Stick" 0 0
        0 0 0]
      :result {"minecraft:redstone_torch:Redstone Torch" 1}}

    { :pattern
      [ "minecraft:redstone_torch:Redstone Torch" 0 0
        "opencomputers:material:Transistor" "minecraft:gold_nugget:Gold Nugget" 0
        "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:gold_nugget:Gold Nugget" 0]
      :result {"opencomputers:tool:Analyzer" 1}}

    { :pattern
      [ "minecraft:gold_ingot:Gold Ingot" "opencomputers:tool:Analyzer" "minecraft:gold_ingot:Gold Ingot"
        "minecraft:dropper:Dropper" "opencomputers:material:Microchip (Tier 2)" "minecraft:piston:Piston"
        "minecraft:gold_ingot:Gold Ingot" "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:gold_ingot:Gold Ingot"]
      :result {"opencomputers:upgrade:Inventory Controller Upgrade" 1}}

    { :pattern
      [ 0 0 0
        "minecraft:glass:Glass" 0 "minecraft:glass:Glass"
        0 "minecraft:glass:Glass" 0]
      :result {"minecraft:glass_bottle:Glass Bottle" 3}}

    { :pattern
      [ "minecraft:gold_ingot:Gold Ingot" "minecraft:glass_bottle:Glass Bottle" "minecraft:gold_ingot:Gold Ingot"
        "minecraft:dispenser:Dispenser" "opencomputers:material:Microchip (Tier 2)" "minecraft:piston:Piston"
        "minecraft:gold_ingot:Gold Ingot" "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:gold_ingot:Gold Ingot"]
      :result {"opencomputers:upgrade:Tank Controller Upgrade" 1}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" "opencomputers:upgrade:Inventory Controller Upgrade" "minecraft:iron_ingot:Iron Ingot"
        "minecraft:hopper:Hopper" "minecraft:bucket:Bucket" "minecraft:hopper:Hopper"
        "minecraft:iron_ingot:Iron Ingot" "opencomputers:upgrade:Tank Controller Upgrade" "minecraft:iron_ingot:Iron Ingot"]
      :result {"opencomputers:transposer:Transposer" 4}}

    { :pattern
      [ "minecraft:planks:Oak Wood Planks" "minecraft:planks:Oak Wood Planks" "minecraft:planks:Oak Wood Planks"
        "minecraft:planks:Oak Wood Planks" 0 "minecraft:planks:Oak Wood Planks"
        "minecraft:planks:Oak Wood Planks" "minecraft:planks:Oak Wood Planks" "minecraft:planks:Oak Wood Planks"]
      :result {"minecraft:chest:Oak Chest" 1}}

    { :pattern
      [ 0 "minecraft:stick:Stick" "minecraft:string:String"
        "minecraft:stick:Stick" 0 "minecraft:string:String"
        0 "minecraft:stick:Stick" "minecraft:string:String"]
      :result {"minecraft:bow:Bow" 1}}

    { :pattern
      [ "minecraft:cobblestone:Cobblestone" "minecraft:cobblestone:Cobblestone" "minecraft:cobblestone:Cobblestone"
        "minecraft:cobblestone:Cobblestone" "minecraft:bow:Bow" "minecraft:cobblestone:Cobblestone"
        "minecraft:cobblestone:Cobblestone" "minecraft:redstone:Redstone" "minecraft:cobblestone:Cobblestone"]
      :result {"minecraft:dispenser:Dispenser" 1}}

    { :pattern
      [ 0 0 0
        "minecraft:leather:Leather" "minecraft:leather:Leather" "minecraft:leather:Leather"
        "minecraft:iron_ingot:Iron Ingot" "minecraft:redstone:Redstone" "minecraft:iron_ingot:Iron Ingot"]
      :result {"immersiveengineering:conveyor:Conveyor Belt" 8}}

    { :pattern
      [ "immersiveengineering:metal:Iron Plate" 0 "immersiveengineering:metal:Iron Plate"
        0 "immersiveengineering:metal:Copper Ingot" 0
        "immersiveengineering:metal:Iron Plate" 0 "immersiveengineering:metal:Iron Plate"]
      :result {"immersiveengineering:material:Iron Mechanical Component" 1}}

    { :pattern
      [ "immersiveengineering:treated_wood:Treated Wood Planks" "minecraft:redstone:Redstone" "immersiveengineering:treated_wood:Treated Wood Planks"
        "minecraft:iron_ingot:Iron Ingot" "immersiveengineering:conveyor:Conveyor Belt" "minecraft:iron_ingot:Iron Ingot"
        "immersiveengineering:treated_wood:Treated Wood Planks" "immersiveengineering:material:Iron Mechanical Component" "immersiveengineering:treated_wood:Treated Wood Planks"]
      :result {"immersiveengineering:wooden_device0:Item Router" 1}}

    { :pattern
      [ "opencomputers:material:Diamond Chip" "minecraft:redstone:Redstone" "opencomputers:material:Diamond Chip"
        "opencomputers:material:Microchip (Tier 3)" "opencomputers:material:Control Unit (CU)" 0
        "opencomputers:material:Diamond Chip" "opencomputers:material:Printed Circuit Board (PCB)" "opencomputers:material:Diamond Chip"]
      :result {"opencomputers:component:Component Bus (Tier 3)" 1}}

    { :pattern
      [ 0 0 0
        "opencomputers:material:Microchip (Tier 3)" "opencomputers:material:Microchip (Tier 3)" "opencomputers:material:Microchip (Tier 3)"
        "opencomputers:material:Microchip (Tier 2)" "opencomputers:material:Printed Circuit Board (PCB)" "opencomputers:material:Microchip (Tier 2)"]
      :result {"opencomputers:component:Memory (Tier 3.5)" 1}}

    { :pattern
      [ "minecraft:diamond:Diamond" "opencomputers:component:Memory (Tier 3.5)" "minecraft:diamond:Diamond"
        "opencomputers:material:Microchip (Tier 3)" "opencomputers:component:Component Bus (Tier 3)" "opencomputers:material:Microchip (Tier 3)"
        "minecraft:obsidian:Obsidian" "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:obsidian:Obsidian"]
      :result {"opencomputers:component:Server (Tier 3)" 1}}

    { :pattern
      [ 0 0 0
        "minecraft:ender_pearl:Ender Pearl" "opencomputers:material:Microchip (Tier 2)" 0
        0 "opencomputers:material:Card Base" 0]
      :result {"opencomputers:card:Wireless Network Card (Tier 2)" 1}}

    { :pattern
      [ 0 0 0
        "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot"
        "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot"]
      :result {"minecraft:iron_bars:Iron Bars" 16}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" "opencomputers:cable:Cable" "minecraft:iron_ingot:Iron Ingot"
        "opencomputers:cable:Cable" "opencomputers:card:Network Card" "opencomputers:cable:Cable"
        "minecraft:iron_ingot:Iron Ingot" "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:iron_ingot:Iron Ingot"]
      :result {"opencomputers:relay:Relay" 1}}

    { :pattern
      [ "minecraft:iron_nugget:Iron Nugget" 0 0
        "minecraft:iron_nugget:Iron Nugget" "opencomputers:material:Printed Circuit Board (PCB)" 0
        "minecraft:iron_nugget:Iron Nugget" "minecraft:gold_nugget:Gold Nugget" 0]
      :result {"opencomputers:material:Card Base" 1}}

    { :pattern
      [ 0 0 0
        "opencomputers:cable:Cable" "opencomputers:material:Microchip (Tier 1)" 0
        0 "opencomputers:material:Card Base" 0]
      :result {"opencomputers:card:Network Card" 1}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" "minecraft:gold_ingot:Gold Ingot" "minecraft:iron_ingot:Iron Ingot"
        "opencomputers:cable:Cable" "opencomputers:material:Microchip (Tier 1)" "opencomputers:cable:Cable"
        "minecraft:iron_ingot:Iron Ingot" "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:iron_ingot:Iron Ingot"]
      :result {"opencomputers:powerdistributor:Power Distributor" 1}}

    { :pattern
      [ "minecraft:diamond:Diamond" "opencomputers:card:Wireless Network Card (Tier 2)" "minecraft:diamond:Diamond"
        "minecraft:iron_bars:Iron Bars" "minecraft:chest:Oak Chest" "minecraft:iron_bars:Iron Bars"
        "opencomputers:relay:Relay" "opencomputers:material:Printed Circuit Board (PCB)" "opencomputers:powerdistributor:Power Distributor"]
      :result {"opencomputers:rack:Rack" 1}}

    { :pattern
      [ 0 "minecraft:gold_ingot:Gold Ingot" 0
        "minecraft:gold_ingot:Gold Ingot" "minecraft:redstone:Redstone" "minecraft:gold_ingot:Gold Ingot"
        0 "minecraft:gold_ingot:Gold Ingot" 0]
      :result {"minecraft:clock:Clock" 1}}

    { :pattern
      [ "minecraft:gold_nugget:Gold Nugget" "minecraft:redstone:Redstone" "minecraft:gold_nugget:Gold Nugget"
        "opencomputers:material:Transistor" "minecraft:clock:Clock" "opencomputers:material:Transistor"
        "minecraft:gold_nugget:Gold Nugget" "opencomputers:material:Transistor" "minecraft:gold_nugget:Gold Nugget"]
      :result {"opencomputers:material:Control Unit (CU)" 1}}

    { :pattern
      [ 0 "minecraft:iron_nugget:Iron Nugget" 0
        "minecraft:iron_nugget:Iron Nugget" "minecraft:redstone:Redstone" "minecraft:iron_nugget:Iron Nugget"
        0 "minecraft:iron_nugget:Iron Nugget" 0]
      :result {"opencomputers:cable:Cable" 4}}

    { :pattern
      [ "minecraft:iron_nugget:Iron Nugget" "minecraft:redstone:Redstone" "minecraft:iron_nugget:Iron Nugget"
        "opencomputers:material:Transistor" "opencomputers:material:Microchip (Tier 1)" "opencomputers:material:Transistor"
        "minecraft:iron_nugget:Iron Nugget" "opencomputers:material:Transistor" "minecraft:iron_nugget:Iron Nugget"]
      :result {"opencomputers:material:Arithmetic Logic Unit (ALU)" 1}}

    { :pattern
      [ "minecraft:gold_nugget:Gold Nugget" "minecraft:redstone:Redstone" "minecraft:gold_nugget:Gold Nugget"
        "opencomputers:material:Microchip (Tier 2)" "opencomputers:material:Control Unit (CU)" 0
        "minecraft:gold_nugget:Gold Nugget" "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:gold_nugget:Gold Nugget"]
      :result {"opencomputers:component:Component Bus (Tier 2)" 1}}

    { :pattern
      [ "opencomputers:material:Diamond Chip" "minecraft:redstone:Redstone" "opencomputers:material:Diamond Chip"
        "opencomputers:material:Microchip (Tier 3)" "opencomputers:material:Control Unit (CU)" "opencomputers:material:Microchip (Tier 3)"
        "opencomputers:material:Diamond Chip" "opencomputers:material:Arithmetic Logic Unit (ALU)" "opencomputers:material:Diamond Chip"]
      :result {"opencomputers:component:Central Processing Unit (CPU) (Tier 3)" 1}}

    { :pattern
      [ 0 0 0
        "opencomputers:material:Microchip (Tier 2)" "minecraft:iron_nugget:Iron Nugget" "opencomputers:material:Microchip (Tier 2)"
        0 "opencomputers:material:Printed Circuit Board (PCB)" 0]
      :result {"opencomputers:component:Memory (Tier 2)" 1}}

    { :pattern
      [ 0 0 0
        "opencomputers:material:Microchip (Tier 2)" "opencomputers:material:Arithmetic Logic Unit (ALU)" "opencomputers:component:Memory (Tier 2)"
        0 "opencomputers:material:Card Base" 0]
      :result {"opencomputers:card:Graphics Card (Tier 2)" 1}}

    { :pattern
      [ "opencomputers:material:Diamond Chip" "opencomputers:material:Microchip (Tier 2)" "opencomputers:material:Diamond Chip"
        "opencomputers:component:Central Processing Unit (CPU) (Tier 3)" "opencomputers:component:Component Bus (Tier 2)" "opencomputers:card:Graphics Card (Tier 2)"
        "opencomputers:material:Diamond Chip" "opencomputers:material:Microchip (Tier 2)" "opencomputers:material:Diamond Chip"]
      :result {"opencomputers:component:Accelerated Processing Unit (APU) (Tier 2)" 1}}

    { :pattern
      [ "minecraft:obsidian:Obsidian" "minecraft:glowstone_dust:Glowstone Dust" "minecraft:obsidian:Obsidian"
        "minecraft:glowstone_dust:Glowstone Dust" "opencomputers:material:Microchip (Tier 3)" "minecraft:glass:Glass"
        "minecraft:obsidian:Obsidian" "minecraft:glowstone_dust:Glowstone Dust" "minecraft:obsidian:Obsidian"]
      :result {"opencomputers:screen3:Screen (Tier 3)" 1}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" 0 "minecraft:iron_ingot:Iron Ingot"
        "opencomputers:material:Microchip (Tier 1)" "minecraft:piston:Piston" "opencomputers:material:Microchip (Tier 1)"
        "minecraft:iron_ingot:Iron Ingot" "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:iron_ingot:Iron Ingot"]
      :result {"opencomputers:upgrade:Generator Upgrade" 1}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" "opencomputers:material:Transistor" "minecraft:iron_ingot:Iron Ingot"
        "minecraft:gold_nugget:Gold Nugget" "minecraft:paper:Paper" "minecraft:gold_nugget:Gold Nugget"
        "minecraft:iron_ingot:Iron Ingot" "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:iron_ingot:Iron Ingot"]
      :result {"opencomputers:capacitor:Capacitor" 1}}

    { :pattern
      [ 0 0 0
        "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot"
        "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot" "minecraft:iron_ingot:Iron Ingot"]
      :result {"minecraft:iron_bars:Iron Bars" 16}}

    { :pattern
      [ "minecraft:iron_nugget:Iron Nugget" "minecraft:gold_nugget:Gold Nugget" "minecraft:iron_nugget:Iron Nugget"
        "minecraft:iron_bars:Iron Bars" "opencomputers:capacitor:Capacitor" "minecraft:iron_bars:Iron Bars"
        "minecraft:iron_nugget:Iron Nugget" "minecraft:gold_nugget:Gold Nugget" "minecraft:iron_nugget:Iron Nugget"]
      :result {"opencomputers:upgrade:Battery Upgrade (Tier 1)" 1}}

    { :pattern
      [ "minecraft:iron_nugget:Iron Nugget" "opencomputers:capacitor:Capacitor" "minecraft:iron_nugget:Iron Nugget"
        "minecraft:iron_bars:Iron Bars" "minecraft:gold_nugget:Gold Nugget" "minecraft:iron_bars:Iron Bars"
        "minecraft:iron_nugget:Iron Nugget" "opencomputers:capacitor:Capacitor" "minecraft:iron_nugget:Iron Nugget"]
      :result {"opencomputers:upgrade:Battery Upgrade (Tier 2)" 1}}

    { :pattern
      [ "minecraft:iron_nugget:Iron Nugget" "opencomputers:capacitor:Capacitor" "minecraft:iron_nugget:Iron Nugget"
        "opencomputers:capacitor:Capacitor" "opencomputers:material:Diamond Chip" "opencomputers:capacitor:Capacitor"
        "minecraft:iron_nugget:Iron Nugget" "opencomputers:capacitor:Capacitor" "minecraft:iron_nugget:Iron Nugget"]
      :result {"opencomputers:upgrade:Battery Upgrade (Tier 3)" 1}}

    { :pattern
      [ "minecraft:iron_ingot:Iron Ingot" "minecraft:gold_ingot:Gold Ingot" "minecraft:iron_ingot:Iron Ingot"
        "opencomputers:capacitor:Capacitor" "opencomputers:material:Microchip (Tier 2)" "opencomputers:capacitor:Capacitor"
        "minecraft:iron_ingot:Iron Ingot" "opencomputers:material:Printed Circuit Board (PCB)" "minecraft:iron_ingot:Iron Ingot"]
      :result {"opencomputers:charger:Charger" 1}}

    { :pattern
      [ 0 "minecraft:gold_nugget:Gold Nugget" "enderio:item_material:Grains of Infinity"
        "minecraft:gold_nugget:Gold Nugget" "minecraft:redstone:Redstone" "minecraft:gold_nugget:Gold Nugget"
        "enderio:item_material:Grains of Infinity" "minecraft:gold_nugget:Gold Nugget" 0]
      :result {"enderio:item_basic_capacitor:Basic Capacitor" 1}}

    { :pattern
      [ 0 "enderio:item_alloy_ingot:Energetic Alloy Ingot" 0
        "enderio:item_basic_capacitor:Basic Capacitor" "actuallyadditions:item_dust:Crushed Coal" "enderio:item_basic_capacitor:Basic Capacitor"
        0 "enderio:item_alloy_ingot:Energetic Alloy Ingot" 0]
      :result {"enderio:item_basic_capacitor:Double-Layer Capacitor" 1}}

    { :pattern
      [ 0 "enderio:item_alloy_ingot:Vibrant Alloy Ingot" 0
        "enderio:item_basic_capacitor:Double-Layer Capacitor" "minecraft:glowstone:Glowstone" "enderio:item_basic_capacitor:Double-Layer Capacitor"
        0 "enderio:item_alloy_ingot:Vibrant Alloy Ingot" 0]
      :result {"enderio:item_basic_capacitor:Octadic Capacitor" 1}}

    { :pattern
      [ 0 0 0
        0 "minecraft:stone:Stone" 0
        0 0 0]
      :result {"minecraft:stone_button:Button" 1}}

    { :pattern
      [ 0 0 0
        "minecraft:stone_button:Button" "minecraft:stone_button:Button" "minecraft:stone_button:Button"
        "minecraft:stone_button:Button" "minecraft:stone_button:Button" "minecraft:stone_button:Button"]
      :result {"opencomputers:material:Button Group" 1}}

    { :pattern
      [ 0 0 0
        0 "minecraft:stone_button:Button" 0
        "minecraft:stone_button:Button" "minecraft:stone_button:Button" "minecraft:stone_button:Button"]
      :result {"opencomputers:material:Arrow Keys" 1}}

    { :pattern
      [ "minecraft:stone_button:Button" "minecraft:stone_button:Button" "minecraft:stone_button:Button"
        "minecraft:stone_button:Button" "minecraft:stone_button:Button" "minecraft:stone_button:Button"
        "minecraft:stone_button:Button" "minecraft:stone_button:Button" "minecraft:stone_button:Button"]
      :result {"opencomputers:material:Numeric Keypad" 1}}

    { :pattern
      [ 0 0 0
        "opencomputers:material:Button Group" "opencomputers:material:Button Group" "opencomputers:material:Button Group"
        "opencomputers:material:Button Group" "opencomputers:material:Arrow Keys" "opencomputers:material:Numeric Keypad"]
      :result {"opencomputers:keyboard:Keyboard" 1}}


    { :pattern
      [ 0 0 0
        0 0 0
        0 0 0]
      :result {}}])


seeds
