module Data.Int.Test.not where

open import Data.Int.not
open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Bool.Type
open import Data.Int.sub

not0 : ∀ {n} →i (not (not n)) === n
not0 {Pos Zero}      = refl
not0 {Neg Zero}      = refl
not0 {Pos (Succ n)}  = refl
not0 {Neg (Succ n)}  = refl

not1 : ∀ {n} → (not (not (not n))) === (not n)
not1 {Pos Zero}      = refl
not1 {Neg Zero}      = refl
not1 {Pos (Succ n)}  = refl
not1 {Neg (Succ n)}  = refl

not2 : ∀ {n} → (not n) === (sub (+ 0) n)
not2 {Pos Zero}      = refl
not2 {Neg Zero}      = refl
not2 {Pos (Succ n)}  = refl
not2 {Neg (Succ n)}  = refl
