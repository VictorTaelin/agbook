module Data.Bits.Test.mod where

open import Data.Bits.Type
open import Data.Bits.mod
open import Data.Bits.from-nat
open import Data.Equal.Type

test-mod-1 : (from-nat 5 % from-nat 3) == from-nat 2
test-mod-1 = refl

test-mod-2 : (from-nat 10 % from-nat 4) == from-nat 2
test-mod-2 = refl

test-mod-3 : (from-nat 7 % from-nat 2) == from-nat 1
test-mod-3 = refl

test-mod-4 : (from-nat 0 % from-nat 5) == from-nat 0
test-mod-4 = refl

test-mod-5 : (from-nat 15 % from-nat 15) == from-nat 0
test-mod-5 = refl

test-mod-6 : (from-nat 100 % from-nat 30) == from-nat 10
test-mod-6 = refl
