(local queue (require :queue))
(local util (require :util))

(defn craft-queue [inventory craft-db]
  (local self {})
  (set self.masteritems [])
  (set self.tmp-queue (queue))
  ;(local foo dynamic-list-thing)

  (defn self.queue-recipe [recipe]
    (local wanted-all (craft-db.recipe-requirements recipe))
    (each [referid amount (pairs wanted-all)]
      (local found (inventory.amount referid))
      (local needed (- amount found))
      (if (> needed 0)
          (do
            (local sub-recipe (craft-db.providing-recipe-any referid))
            (when (not sub-recipe)
              (util.error (.. "no recipe for " referid)))
            (local crafts-needed (craft-db.crafts-for-result sub-recipe referid needed))
            (local crafts-result (craft-db.recipe-results sub-recipe crafts-needed))

            (each [result-referid result-amount (pairs crafts-result)]
              (inventory.add-forced result-referid result-amount))

            (for [t 1 crafts-needed]
              (self.queue-recipe sub-recipe)))
          (do))
      (inventory.add-forced referid (- amount)))
    ;XXX changed push destination
    (self.tmp-queue.push-right recipe))

  (defn self.sort-queue [])

  self)
