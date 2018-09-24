(local sides (require :sides))

(local inventory-ctl {})

(local craftslots [1 2 3 5 6 7 9 10 11])
(local input sides.down)
(local output sides.down)
(local items {})
(local forced {})
(defn inventory-ctl.real-amount [referid])

;forced amount of items
(defn inventory-ctl.forced-amount [referid])

;sum of real and forced amounts
(defn inventory-ctl.amount [referid])


;set forced amount of referid
(defn inventory-ctl.set-forced [referid amount])

;add to forced amount of referid
(defn inventory-ctl.add-forced [referid amount])

;wipe all forced items
(defn inventory-ctl.wipe-forced [])

;scan inventory
(defn inventory-ctl.scan [])

;find item locations in inventory
(defn inventory-ctl.find-item [referid])

;move item to inventory
(defn inventory-ctl.move-craftslot [inventory-slot craft-slot amount]
  (local amount (or amount 1)))

;fill recipe for crafting
(defn inventory-ctl.fill-recipe [recipe times]
  (local times (or times 1)))

;clean robot from start to stop slot
(defn inventory-ctl.clean-robot [start stop]
  (local start (or start 1))
  (local stop (or stop 16)))

;execute craft
(defn inventory-ctl.craft [])

inventory-ctl
