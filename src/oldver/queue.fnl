(local Queue {})
(set Queue.__index Queue)

(defn Queue.new []
  (let [self (setmetatable {} Queue)]
    (set self.first 0)
    (set self.last -1)
    (set self.data {})
    self))

(defn Queue.push-left [self value]
  (set self.first (- self.first 1))
  (tset self.data self.first value))

(defn Queue.push-right [self value]
  (set self.last (+ self.last 1))
  (tset self.data self.last value))

(defn Queue.pop-left [self]
  ;(local first self.first)
  (var value nil)
  (when (: self :not-empty?)
    (set value (. self.data self.first))
    (tset self.data self.first nil)
    (set self.first (+ self.first 1)))
  value)

(defn Queue.pop-right [self]
  (var value nil)
  (when (: self :not-empty?)
    (set value (. self.data self.last))
    (tset self.data self.last nil)
    (set self.last (- self.last 1)))
  value)

;; TODO evaluate
(defn Queue.not-empty? [self]
  (<= self.first self.last))

(defn Queue.peek-all [self]
  (local the-all [])
  (for [i self.first self.last]
    (tset the-all (+ 1 (# the-all)) (. self.data i)))
  the-all)

Queue
