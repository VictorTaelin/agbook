module Base.BinTree.leaf- where

open import Base.BinTree.BinTree
open import Base.BinTree.leaf
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.String.String

-- Test: leaf creates an empty tree
T0 : leaf {Nat} ≡ Leaf
T0 = refl

-- Test: leaf is polymorphic
T1 : leaf {Nat} ≡ Leaf
T1 = refl

-- Test: leaf {String} is equivalent to Leaf
T2 : leaf {String} ≡ Leaf
T2 = refl
