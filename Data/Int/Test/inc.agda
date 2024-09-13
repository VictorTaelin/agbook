module Data.Int.Test.inc where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Int.inc



test0 : inc (Pos Zero) === Pos (Succ Zero)
test0 = refl

test1 : inc (Neg Zero) === (Pos Zero)
test1 = refl

test2 : inc (Neg (Succ Zero)) === Neg Zero
test2 = refl

test3 : inc (inc (inc (Neg Zero))) === Pos (Succ (Succ Zero))
test3 = refl

test4 : inc (Pos (Succ (Succ (Succ Zero)))) === Pos (Succ (Succ (Succ (Succ Zero))))
test4 = refl

test5 : ∀ {n} → inc (Pos n) === Pos (Succ n) 
test5 = refl

test6 : ∀ {n} → inc (Neg (Succ n)) === (Neg n)
test6 = refl

