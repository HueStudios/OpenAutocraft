(local Recipe-index {})
(set Recipe-index.__index Recipe-index)

(defn Recipe-index.new []
  (let [self (setmetatable {} Recipe-index)]
    (set self.items [])
    (set self.recipes [])
    self))

;; convert a referid to a number representation
(defn Recipe-index.referid->number [self referid]
  (var r nil)
  (each [i v (ipairs self.items)]
    (when (= v referid)
      (set r i)))
  r)

;; convert a number representation to referid
(defn Recipe-index.number->referid [self the-number]
  (. self.items the-number))

;; register item to item index to make system aware and assign a number
(defn Recipe-index.add-item [self referid]
  (tset
    self.items
    (+ 1 (# self.items))
    referid))

;; normalize result to contain numbers indtead of referids
(defn Recipe-index.normalize-result [self result]
  (local normalized {})
  (each [item amount (pairs result)]
    (if (= (type item) "string")
        (tset normalized
          (: self :referid->number item)
          amount)
        (tset normalized
          item
          amount)))

  ;;(each [k v (pairs normalized)]
  ;;  (print ">" k v))
  normalized)

;; normalize pattern to contain numbers instead of referids
(defn Recipe-index.normalize-pattern [self pattern]
  (local normalized {})
  (each [index id (ipairs pattern)]
    (if (= (type id) "string")
        (tset normalized
          index
          (: self :referid->number id))
        (tset normalized
          index
          id)))
  normalized)

;; register a new recipe, given pattern and result
(defn Recipe-index.add-recipe [self pattern result]
  (tset
    self.recipes
    (+ 1 (# self.recipes))
    { :pattern (: self :normalize-pattern pattern)
      :result (: self :normalize-result result)}))

;; check if recipe creates an item (by referid)
(defn Recipe-index.recipe-creates [self recipe referid]
  (var r nil)
  (each [k v (pairs (: self :normalize-result (. recipe :result)))]
    (when (= k (: self :referid->number referid))
      (set r v)))
    ;;(print ">>" k v))
  r)

;; find recipes that craft item (by referid)
(defn Recipe-index.find-recipes [self referid]
  (local r [])
  (each [i v (ipairs self.recipes)]
    (when (: self :recipe-creates v referid)
          (tset r (+ 1 (# r)) v)))
  r)

;; try to get first recipe for a given item (by referid)
(defn Recipe-index.find-any-recipe [self referid]
  (let [recipes (: self :find-recipes referid)]
    (. recipes 1)))

;; get all items needed for a given recipe
(defn Recipe-index.required-items [self recipe]
  (local r {})
  (defn add-item [item amount]
    (let [amount (or amount 1)]
      (when (not (. r item))
        (tset r item 0))
      (tset r item (+ amount (. r item)))))
  (each [i v (ipairs (. recipe :pattern))]
    (when (~= v 0)
      (add-item (: self :number->referid v))))
  r)

;;how many result <referid> items after <amount> crafts of <recipe>
(defn Recipe-index.crafts-resulting [self recipe referid amount]
  (local per-craft (: self :recipe-creates recipe referid))
  (* per-craft amount))

(defn Recipe-index.crafts-resulting-referid [self referid amount]
  (local recipe (: self :find-any-recipe referid))
  (if recipe
    (: self :crafts-resulting recipe referid amount)
    (do (print "<!> ERRR no recipe for" referid "PANIC" "in crafts-resulting-referid")
        (os.exit))))

;;how many crafts of recipe to reach desired amount of target item
(defn Recipe-index.crafts-needed [self recipe referid amount]
  (local per-craft (: self :recipe-creates recipe referid))
  (math.ceil (/ amount per-craft)))

(defn Recipe-index.crafts-needed-referid [self referid amount]
  (local recipe (: self :find-any-recipe referid))
  (if recipe
    (: self :crafts-needed recipe referid amount)
    (do (print "<!> ERRR no recipe for" referid "PANIC" "in crafts-needed-referid")
        (os.exit))))

Recipe-index
