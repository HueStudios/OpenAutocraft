(local craft-queue (require :craft-queue))
(local inventory-ctl (require :inventory-ctl))
(local crafting-db (require :crafting-db))
(local recipes (require :recipes))
(local util (require :util))

(local craft-db (crafting-db recipes))
(local inventory (inventory-ctl craft-db))
(inventory.scan)

(local cq (craft-queue inventory craft-db))

(defn prompt [header]
  (io.write header)
  (io.read))

(local request-item (. args 1))
(local request-amount (. args 2))

(local want-referid (craft-db.shortid->referid-any request-item))

(when want-referid
  (local want-recipe (craft-db.providing-recipe-any want-referid))

  (for [n 1 request-amount]
    (cq.queue-recipe want-recipe)
    (cq.flush))

  (var craft (cq.pop-craft))
  (while craft
    (inventory.fill-recipe craft)
    (inventory.craft 64)
    (inventory.clean-robot)
    (set craft (cq.pop-craft))))
