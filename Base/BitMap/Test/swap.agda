module Base.BitMap.Test.swap where

open import Base.BitMap.Type
open import Base.BitMap.new
open import Base.BitMap.swap
open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.BinTree.Type
open import Base.Pair.Type
open import Base.Equal.Type
open import Base.Nat.Type

test-swap-empty : (swap {Nat} new E 42) ≡ (Node (Some 42) Leaf Leaf , None)
test-swap-empty = refl

test-swap-root : 
  let initial-map = Node (Some 10) Leaf Leaf
  in (swap initial-map E 20) ≡ (Node (Some 20) Leaf Leaf , Some 10)
test-swap-root = refl

test-swap-left :
  let initial-map = Node None (Node (Some 30) Leaf Leaf) Leaf
  in (swap initial-map (O E) 40) ≡ (Node None (Node (Some 40) Leaf Leaf) Leaf , Some 30)
test-swap-left = refl

test-swap-right :
  let initial-map = Node None Leaf (Node (Some 50) Leaf Leaf)
  in (swap initial-map (I E) 60) ≡ (Node None Leaf (Node (Some 60) Leaf Leaf) , Some 50)
test-swap-right = refl

test-swap-non-existent :
  let initial-map = Node (Some 70) Leaf Leaf
  in (swap initial-map (O E) 80) ≡ (Node (Some 70) (Node (Some 80) Leaf Leaf) Leaf , None)
test-swap-non-existent = refl
