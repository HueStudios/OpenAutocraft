(local queue (require :queue))

(defn craft-queue [inventory craft-db]
  (local self {})
  (set self.masteritems [])
  (local tmp-queue (queue.new))
  ;(local foo dynamic-list-thing)

  (defn self.queue-recipe [recipe]
    (local wanted-all (craft-db.recipe-requirements recipe))
    (each [referid amount (pairs wanted-all)]
      (local found (inventory.amount referid))
      (local needed (- amount found))
      (if (> needed 0)
          (do
            (local sub-recipe (craft-db.providing-recipe-any referid))
            (local crafts-needed (craft-db.crafts-for-result sub-recipe referid needed))
            (local crafts-result (craft-db.recipe-multi-results sub-recipe crafts-needed))

            (each [result-referid result-amount (pairs crafts-result)]
              (inventory.add-forced result-referid result-amount))

            (for [t 1 crafts-needed]
              (self.queue-recipe sub-recipe)))
          (do))
      (inventory.add-forced referid amount))
    (self.tmp-queue.push-left recipe))

  (defn self.sort-queue [])

  self)
