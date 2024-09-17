module Data.Int.Test.double where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Equal.apply
open import Data.Int.double
open import Data.Int.inc
open import Data.Int.add
open import Data.Equal.subst


lemma21 : ∀ {n} →  (add (Pos n) (Pos (Succ n))) === (add (Pos (Succ n)) (Pos n))

lemma2 : ∀ {n} → add (Pos n) (Pos (Succ n)) === (inc (add (Pos n) (Pos n)))
lemma2 {Zero} = refl
lemma2 {Succ n} = do
  let ind = lemma2 {n}
  let app = apply inc ind
  let sub = subst (λ x → add (Pos (Succ n)) (Pos n) === inc x) ind 
  let l21 = lemma21{n}
  {!!}

-- Goal  : inc (add (Pos       n)  (Pos (Succ (Succ  n)))) === inc (inc (add (Pos n) (Pos (Succ n))))
-- - ind :      add (Pos       n)  (Pos (Succ        n))   ===      inc (add (Pos n) (Pos       n))
-- - app : inc (add (Pos       n)  (Pos (Succ        n)))  === inc (inc (add (Pos n) (Pos       n)))
-- - sub :      add (Pos (Succ n)) (Pos              n)    ===      inc (add (Pos n) (Pos (Succ n))) →
--              add (Pos (Succ n)) (Pos              n)    === inc (inc (add (Pos n) (Pos n)))
-- - l21 :      add (Pos       n)  (Pos (Succ        n))   ==  
--              add (Pos (Succ n)) (Pos              n)
