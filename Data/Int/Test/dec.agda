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

dec0 :  ∀ {n}→  (Pos n) === dec (Pos (Succ n))
dec0 {Zero}   = refl
dec0 {Succ n} = refl

dec1 : ∀ {n}→  (Neg (Succ n)) === dec (Neg n)
dec1 {Zero}   = refl
dec1 {Succ n} = refl

dec2 : (Neg 1) === dec (Pos Zero)
dec2 = refl
