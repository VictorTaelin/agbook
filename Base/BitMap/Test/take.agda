module Base.BitMap.Test.take where

open import Base.BitMap.BitMap
open import Base.BitMap.take
open import Base.BitMap.set
open import Base.BitMap.new
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.String.String
open import Base.Pair.get-fst
open import Base.Pair.get-snd

test-take-empty : take (new {Nat}) E ≡ (Leaf , None)
test-take-empty = refl

test-take-non-existing : 
  let m = set new E "hello"
      result = take m (I E)
  in result ≡ (Node (Some "hello") Leaf Leaf , None)
test-take-non-existing = refl

test-take-existing : 
  let m = set (set new E 42) (I E) 24
      result = take m E
  in snd result ≡ Some 42
test-take-existing = refl
