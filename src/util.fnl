(defn print-recipe [recipe]
  (print "<-> recipe")
  (print ">" "pattern")
  (each [i v (ipairs (. recipe :pattern))]
    (when (and (= 0 (% (- 1 i) 3)) (> i 1))
      (print))
    (io.write (.. "  " v)))
  (print)
  (print ">" "result")
  (each [k v (pairs (. recipe :result))]
    (print (.. "  " v "x") k)))

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
