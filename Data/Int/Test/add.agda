module Data.Int.Test.add where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Equal.apply
open import Data.Int.inc
open import Data.Int.add
open import Data.Equal.subst
open import Data.Equal.sym
open import Data.Int.Test.inc

add_lemma0 : ∀ {n} →  add n (Pos Zero) === n 
add_lemma0 {Pos Zero} = refl
add_lemma0 {Pos (Succ n)} = do 
  let ind = add_lemma0 {Pos n}
  let app = apply inc ind
  app
add_lemma0 {Neg Zero} = refl
add_lemma0 {Neg (Succ n)} = refl

add_zero_lemma : ∀ {n} → add (Pos Zero) n === n
add_zero_lemma {Pos Zero}     = refl
add_zero_lemma {Neg Zero}     = refl
add_zero_lemma {Pos (Succ n)} = refl
add_zero_lemma {Neg (Succ n)} = refl

add_lemma1 : ∀ {n} →  add (Pos 1) n === (inc n) 
add_lemma1 {Pos Zero}     = refl
add_lemma1 {Neg Zero}     = refl
add_lemma1 {Pos (Succ n)} = refl
add_lemma1 {Neg (Succ n)} = refl

add_lemma2 : ∀ {m n} → (inc (add (Pos m) (Pos n))) === add (Pos m) (inc (Pos n))
add_lemma2 {Zero} {n} = do
  let add0 = (add_zero_lemma {Pos n})
  let app = apply inc add0
  app
add_lemma2 {Succ m} {n} = do
  let ind = add_lemma2 {m} {n}
  let app = apply inc ind
  let ind0 = add_lemma2 {m }{Zero} 
  let appm = apply (add (Pos n)) ind0
  {!!}
  

-- - Goal : inc (add (Pos (Succ m)) (Pos n)) === inc (add (Pos m) (Pos (Succ n)))
-- - ind  : inc (add (Pos m) (Pos n))        === add (Pos m) (Pos (Succ n))
-- - app  : inc (inc (add (Pos m) (Pos n)))  === inc (add (Pos m) (Pos (Succ n)))
-- - ind0 : Pos (Succ m)                     === add (Pos m) (Pos 1)
-- - appm : add (Pos n) (Pos (Succ m))       === add (Pos n) (add (Pos m) (Pos 1))

add_lemma4 : ∀ {m n} → (add m n) === (add n m)
add_lemma4 {Pos Zero}     {Pos Zero}      = refl
add_lemma4 {Pos Zero}     {Pos (Succ n)}  = refl
add_lemma4 {Pos Zero}     {Neg Zero}      = refl
add_lemma4 {Pos Zero}     {Neg (Succ n)}  = refl
add_lemma4 {Pos (Succ m)} {Pos Zero}      = refl
add_lemma4 {Pos (Succ m)} {Pos (Succ n)}  = do
  let ind = add_lemma4 {Pos m} {Pos n}
  let app = apply inc ind
  {!!}

