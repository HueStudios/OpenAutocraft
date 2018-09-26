(defn crafting-db [recipedata]
  (local self {})

  ;resolve referid to shortids
  (defn self.referid->shortids [referid]
    (local r [])
    (each [i pdic (ipairs recipedata.items)]
      (each [ii id (ipairs pdic)]
        (when (= id referid)
          (tset r (+ (# r) 1) (. pdic 1)))))
    r)

  ;resolve referid to single shortid
  (defn self.referid->shortid-any [referid]
    (. (self.referid->shortids referid) 1))

  ;resolve shortid to multiple referids
  (defn self.shortid->referids [shortid]
    (local r [])
    (each [i pdic (ipairs recipedata.items)]
      (when (and (~= pdic nil) (= (. pdic 1) shortid))
        (each [ii vv (ipairs pdic)]
          (when (~= ii 1)
            (tset r (+ (# r) 1) vv)))))
    r)

  ;resolve shortid to single referid
  (defn self.shortid->referid-any [shortid]
    (. (self.shortid->referids shortid) 1))

  ;result of single recipe crafting
  (defn self.recipe-results [recipe]
    (when recipe
      (. recipe :result)))

  ;requiremets for single recipe crafting
  (defn self.recipe-requirements [recipe]
    (local r {})
    (when recipe
      (each [i referid (ipairs (. recipe :pattern))]
        (tset r referid (+ (or (. r referid) 0) 1))))
    r)

  ;result of multiple recipe crafting
  (defn self.recipe-multi-results [recipe amount]
    (local r [])
    (when recipe
      (let [result (. recipe :result)]
        (each [referid n (pairs result)]
          (tset r referid (+ (or (. r referid) 0) (* n amount))))))
    r)

  ;requirements for multiple recipe crafting
  (defn self.recipe-multi-requirements [recipe amount]
    (local r {})
    (when recipe
      (each [i referid (ipairs (. recipe :pattern))]
        (tset r referid (+ (or (. r referid) 0) amount))))
    r)

  (defn self.crafts-for-result [recipe referid target-amount]
    (let [single-amount (. (or (self.recipe-results recipe) {}) referid)]
      (if single-amount
          (math.ceil (/ target-amount single-amount))
          nil)))

  ;find all recipes by referid
  (defn self.providing-recipes [referid]
    (local r [])
    (each [i recipe (ipairs recipedata.recipes)]
      (when (. (self.recipe-results recipe) referid)
        (tset r (+ (# r) 1) recipe)))
    r)

  ;find any recipe by referid
  (defn self.providing-recipe-any [referid]
    (. (self.providing-recipes referid) 1))
  self)
