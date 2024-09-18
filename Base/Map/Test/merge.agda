module Base.Map.Test.merge where

open import Base.Map.Type
open import Base.Map.empty
open import Base.Map.set
open import Base.Map.get
open import Base.Map.merge
open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.Equal.Type
open import Base.Nat.Type
open import Base.String.Type

test-merge-empty : merge empty empty === empty {Nat}
test-merge-empty = refl

test-merge-empty-nonempty : 
  let m = set empty (O E) 1
  in merge empty m === m
test-merge-empty-nonempty = refl

test-merge-nonempty-empty : 
  let m = set empty (I E) 2
  in merge m empty === m
test-merge-nonempty-empty = refl

test-merge-no-conflicts : 
  let m1 = set (set empty (O E) 1) (I E) 2
      m2 = set empty (O (O E)) 3
      result = set (set (set empty (O E) 1) (I E) 2) (O (O E)) 3
  in merge m1 m2 === result
test-merge-no-conflicts = refl

test-merge-with-conflicts : 
  let m1 = set (set empty (O E) 1) (I E) 2
      m2 = set empty (O E) 10
      result = set (set empty (O E) 10) (I E) 2
  in merge m1 m2 === result
test-merge-with-conflicts = refl

test-merge-different-types : 
  let m1 = set empty (O E) "hello"
      m2 = set empty (I E) "world"
      result = set (set empty (O E) "hello") (I E) "world"
  in merge m1 m2 === result
test-merge-different-types = refl

