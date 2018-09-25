(local util-stack {})

;convert OC stack information to essential stackdata
(defn util-stack.stack->stackdata [the-table]
  (local tmp-table {})
  (tset tmp-table :colname the-table.name)
  (tset tmp-table :label the-table.label)
  (tset tmp-table :referid (.. the-table.name ":" the-table.label))
  (tset tmp-table :amount the-table.size)
  (tset tmp-table :max-amount the-table.maxSize)
  tmp-table)

;extract referid from OC stack information
(defn util-stack.stack->referid [the-table]
  (.. the-table.name ":" the-table.label))

;return label part of referid
(defn util-stack.labelate [the-string]
  (local rv (string.reverse the-string))
  (local i (string.find rv ":"))
  (string.sub the-string (+ 1 (- i)) -1))

util-stack
