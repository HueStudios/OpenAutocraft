(local queue (require :queue))
(local util (require :util))


(defn craft-queue [inventory craft-db]
  (local self {})
  ;(set self.masteritems [])
  (set self.tmp-queue (queue))
  ;(local foo dynamic-list-thing)
  ;(set self.test-list [])
  (set self.craft-queue (queue))

  (defn recipe->craftoperations [recipe amount]
    (local craftoperations [])
    ;TODO clean up, maxbatch check was moved elsewhere
    (let [maxbatch (or (. recipe :maxbatch) 64)]
      (if (> amount maxbatch)
          (util.error "amount larger than maxbatch (not implemented here)")
          (do
            (local tmp-op [])
            (each [i v (ipairs (. recipe :pattern))]
              ;(when (~= v 0)
              (tset tmp-op (+ (# tmp-op) 1) [v amount]))
            (tset craftoperations (+ (# craftoperations) 1) tmp-op))))
    craftoperations)

  ;(defn append-test-list [recipe]
  ;  (var found false)
  ;  (let [id (util.recipe-id recipe)]
  ;    (each [i v (ipairs self.test-list)]
  ;      (when (and v (= (. v 1) id))
  ;        (set found true)
  ;        (tset v 2 (+ (. v 2) 1))))
  ;    (when (not found)
  ;      (tset self.test-list (+ (# self.test-list) 1) [id 1 recipe]))))

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

  ;(defn self.sort-queue []
  ;  (each [i v (ipairs (self.tmp-queue.peek-all))]
  ;    (append-test-list v)))

  ;(defn self.flush []
  ;  (each [i v (ipairs self.test-list)]
  ;    (var bigvar (. v 2))
  ;    (local maxbatch 64) ;FIXME get it from recipe instead
  ;    (var nom (math.floor (/ bigvar maxbatch)))
  ;    (var rem (- bigvar (* maxbatch nom)))

  ;    (for [n 1 nom]
  ;      (each [ii cop (ipairs (recipe->craftoperations (. v 3) maxbatch))]
  ;        (self.craft-queue.push-right cop)))
  ;    (each [ii cop (ipairs (recipe->craftoperations (. v 3) rem))]
  ;      (self.craft-queue.push-right cop))))

  (defn self.flush []
    (local sort-buffer [])

    (defn append-sort-buffer [recipe]
      (var found false)
      (let [id (util.recipe-id recipe)]
        (each [i v (ipairs sort-buffer)]
          (when (and v (= (. v 1) id))
            (set found true)
            (tset v 2 (+ (. v 2) 1))))
        (when (not found)
          (tset sort-buffer (+ (# sort-buffer) 1) [id 1 recipe]))))

    (each [i v (ipairs (self.tmp-queue.peek-all))]
      (append-sort-buffer v))

    (each [i v (ipairs sort-buffer)]
      (var bigvar (. v 2))
      (local maxbatch (or (. (. v 3) :maxbatch) 64))
      (var nom (math.floor (/ bigvar maxbatch)))
      (var rem (- bigvar (* maxbatch nom)))

      (for [n 1 nom]
        (each [ii cop (ipairs (recipe->craftoperations (. v 3) maxbatch))]
          (self.craft-queue.push-right cop)))
      (each [ii cop (ipairs (recipe->craftoperations (. v 3) rem))]
        (self.craft-queue.push-right cop)))

    (set self.tmp-queue (queue)))

  self)
