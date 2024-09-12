module Data.Int.Test.double where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Equal.apply
open import Data.Int.double
open import Data.Int.inc
open import Data.Int.add
open import Data.Equal.subst



lemma2 : ∀ {n} → add (Pos n) (Pos (Succ n)) == (inc (add (Pos n) (Pos n)))
lemma2 {Zero} = refl
lemma2 {Succ n} = do
  let ind = lemma2 {n}
  let app = apply inc ind
  {!!}


lemma : ∀ {x}→  (x + x) == double x
lemma {(Pos Zero)}      = refl
lemma {(Neg Zero)}   = refl
lemma {(Pos (Succ n))}  = do
  let ind   = lemma {(Pos n)}
  let app   = (apply inc ind)
  let test  = (λ z →  inc z)
  let test1 = apply test app
  {!!}



-- inc (add (Pos (Succ n)) (Pos n)) == inc (inc (double (Pos n)))
-- inc (add (Pos       n)  (Pos n)) == inc (     double (Pos n))


-- inc (add (Pos (Succ n)) (Pos n)) == inc (inc (add (Pos n) (Pos n)))
