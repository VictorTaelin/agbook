module Data.Map.Test.take where

open import Data.Map.Type
open import Data.Map.take
open import Data.Map.set
open import Data.Map.new
open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Pair.Type
open import Data.Equal.Type
open import Data.Nat.Type
open import Data.String.Type
open import Data.Pair.fst
open import Data.Pair.snd

test-take-empty : take (new {Nat}) E == (Leaf , None)
test-take-empty = refl

test-take-non-existing : 
  let m = set new E "hello"
      result = take m (I E)
  in result == (Node (Some "hello") Leaf Leaf , None)
test-take-non-existing = refl

test-take-existing : 
  let m = set (set new E 42) (I E) 24
      result = take m E
  in snd result == Some 42
test-take-existing = refl
