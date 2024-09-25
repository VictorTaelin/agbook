module Base.Pair.Test.eq where

open import Base.Pair.Type
open import Base.Pair.eq
open import Base.Nat.Type
open import Base.Nat.eq
open import Base.Bool.Type
open import Base.Bool.eq
open import Base.Char.Type
open import Base.Char.eq
open import Base.Equal.Type

test-eq-same-pair : ((1 , True) == (1 , True)) ≡ True
test-eq-same-pair = refl

test-eq-different-first : ((1 , True) == (2 , True)) ≡ False
test-eq-different-first = refl

test-neq-different-second : ((1 , True) != (1 , False)) ≡ True
test-neq-different-second = refl

test-eq-char-pair-same : ((1 , 'a') == (1 , 'a')) ≡ True
test-eq-char-pair-same = refl

test-eq-char-pair-different : ((1 , 'a') == (2 , 'a')) ≡ False
test-eq-char-pair-different = refl