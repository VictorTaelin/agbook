module Base.AVLTree.delete-go where

open import Base.AVLTree.Balance.Type
open import Base.AVLTree.Balance.rotate-left
open import Base.AVLTree.Balance.rotate-right
open import Base.AVLTree.Type
open import Base.AVLTree.delete-maximum
open import Base.AVLTree.empty
open import Base.Bool.Type
open import Base.Bool.not
open import Base.Function.case
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.Pair.map
open import Base.Pair.mut-snd
open import Base.Trait.Ord

-- returns True if the height decreased
delete-go : ∀ {K V : Set} -> {{_ : Ord K}} -> K -> AVL K V -> Pair (AVL K V) Bool

delete-go _ Leaf = empty , False

delete-go k (Node (ck , cv) b l r) with compare k ck
... | EQ with l
...   | Leaf = l , True
...   | _ with delete-maximum l
...     | (d , o , s) with d | s | b
...       | None | _ | _ = Node (ck , cv) b l r , False
...       | Some got | False | _    = Node got b o r , False
...       | Some got | True  | -one = Node got zero o r , True
...       | Some got | True  | zero = Node got +one o r , False
...       | Some got | True  | +one = map (λ x -> x) (λ _ -> not) (rotate-left (Node got +one o r))

delete-go k (Node (ck , cv) b l r) | LT with delete-go k l
... | (o , s) with s | b
...   | False | _ = Node (ck , cv) b o r , False
...   | True  | -one = Node (ck , cv) zero o r , True
...   | True  | zero = Node (ck , cv) +one o r , False
...   | True  | +one = mut-snd not (rotate-left (Node (ck , cv) +one o r))

delete-go k (Node (ck , cv) b l r) | GT with delete-go k r
... | (o , s) with s | b
...   | False | _ = Node (ck , cv) b l o , False
...   | True  | +one = Node (ck , cv) zero l o , True
...   | True  | zero = Node (ck , cv) -one l o , False
...   | True  | -one = mut-snd not (rotate-right (Node (ck , cv) -one l o))
