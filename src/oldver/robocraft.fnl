(local Rindex (require :recipe-index))
(local Rstore (require :robostore))
(local Queue (require :queue))
(local seeds (require :seeds))

(local c (require "component"))
(local crafting c.crafting)

(defn prp [recipe]
  (each [i v (ipairs (. recipe :pattern))]
    (when (and (= 0 (% (- 1 i) 3)) (> i 1))
      (print))
    (io.write (.. "  " v)))
  (print))

(defn prr [recipe]
  (each [k v (pairs (. recipe :result))]
    (local referid (: rc.rindex :number->referid k))
    (print (.. "  " v "x") referid)))

(local Robocraft {})
(set Robocraft.__index Robocraft)

(defn Robocraft.new []
  (let [self (setmetatable {} Robocraft)]
    (set self.rindex (Rindex.new))
    (each [k v (pairs seeds.items)]
      (: self.rindex :add-item v))
    (each [i v (ipairs seeds.recipes)]
      (: self.rindex :add-recipe (. v :pattern) (. v :result)))

    (set self.rstore (Rstore.new))

    (set self.queue (Queue.new))

    (: self.rstore :clean-robot)
    self))

(defn Robocraft.queue-recipe [self recipe]
  (local wanted (: self.rindex :required-items recipe))
  (each [k v (pairs wanted)]
    (local found (: self.rstore :get-amount k))
    ;(print k v " _ " found)
    (local needed (- v found))
    (if (> needed 0)
        (do
          (local cn (: self.rindex :crafts-needed-referid k needed))
          ;(print "<-> craft missing" k cn "times")
          (local cr (: self.rindex :crafts-resulting-referid k cn))
          ;(local overflow (- cr needed))
          ;(: self.rstore :force-add k overflow)
          ;(: self.rstore :force-add k (- cr needed))
          (: self.rstore :force-add k cr)
          ;(print "<-> Overflow" overflow "items")
          (for [t 1 cn]
            (: self :queue-referid k)))
        (do))
    (: self.rstore :force-remove k v))
  (: self.queue :push-left recipe))

(defn Robocraft.queue-referid [self referid]
  (local recipe (: self.rindex :find-any-recipe referid))
  (if recipe
      (do (print (.. "<-> INFO queueing " referid))
          (: self :queue-recipe recipe))
      (do (print "<!> ERRR no recipe for" referid "PANIC" "queue-referid")
          (os.exit))))

(defn Robocraft.get-queue [self]
  (: self.queue :peek-all))

(defn Robocraft.fetch-item [self referid craft-slot]
  (local item-slot (: self.rstore :find-any referid))
  (if item-slot
    (: self.rstore :move-craftslot item-slot craft-slot)
    (do
      (print "<!> ERRR item" referid "missing PANIC" "fetch-item")
      (os.exit))))

(defn Robocraft.craft-recipe [self recipe]
  (print "<-> INFO crafting recipe")
  (each [i refernum (ipairs (. recipe :pattern))]
    (when (> refernum 0)
      (local referid (: self.rindex :number->referid refernum))
      (: self :fetch-item referid i)))
  (crafting.craft 1)
  (: self.rstore :clean-robot))

(defn Robocraft.craft-next [self]
  (local recipe (: self.queue :pop-right))
  (: self.rstore :force-wipe)
  (if recipe
    (do
      (: self :craft-recipe recipe)
      true)
    (do
      ;(print "<!> ERRR no next recipe")
      nil)))


Robocraft
