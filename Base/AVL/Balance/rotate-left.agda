module Base.AVL.Balance.rotate-left where

open import Base.AVL.Type
open import Base.AVL.empty
open import Base.AVL.Balance.Type
open import Base.AVL.Balance.eq
open import Base.Pair.Type
open import Base.Bool.Type
open import Base.Bool.if

-- Performs a left rotation on an AVL tree to fix an imbalance of +2.
-- - tree: The AVL tree to rotate.
-- = A pair containing the rotated AVL tree and a boolean indicating if the height of the root stayed the same.
rotate-left : ∀ {K V : Set} → AVL K V → Pair (AVL K V) Bool
rotate-left (Node v1 +one l (Node v2 +one rl rr))
  = Node v2 zero (Node v1 zero l rl) rr , False

rotate-left (Node v1 +one l (Node v2 zero rl rr))
  = Node v2 -one (Node v1 +one l rl) rr , True

rotate-left 
  (Node v1 +one 
    l 
    (Node v2 -one 
      (Node v3 balance rll rlr) 
      rr))
  = do  
  let b1 = if balance == +one then -one else zero
  let b2 = if balance == -one then +one else zero
  (Node v3 zero
    (Node v1 b1 l   rll)
    (Node v2 b2 rlr rr)
     , False)

-- Invalid call to `rotate-left`
rotate-left tree = tree , False
