(defn moan [anchor contender]
  (loop [x anchor n contender]
    (if (<= x n)
      n
      (recur x (+ n contender))
    )
  )
)

(defn tint [x] (Integer/parseInt x))

(with-open [rdr (clojure.java.io/reader (first *command-line-args*))]
  ; Read each line ignoring empty ones
  (doseq [line (remove empty? (line-seq rdr))]
    (let [nums (clojure.string/split line #",")]
      (let [[a c] nums]
        (println (moan (tint a) (tint c)))
      )
    )
  )
)