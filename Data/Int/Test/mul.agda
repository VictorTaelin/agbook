module Data.Int.Test.mul where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Equal.Type
open import Data.Equal.apply
open import Data.Equal.sym
open import Data.Equal.subst
open import Data.Int.mul
open import Data.Int.inc
open import Data.Int.not
open import Data.Int.add
open import Data.Int.Test.add

mul1 : ((+ 2) * (+ 3)) === (+ 6)
mul1 = refl

mul2 : ((+ 2) * (- 3)) === (- 6)
mul2 = refl

mul3 : ((- 2) * (- 3)) === (+ 6)
mul3 = refl

mul4 : ((- 2) * (+ 3)) === (- 6)
mul4 = refl

mul5 : ((+ 0) * (+ 3)) === (+ 0)
mul5 = refl

mul6 : ((+ 3) * (+ 0)) === (+ 0)
mul6 = refl

mul7 : ((- 3) * (+ 0)) === (+ 0)
mul7 = refl

mul8 : ((+ 0) * (- 3)) === (+ 0)
mul8 = refl

mul9 : ((+ 1) * (+ 1)) === (+ 1)
mul9 = refl

mul10 : ((+ 1) * (- 1)) === (- 1)
mul10 = refl

mul_lemma0 : ∀ {m} → (m * (+ 0)) === (+ 0)
mul_lemma0 {Pos Zero}     = refl
mul_lemma0 {Neg Zero}     = refl
mul_lemma0 {Pos (Succ m)} = refl
mul_lemma0 {Neg (Succ m)} = refl

mul_lemma1 : ∀ {m} → (m * (+ 1)) === m
mul_lemma1 {Pos Zero}     = refl
mul_lemma1 {Neg Zero}     = refl
mul_lemma1 {Pos (Succ m)} = refl
mul_lemma1 {Neg (Succ m)} = refl

mul_lemma2 : ∀ {m} → (m * (- 1)) === (not m)
mul_lemma2 {Pos Zero}     = refl
mul_lemma2 {Neg Zero}     = refl
mul_lemma2 {Pos (Succ m)} = refl
mul_lemma2 {Neg (Succ m)} = refl

mul_lemma3 : ∀ {m} → (Pos 1) * m === m
mul_lemma3 {Pos Zero}     = refl
mul_lemma3 {Neg Zero}     = refl
mul_lemma3 {Pos (Succ m)} = do
  let ind0 = mul_lemma3 {Pos m}
  let app0 = apply (λ t → inc t) ind0
  let cong = add_lemma3 {Pos m} 
  let mirr = sym ind0
  let rwt0 = subst (λ t →  (add (Pos 1) t) === (Pos (Succ m) )) mirr cong
  rwt0
mul_lemma3 {Neg (Succ m)} = refl


λ-cong-mul : ∀ {m n : Nat} → 
  mul (Pos       m)  (Pos n) === mul (Pos n) (Pos       m) → 
  mul (Pos (Succ m)) (Pos n) === mul (Pos n) (Pos (Succ m))
λ-cong-mul {Zero} {n} eq = do
  let ind0 = mul_lemma1 {Pos n}
  let ind1 = mul_lemma3 {Pos n}
  let mir0 = sym ind0
  let rwt1 = subst (λ t →  ( mul (Pos 1) (Pos n)  === t))  mir0 ind1
  rwt1
λ-cong-mul {Succ m} {n} eq = do
  let ind0 = λ-cong-mul {m} {n}
  {!!}


mul_comm : ∀ {m n} → (m * n) === (n * m)
mul_comm {Pos Zero}     {n}         = sym (mul_lemma0 {n})
mul_comm {Neg Zero}     {n}         = sym (mul_lemma2 {n})
mul_comm {Pos (Succ m)} {Pos Zero}  = refl
mul_comm {Pos (Succ m)} {Neg Zero}  = refl
mul_comm {Pos (Succ m)} {Pos n}     = do
  let ind0 = mul_comm {Pos m} {Pos n}
  let ind1 = λ-cong-mul ind0
  ind1



