module Test.Bits.conversion-tests where

open import Data.Bits.Type
open import Data.Bits.to-string
open import Data.Bits.from-string
open import Data.String.Type
open import Data.Equal.Type

to-and-back : String → String
to-and-back x = to-string (from-string x)

test-inverses-1 : to-and-back "" == ""
test-inverses-1 = refl

test-inverses-2 : to-and-back "a very big string using ascii characters![]&./z\0\n" ==
                              "a very big string using ascii characters![]&./z\0\n"
test-inverses-2 = refl

test-inverses-3 : to-string (from-string "(λf ((λx (f (x x))) (λx (f (x x)))))") ==
                                         "(λf ((λx (f (x x))) (λx (f (x x)))))"
test-inverses-3 = refl

test-inverses-4 : to-and-back "🌟" == "🌟"
test-inverses-4 = refl

test-inverses-5 : to-and-back "𒁊" == "𒁊"
test-inverses-5 = refl
