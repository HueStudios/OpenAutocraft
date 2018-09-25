(local sides (require :sides))

(local c (require :component))
(local robot c.robot)
(local ic c.inventory_controller)

(local us (require :util-stack))

(local inventory-ctl {})

(local craftslots [1 2 3 5 6 7 9 10 11])
(local input sides.down)
(local output sides.down)
(var inventory [])
(var items-real {})
(var items-forced {})

;real amount of items
(defn inventory-ctl.real-amount [referid]
  (or (. items-real referid) 0))

;forced amount of items
(defn inventory-ctl.forced-amount [referid]
  (or (. items-forced referid) 0))

;sum of real and forced amounts
(defn inventory-ctl.amount [referid]
  (+ (inventory-ctl.real-amount referid) (inventory-ctl.forced-amount referid)))

;set real amount of referid
(defn inventory-ctl.set-real [referid amount]
  (tset items-real referid amount))

;add to real amount of referid
(defn inventory-ctl.add-real [referid amount]
  (tset items-real referid (+ (inventory-ctl.real-amount referid) amount)))
  ;(print referid amount))

;set forced amount of referid
(defn inventory-ctl.set-forced [referid amount]
  (tset items-forced referid amount))

;add to forced amount of referid
(defn inventory-ctl.add-forced [referid amount]
  (tset items-forced referid (+ (inventory-ctl.forced-amount) amount)))

;wipe all forced items
(defn inventory-ctl.wipe-forced []
  (set items-forced {}))

;scan inventory
(defn inventory-ctl.scan []
  (local stacks ((. (ic.getAllStacks input) :getAll)))
  (set inventory [])
  (each [k stack (pairs stacks)]
    ;(print k stack)
    (each [kk vv (pairs stack)]
      ;(print kk vv)
      (let [stackdata (us.stack->stackdata stack)]
        (inventory-ctl.add-real stackdata.referid stackdata.amount)
        (tset inventory k stackdata)))))

;find item locations in inventory
(defn inventory-ctl.find-item [referid]
  (local r {})
  (defn find-slots []
    (each [i stackdata (ipairs inventory)]
      (when (= stackdata.referid referid)
        ;(tset r (+ (# r) 1) stackdata)
        (when (> stackdata.amount 0)
          (tset r i stackdata)))))
  (find-slots)
  (when (<= (# r) 0)
    (inventory-ctl.scan)
    (find-slots))
  r)

;move item to inventory
(defn inventory-ctl.move-craftslot [inventory-slot craft-slot amount]
  (local amount (or amount 1))
  (local d-slot (. craftslots craft-slot))
  (robot.select d-slot)
  (ic.suckFromSlot self.input inventory-slot amount)
  (tset (. self.inventory inventory-slot) :amount (- (. (. self.inventory inventory-slot) :amount) 1)))

;fill recipe for crafting
(defn inventory-ctl.fill-recipe [recipe times]
  (local times (or times 1)))
  ;TODO will depend on recipe format

;clean robot from start to stop slot
(defn inventory-ctl.clean-robot [start stop]
  (local start (or start 1))
  (local stop (or stop 16))
  (for [n start stop]
    (robot.select n)
    (robot.drop self.input)))

;execute craft
(defn inventory-ctl.craft [times]
  (local crafting c.crafting)
  (robot.select 1)
  (c.craft times))

inventory-ctl
