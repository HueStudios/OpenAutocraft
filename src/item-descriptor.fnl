(local item-descriptor {})

;Overpowered recipes file but dynamic
(set item-descriptor.database {})

;Add a new descriptor to the database
(defn item-descriptor.add-to-database [descriptor]
  (tset item-descriptor.database descriptor.referid descriptor))

;Create a new descriptor (automatically added to the database)
(defn item-descriptor.new [referid max-stack recipes]
  (local descriptor {})
  (set descriptor.referid referid)
  (set descriptor.max-stack (or max-stack 64))
  (set descriptor.recipes (or recipes {}))
  (defn descriptor.add-recipe [pattern result-count]
    (local recipe {})
    (set recipe.pattern pattern)
    (set recipe.result-count result-count)
    (defn recipe.raw-requirements []
      (local requirements {})
      (each [i v (ipairs recipe.pattern)]
        (each [j n (ipairs requirements)]
          (if (= v n.descriptor)
              (set n.count (+ (n.count) 1))
            ((let [toadd {}]
              (tset toadd descriptor v)
              (tset toadd count 1)
              (tset requirements j toadd)))))))
    (tset descriptor.recipes (+ (# descriptor.recipes) 1) recipe))
  (defn descriptor.get-shortid [])
  (item-descriptor.add-to-database descriptor)
  descriptor)

item-descriptor
