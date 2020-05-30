(def- DEFAULT_ALPHABET "_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

(def- masks [15 31 63 127 255])

(defn gen [&keys {:size size
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
