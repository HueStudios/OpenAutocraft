(local util {})

(defn util.print-recipe [recipe]
  (print (.. "=====RECIPE====="))
  (print (.. :kind " " (or (. recipe :kind) "default")))
  (print (.. :maxbatch " " (or (. recipe :maxbatch) "default")))
  (print (.. :minbatch " " (or (. recipe :minbatch) "default")))
  (print (.. :gamble " " (or (. recipe :gamble) "default")))
  (each [i v (ipairs (. recipe :pattern))]
    (print "pattern" i v))
  (each [k v (pairs (. recipe :result))]
    (print "result" k v)))

(defn util.print-list [list]
  (each [i v (ipairs list)]
    (print i v)))

(defn util.print-table [table]
  (each [k v (pairs table)]
    (print k v)))

(defn util.print-queue [queue]
  (local tmp-list (queue.peek-all))
  (util.print-list tmp-list))

(defn util.recipe-results-string [recipe]
  (var results "")
  (each [k v (pairs (. recipe :result))]
    (set results (.. results "\n(result " k " " v")")))
  results)

(defn util.print-recipe-results [recipe]
  (print (util.recipe-results-string recipe)))

(defn util.error [message]
  (print (.. "<!> " message))
  (os.exit))

(defn util.warn [message]
  (print (.. "<~> " message))
  (os.exit))

util
