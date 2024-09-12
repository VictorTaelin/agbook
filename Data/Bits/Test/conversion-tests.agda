module Data.Bits.Test.conversion-tests where

open import Data.Bits.Type
open import Data.Bits.encode-utf8
open import Data.Bits.decode-utf8
open import Data.Bits.show
open import Data.String.Type
open import Data.Equal.Type
open import Data.Bits.show-rev

to-and-back : String → String
to-and-back x = decode-utf8 (encode-utf8 x)

test-inverses-1 : to-and-back "" === ""
test-inverses-1 = refl

test-inverses-2 : to-and-back "a very big string using ascii characters![]&./z\0\n" ===
                              "a very big string using ascii characters![]&./z\0\n"
test-inverses-2 = refl

test-inverses-3 : to-and-back "(λf ((λx (f (x x))) (λx (f (x x)))))" ===
                              "(λf ((λx (f (x x))) (λx (f (x x)))))"
test-inverses-3 = refl

test-inverses-4 : to-and-back "🌟" === "🌟"
test-inverses-4 = refl

test-inverses-5 : to-and-back "𒁊" === "𒁊"
test-inverses-5 = refl

test-inverses-6 : to-and-back "Hello 🌎!" === "Hello 🌎!"
test-inverses-6 = refl

test-inverses-7 : to-and-back "𓆈 𓆉 𓆊 𓆋 𓅯" === "𓆈 𓆉 𓆊 𓆋 𓅯"
test-inverses-7 = refl
