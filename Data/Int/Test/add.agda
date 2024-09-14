module Data.Int.Test.add where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Equal.apply
open import Data.Int.inc
open import Data.Int.add
open import Data.Equal.subst

add_lemma3 : ∀ {n} →  add (Pos 1) n === (inc n) 
add_lemma3 {Pos Zero}     = refl
add_lemma3 {Neg Zero}     = refl
add_lemma3 {Pos (Succ n)} = refl
add_lemma3 {Neg (Succ n)} = refl

-- add_lemma1 : ∀ {n} → inc (add (Pos n) (Pos n)) === add (Pos n) (Pos (Succ n))

-- add_lemma : ∀ {n}→  inc (add (Pos (Succ n)) (Pos n)) === inc (inc (add (Pos n) (Pos n)))
-- add_lemma {Zero} = refl
-- add_lemma {Succ n} = do
--   let ind = add_lemma {n}
--   let app = apply inc ind
--   let lam = (λ z →  (add (Pos (Succ z)) (Pos n)))
--   let ap1 = apply (λ x → inc (add (Pos (Succ x)) (Pos n) ) === inc (inc (add (Pos x) (Pos n))) )
--   let ap2 = add_lemma1
--   let rwt = subst (λ m →  inc (add (Pos n) (Pos m)) === add (Pos n) (Pos (Succ n)))
--   {!!}

-- Goal: inc (inc (add (Pos (Succ (Succ n)))(Pos n))) == inc (inc (inc (add (Pos (Succ n))(Pos n))))
-- ind :      inc (add (Pos (      Succ n)) (Pos n))  ==      inc (inc (add (Pos       n) (Pos n)))
-- app : inc (inc (add (Pos (      Succ n)) (Pos n))) == inc (inc (inc (add (Pos       n) (Pos n))))
-- ap1 : 
-- {x y : Nat} → x == y →
--           (inc (add (Pos (      Succ x)) (Pos n)) ==       inc (inc (add (Pos      x) (Pos n)))) ==
--           (inc (add (Pos (      Succ y)) (Pos n)) ==       inc (inc (add (Pos      y) (Pos n))))
--ap2 : {n = n₁ : Nat} → inc (add (Pos n₁) (Pos n₁)) == add (Pos n₁) (Pos (Succ n₁))




add_lemma2 : ∀ {n} →  add n (Pos Zero) === n 
add_lemma2 {Pos Zero} = refl
add_lemma2 {Pos (Succ n)} = do 
  let ind = add_lemma2 {Pos n}
  let app = apply inc ind
  app
add_lemma2 {Neg Zero} = refl
add_lemma2 {Neg (Succ n)} = refl



