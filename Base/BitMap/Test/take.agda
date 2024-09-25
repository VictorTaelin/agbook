module Base.BitMap.Test.take where

open import Base.BitMap.Type
open import Base.BitMap.take
open import Base.BitMap.set
open import Base.BitMap.new
open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.Equal.Type
open import Base.Nat.Type
open import Base.String.Type
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
