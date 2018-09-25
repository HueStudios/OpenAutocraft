(local crafting-db (require :crafting-db))


(defn createTree [root]
  (local requirements-for-crafting (crafting-db.needed-for root.name root.amount))
  (tset root requirements requirements-for-crafting)
  (each [i v (ipairs root.requirements)]
    (createTree v)))
