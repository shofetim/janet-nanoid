(def- DEFAULT_ALPHABET "_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

(def- DEFAULT_RNG (math/rng (os/time)))

(def- masks [15 31 63 127 255])

(defn gen
  "Generate secure random ID. Default size of 21."
  [&keys {:size size
          :alphabet alphabet}]
  (default size 21)
  (default alphabet DEFAULT_ALPHABET)

  (let [mask (find |(>= $ (dec (length alphabet))) masks)
        step (->> alphabet
                  (length)
                  (/ (* 1.6 mask size))
                  (math/ceil))
        result (array/new size)]
    (while (> size (length result))
      (loop [byte :in (os/cryptorand step)
             :when (> size (length result))]
        (let [mask-byte (band mask byte)
              char (get alphabet mask-byte)]
          (if char (array/push result char)))))
    (string/from-bytes ;result)))


(defn gen-non-secure
  "Generate pseudorandom ID. Default size of 21."
  [&keys {:size size
          :alphabet alphabet
          :rng rng}]
  (default size 21)
  (default alphabet DEFAULT_ALPHABET)
  (default rng DEFAULT_RNG)


  (string/from-bytes
    ;(seq [i :range [0 size]]
       (get alphabet (math/rng-int rng (length alphabet))))))
