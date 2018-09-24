(local Robocraft (require :robocraft))
(local thread (require :thread))


(defn craft [referid amount]
  (defn get-needed []
    (local rc (Robocraft.new))
    (local has (: rc.rstore :get-amount referid))
    (local needed (- amount has))
    (local cn (: rc.rindex :crafts-needed-referid referid needed))
    cn)
  (local crafts-needed (get-needed))
  (for [n 1 crafts-needed]
    (local rc (Robocraft.new))
    (: rc :queue-referid referid)
    (while (: rc :craft-next))))

(defn prompt [header]
  (io.write header)
  (io.read))

;(craft "opencomputers:transposer:Transposer" 60)
;(craft "immersiveengineering:wooden_device0:Item Router" 44)
;(craft "opencomputers:component:Server (Tier 3)" 1)
;(craft "opencomputers:rack:Rack" 1)
;(craft "opencomputers:component:Accelerated Processing Unit (APU) (Tier 2)" 1)

;(craft "opencomputers:component:Component Bus (Tier 3)" 3)
;(craft "opencomputers:screen3:Screen (Tier 3)" 5)

;(local r_item (prompt "Enter item referid>"))
;(local r_amount (prompt "Enter amount>"))
;
;(craft r_item r_amount)

;RACE
(craft "opencomputers:component:Central Processing Unit (CPU) (Tier 3)" 5)
