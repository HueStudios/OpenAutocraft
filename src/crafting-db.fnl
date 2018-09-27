(local util (require :util))

(defn crafting-db [recipedata]
  (local self {})

  ;;resolve referid to shortids
  (defn self.referid->shortids [referid]
    (local r [])
    (each [i pdic (ipairs recipedata.items)]
      (each [ii id (ipairs pdic)]
        (when (= id referid)
          (tset r (+ (# r) 1) (. pdic 1)))))
    r)

  ;;resolve referid to single shortid
  (defn self.referid->shortid-any [referid]
    (. (self.referid->shortids referid) 1))

  ;;resolve shortid to multiple referids
  (defn self.shortid->referids [shortid]
    (local r [])
    (each [i pdic (ipairs recipedata.items)]
      (when (and (~= pdic nil) (= (. pdic 1) shortid))
        (each [ii vv (ipairs pdic)]
          (when (~= ii 1)
            (tset r (+ (# r) 1) vv)))))
    r)

  ;;resolve shortid to single referid
  (defn self.shortid->referid-any [shortid]
    (. (self.shortid->referids shortid) 1))

  ;;result of recipe crafting
  (defn self.recipe-results [recipe amount]
    (local amount (or amount 1))
    (local r {})
    (if recipe
      ;FIXME handle number
      (each [shortid|number n (pairs (. recipe :result))]
        ;FIXME non-nil assert referid|nil
        (let [referid|nil (self.shortid->referid-any shortid|number)]
          (tset r referid|nil  (* n amount))))
      (util.error "no recipe to resolve results for"))
    r)

  ;;requiremets for recipe crafting
  (defn self.recipe-requirements [recipe amount]
    (local amount (or amount 1))
    (local r {})
    (when recipe
      (each [i shortid|number (ipairs (. recipe :pattern))]
        (if (= (type shortid|number) :number)
          (do)
          ;FIXME non-nil assert referid|nil
          (let [referid|nil (self.shortid->referid-any shortid|number)
                cur-n (or (. r referid|nil) 0)]
            (tset r referid|nil (+ cur-n amount))))))
    r)

  ;;how many crafts for desired result amount
  (defn self.crafts-for-result [recipe referid target-amount]
    (let [single-amount (. (self.recipe-results recipe) referid)]
      (if single-amount
          (math.ceil (/ target-amount single-amount))
          (util.error "can not resolve amount of single craft"))))

  ;;find all recipes by referid
  (defn self.providing-recipes [referid]
    (local r [])
    (each [i recipe (ipairs recipedata.recipes)]
      (when (. (self.recipe-results recipe) referid)
        (tset r (+ (# r) 1) recipe)))
    r)

  ;;find any recipe by referid
  (defn self.providing-recipe-any [referid]
    (. (self.providing-recipes referid) 1))
  self)
