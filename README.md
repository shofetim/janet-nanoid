# janet-nanoid

[![builds.sr.ht status](https://builds.sr.ht/~statianzo/janet-nanoid/.build.yml.svg)](https://builds.sr.ht/~statianzo/janet-nanoid/.build.yml?)

nanoid is a library for generating random IDs.

Implementation of [nanoid](https://zelark.github.io/nano-id-cc/) in
[Janet](https://janet-lang.org/).

# Install

```
jpm install git+https://git.sr.ht/~statianzo/janet-nanoid
```

# Usage

nanoid comes with two variants `gen` and `gen-non-secure`.

`gen` relies on Janet's `os/cryptorand` to obtain cryptographically
secure random bytes.

`gen-non-secure` uses the `math/rng` pseudorandom generator.

## Options

* `:size` - Length of the output string (default `21`)
* `:alphabet` - Alphabet of characters to use (default `"_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"`)
* `:rng` - `math/rng` instance to generate (`gen-non-secure` only)

## Example

```clojure
(import nanoid)

(nanoid/gen)
# "xo25OEhGZ7yoHYbfPpmZE"

(nanoid/gen :size 5)
# "U5bBu"

(nanoid/gen :alphabet "abcd1234")
# "24234a13a4ddddc3dbb4a"

(nanoid/gen-non-secure :size 5)
# "vWgzu"
```
