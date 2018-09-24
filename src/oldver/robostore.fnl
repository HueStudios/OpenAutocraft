(local sides (require :sides))
(local util-stack (require :util-stack))

(local c (require :component))
(local robot c.robot)
(local ic c.inventory_controller)

(local craftslots [1 2 3 5 6 7 9 10 11])

(local Robostore {})
(set Robostore.__index Robostore)

(defn Robostore.new []
  (let [self (setmetatable {} Robostore)]
    (set self.input sides.down)
    (set self.output sides.down)
    (set self.inventory [])
    (set self.items {})
    (set self.forced {})
    self))

(defn Robostore.index [self]
  (set self.inventory [])
  (let [(size-dst msg) (ic.getInventorySize self.input)]
    (when size-dst
      (local tmp-inventory [])
      (for [slot-dst 1 size-dst]
        (let [tmp-stack (ic.getStackInSlot self.input slot-dst)]
          (when tmp-stack
            (local nxstack (util-stack.from-table tmp-stack))
            (tset tmp-inventory slot-dst nxstack)))
        (os.sleep))
      (set self.inventory tmp-inventory)))

  (: self :organize))

(defn Robostore.organize [self]
  (set self.items {})
  (each [slot stack (pairs self.inventory)]
    (when (and stack (> stack.amount 0))
      (tset self.items stack.referid (+ stack.amount (: self :get-organized-amount stack.referid))))))

(defn Robostore.get-organized-amount [self referid retry]
  (local retry (or retry false))
  (if (. self.items referid)
      (. self.items referid)
      (if retry
          (do
            (: self :index)
            (: self :get-organized-amount referid))
          0)))

(defn Robostore.get-forced-amount [self referid]
  (if (. self.forced referid)
      (. self.forced referid)
      0))

(defn Robostore.get-amount [self referid]
  (+ (: self :get-organized-amount referid true)
     (: self :get-forced-amount referid)))

(defn Robostore.force-add [self referid amount]
  (tset self.forced referid (+ (: self :get-forced-amount referid) amount)))

(defn Robostore.force-remove [self referid amount]
  (tset self.forced referid (- (: self :get-forced-amount referid) amount)))

(defn Robostore.force-wipe [self]
  (set self.forced {}))

(defn Robostore.clean-robot [self]
  (for [n 1 16]
    (robot.select n)
    (robot.drop self.output)))

(defn Robostore.move-craftslot [self s-slot c-slot]
  (local d-slot (. craftslots c-slot))
  (robot.select d-slot)
  (ic.suckFromSlot self.input s-slot 1)
  (tset (. self.inventory s-slot) :amount (- (. (. self.inventory s-slot) :amount) 1)))

;;find slot containing item (by referid)
(defn Robostore.find-any [self referid]
  (var found nil)
  (defn find-slot []
    (each [slot stack (pairs self.inventory)]
      (when (= stack.referid referid)
        (when (> stack.amount 0)
          (set found slot)))))
  (find-slot)
  (when (= found nil)
    (: self :index)
    (find-slot))
  found)


Robostore
