(defn cafting-db [recipe-data]
  (local self {})

  ;resolve referid to shortid
  (defn self.referid->shortid [referid])
  ;resolve shortid to multiple referids
  (defn self.shortid->referids [shortid])

  ;find all recipes by shortid
  (defn self.find-recipes [shortid])
  ;find any recipe by shortid
  (defn self.find-recipe-any [shortid])

  ;result of single recipe crafting
  (defn self.recipe-result [recipe])
  ;requiremets for single recipe crafting
  (defn self.recipe-requirements [recipe])
  ;result of multiple recipe crafting
  (defn self.recipe-crafts-result [recipe amount])
  ;requirements for multiple recipe crafting
  (defn self.recipe-crafts-needed [recipe amount])

  self)
