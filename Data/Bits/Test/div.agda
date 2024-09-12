module Data.Bits.Test.div where

open import Data.Bits.Type
open import Data.Bits.div
open import Data.Equal.Type
open import Data.Unit.Type

-- 0 / 1 = 0
test-div-zero-one : (O E) / (I E) == E
test-div-zero-one = refl

-- 1 / 1 = 1
test-div-one-one : (I E) / (I E) == (I E)
test-div-one-one = refl

-- 2 / 1 = 2
test-div-two-one : (O (I E)) / (I E) == ( O (I E))
test-div-two-one = refl

-- 4 / 2 = 2
test-div-four-two : (O (O (I E))) / (O (I E)) == (O (I E))
test-div-four-two = refl

-- 5 / 2 = 2
test-div-five-two : (I (O (I E))) / (O (I E)) == (O (I E))
test-div-five-two = refl

-- 6 / 3 = 2
test-div-six-three : (O (I (I E))) / (I (I E)) == (O (I E))
test-div-six-three = refl

-- 7 / 3 = 2
test-div-seven-three : (I (I (I E))) / (I (I E)) == (O (I E))
test-div-seven-three = refl

-- 8 / 3 = 2
test-div-eight-three : (O (O (O (I E)))) / (I (I E)) == (O (I E))
test-div-eight-three = refl

-- 9 / 3 = 3
test-div-nine-three : (I (O (O (I E)))) / (I (I E)) == (I (I E))
test-div-nine-three = refl

-- 15 / 4 = 3
test-div-fifteen-four : (I (I (I (I E)))) / (O (O (I E))) == (I (I E))
test-div-fifteen-four = refl

