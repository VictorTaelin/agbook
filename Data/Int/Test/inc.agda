module Data.Int.Test.inc where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Int.inc



inc0 : inc (Pos Zero) === Pos (Succ Zero)
inc0 = refl

inc1 : inc (Neg Zero) === (Pos Zero)
inc1 = refl

inc2 : inc (Neg (Succ Zero)) === Neg Zero
inc2 = refl

inc3 : inc (inc (inc (Neg Zero))) === Pos (Succ (Succ Zero))
inc3 = refl

inc4 : inc (Pos (Succ (Succ (Succ Zero)))) === Pos (Succ (Succ (Succ (Succ Zero))))
inc4 = refl

inc5 : ∀{n} → inc (Pos n) === Pos (Succ n)
inc5 {Zero} = refl
inc5 {Succ n} = refl

inc6 : ∀{n} → inc (Neg (Succ n)) === (Neg n)
inc6 = refl


