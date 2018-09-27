(local meta-queue {})
(defn meta-queue.__tostring [debug-queue]
  (local to-return "")
  (each [i v (ipairs (debug-queue.peek-all))]
    (set to-return (.. to-return (util.recipe-results-string v))))
  to-return)

(defn queue []
  (local new-queue {})
  (setmetatable new-queue meta-queue)
  (set new-queue.first 0)
  (set new-queue.last -1)
  (set new-queue.data {})

  (defn new-queue.push-left [value]
    (set new-queue.first (- new-queue.first 1))
    (tset new-queue.data new-queue.first value))

  (defn new-queue.push-right [value]
      (set new-queue.last (+ new-queue.last 1))
      (tset new-queue.data new-queue.last value))

  (defn new-queue.pop-left []
    ;(local first self.first)
    (var value nil)
    (when (new-queue.not-empty?)
      (set value (. new-queue.data new-queue.first))
      (tset new-queue.data new-queue.first nil)
      (set new-queue.first (+ new-queue.first 1)))
    value)

  (defn new-queue.pop-right []
    (var value nil)
    (when (new-queue.not-empty?)
      (set value (. new-queue.data new-queue.last))
      (tset new-queue.data new-queue.last nil)
      (set new-queue.last (- new-queue.last 1)))
    value)

  ;; TODO evaluate
  (defn new-queue.not-empty? []
    (<= new-queue.first new-queue.last))

  (defn new-queue.peek-all []
    (local the-all [])
    (for [i new-queue.first new-queue.last]
      (tset the-all (+ 1 (# the-all)) (. new-queue.data i)))
    the-all)

  new-queue)
