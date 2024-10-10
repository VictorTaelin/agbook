module Base.BinTree.map- where

open import Base.BinTree.BinTree
open import Base.BinTree.map
open import Base.Function.id
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.mul
open import Base.Bool.Bool
open import Base.Bool.not

-- Test: Mapping identity function over a tree.
T0 : map id (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)
T0 = refl

-- Test: Mapping increment function over a tree.
T1 : map (add 1) (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ Node 2 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)
T1 = refl

-- Test: Mapping over an empty tree.
T2 : map (add 1) Leaf ≡ Leaf
T2 = refl

-- Test: Composing two map operations.
T3 : map (add 2) (map (add 1) (Node 1 (Node 2 Leaf Leaf) Leaf)) ≡ Node 4 (Node 5 Leaf Leaf) Leaf
T3 = refl

-- Test: Mapping a constant function over a tree.
T4 : map (λ _ → 0) (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ Node 0 (Node 0 Leaf Leaf) (Node 0 Leaf Leaf)
T4 = refl

-- Test: Mapping multiplication by 2 over a tree.
T5 : map (mul 2) (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ Node 2 (Node 4 Leaf Leaf) (Node 6 Leaf Leaf)
T5 = refl

-- Test: Mapping boolean negation over a tree of booleans.
T6 : map not (Node True (Node False Leaf Leaf) (Node True Leaf Leaf)) ≡ Node False (Node True Leaf Leaf) (Node False Leaf Leaf)
T6 = refl

-- Test: Mapping a complex function over a tree.
T7 : map (λ x → add 1 (mul 2 x)) (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ Node 3 (Node 5 Leaf Leaf) (Node 7 Leaf Leaf)
T7 = refl
