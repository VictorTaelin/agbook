module Base.AVLTree.delete-go where

open import Base.AVLTree.Balance.Type
open import Base.AVLTree.Balance.rotate-left
open import Base.AVLTree.Balance.rotate-right
open import Base.AVLTree.Type
open import Base.AVLTree.delete-maximum
open import Base.AVLTree.empty
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Maybe.Type
open import Base.Ordering.Type
open import Base.Pair.Type
open import Base.Pair.map
open import Base.Pair.mut-snd
open import Base.Trait.Ord

-- returns True if the height decreased
delete-go : ∀ {K V : Set} -> {{_ : Ord K}} -> K -> AVL K V -> Pair (AVL K V) Bool

delete-go _ Leaf = empty , False

delete-go k (Node (curr-key , curr-val) balance left right) with compare k curr-key
... | EQ with left
...   | Leaf = left , True
...   | _ with delete-maximum left
...     | (deleted , other , is-smaller) with deleted | is-smaller | balance
...       | None | _ | _ = Node (curr-key , curr-val) balance left right , False
...       | Some got | False | _ = Node got balance other right , False
...       | Some got | True | -one = Node got zero other right , True
...       | Some got | True | zero = Node got +one other right , False
...       | Some got | True | +one = map (λ x -> x) (λ _ -> not) (rotate-left (Node got +one other right))
delete-go k (Node (curr-key , curr-val) balance left right) | LT with delete-go k left
... | (other , is-smaller) with is-smaller | balance
...   | False | _ = Node (curr-key , curr-val) balance other right , False
...   | True | -one = Node (curr-key , curr-val) zero other right , True
...   | True | zero = Node (curr-key , curr-val) +one other right , False
...   | True | +one = mut-snd not (rotate-left (Node (curr-key , curr-val) +one other right))
delete-go k (Node (curr-key , curr-val) balance left right) | GT with delete-go k right
... | (other , is-smaller) with is-smaller | balance
...   | False | _ = Node (curr-key , curr-val) balance left other , False
...   | True | +one = Node (curr-key , curr-val) zero left other , True
...   | True | zero = Node (curr-key , curr-val) -one left other , False
...   | True | -one = mut-snd not (rotate-right (Node (curr-key , curr-val) -one left other))
