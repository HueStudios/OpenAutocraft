(local sides (require :sides))

(defn inventory-ctl []
  (local self {})
  (local craftslots [1 2 3 5 6 7 9 10 11])
  (local input sides.down)
  (local output sides.down)
  (local items {})
  (local forced {})

  ;real amount of items
  (defn self.real-amount [referid])

  ;forced amount of items
  (defn self.forced-amount [referid])

  ;sum of real and forced amounts
  (defn self.amount [referid])


  ;set forced amount of referid
  (defn self.set-forced [referid amount])

  ;add to forced amount of referid
  (defn self.add-forced [referid amount])

  ;wipe all forced items
  (defn self.wipe-forced [])

  ;scan inventory
  (defn self.scan [])

  ;find item locations in inventory
  (defn self.find-item [referid])

  ;move item to inventory
  (defn self.move-craftslot [inventory-slot craft-slot amount]
    (local amount (or amount 1)))

  ;fill recipe for crafting
  (defn self.fill-recipe [recipe times]
    (local times (or times 1)))

  ;clean robot from start to stop slot
  (defn self.clean-robot [start stop]
    (local start (or start 1))
    (local stop (or stop 16)))

  ;execute craft
  (defn self.craft [])

  self)
