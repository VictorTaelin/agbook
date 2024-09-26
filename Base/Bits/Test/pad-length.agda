module Base.Bits.Test.pad-length where

open import Base.Bits.Bits
open import Base.Bits.pad-length
open import Base.Bits.length
open import Base.Bits.from-nat
open import Base.Pair.Pair
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.Equal.Equal
open import Base.Nat.Nat

test-pad-empty : pad-length E E ≡ (E , E)
test-pad-empty = refl

test-pad-single-empty : pad-length (I E) E ≡ (I E , O E)
test-pad-single-empty = refl

test-pad-single-single : pad-length (O E) (I E) ≡ (O E , I E)
test-pad-single-single = refl

test-pad-longer-left : pad-length (I (I (O E))) (O E) ≡ (I (I (O E)) , O (O (O E)))
test-pad-longer-left = refl

test-pad-longer-right : pad-length (O E) (I (O (I E))) ≡ (O (O (O E)) , I (O (I E)))
test-pad-longer-right = refl
