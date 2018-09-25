(local recipes {})

(set recipes.items
  [
    [:stick "minecraft:stick:Stick"]
    [:planks "minecraft:planks:Oak Wood Planks"]
    [:log "minecraft:log:Oak Wood"]])

(set recipes.recipes
  [
    { :kind "craft" ;craft as default ?
      :maxbatch 64 ;64 as default
      :minbatch 1 ;1 as default
      :pattern
        [ 0 0 0
          0 0 0
          0 0 0]
      :result {}}

    { :kind "craft"
      :pattern
        [ :log 0 0
          0 0 0
          0 0 0]
      :result {:planks 4}}

    { :kind "craft"
      :pattern
        [ :planks 0 0
          :planks 0 0
          0 0 0]
      :result {:stick 4}}])

recipes
