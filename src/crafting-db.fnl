(local crafting-db {})

;resolve referid to shortid
(defn crafting-db.refid->shortid [referid])
;resolve shortid to multiple referids
(defn crafting-db.shortid->referids [shortid])

;find all recipes by shortid
(defn crafting-db.find-recipes [shortid])
;find any recipe by shortid
(defn crafting-db.find-recipe-any [shortid])

;result of single recipe crafting
(defn crafting-db.recipe-result [recipe])
;requiremets for single recipe crafting
(defn crafting-db.recipe-requirements [recipe])
;result of multiple recipe crafting
(defn crafting-db.recipe-crafts-result [recipe amount])
;requirements for multiple recipe crafting
(defn crafting-db.recipe-crafts-needed [recipe amount])

crafting-db
