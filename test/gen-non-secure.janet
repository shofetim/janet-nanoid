(import ../nanoid :as n)

(loop [x :range [0 100]]
  (assert
    (= 21 (length (n/gen-non-secure)))
    "generates id of length 21"))

(loop [x :range [0 100]]
  (assert
    (= 10 (length (n/gen-non-secure :size 10)))
    "generates id of length 10"))

(let [results (table)]
  (loop [x :range [0 10_000]]
    (let [id (n/gen-non-secure)]
      (assert (nil? (results id))
              (string/format "%q not unique" id))
      (put results id true))))

(assert
  (= "eXB2i0JMOYeczrdWVJiYC"
     (n/gen-non-secure :rng (math/rng 123)))
  "allows custom rng")
