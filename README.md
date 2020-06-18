# janet-nanoid

[![builds.sr.ht status](https://builds.sr.ht/~statianzo/janet-nanoid/.build.yml.svg)](https://builds.sr.ht/~statianzo/janet-nanoid/.build.yml?)
[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)

A library for generating random IDs.

Ported implementation of [nanoid](https://zelark.github.io/nano-id-cc/) in
[Janet](https://janet-lang.org/).

# Install

```
jpm install https://git.sr.ht/~statianzo/janet-nanoid
```

# Usage

nanoid comes with two variants `gen` and `gen-non-secure`.

`gen` relies on Janet's `os/cryptorand` to obtain cryptographically
secure random bytes.

`gen-non-secure` uses the `math/rng` pseudorandom generator.

## Options

* `:size` - Length of the output string (default `21`)
* `:alphabet` - Alphabet of characters to use (defaults alphanumeric and `-_`)
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

![goatcounter](https://janet-nanoid.goatcounter.com/count?p=/README.md)
