module Data.Int.dec where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Equal.apply

dec : Int → Int
dec (Pos Zero)      = NegSuc 1
dec (NegSuc Zero)   = NegSuc 1
dec (NegSuc n)      = NegSuc (Succ n)
dec (Pos (Succ n))  = Pos n


lemma : ∀ {n} → dec (NegSuc n) == NegSuc (Succ n)
lemma {Zero}= refl
lemma {Succ n} = refl
