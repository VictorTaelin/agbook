module Data.Int.Test.dec where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Int.dec

lemma0 : ∀ {n} → dec (Neg n) === Neg (Succ n)
lemma0 {Zero}   = refl
lemma0 {Succ n} = refl

lemma1 : ∀ {n} → dec (Pos (Succ n)) === Pos n
lemma1 {Zero}   = refl
lemma1 {Succ n} = refl

test :  ∀ {n}→  (Pos n) === dec (Pos (Succ n))
test {Zero}   = refl
test {Succ n} = refl

test1 : ∀ {n}→  (Neg (Succ n)) === dec (Neg n)
test1 {Zero}   = refl
test1 {Succ n} = refl

test2 : (Neg 1) === dec (Pos Zero)
test2 = refl
