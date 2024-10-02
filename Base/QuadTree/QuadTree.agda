module Base.QuadTree.QuadTree where

open import Base.V2.V2
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.F64.F64
open import Base.F64.lt
open import Base.F64.lte
open import Base.F64.gte
open import Base.F64.add
open import Base.Maybe.Maybe

open import Base.Bool.if
open import Base.F64.div

-- Represents a QuadTree structure for 2D space partitioning.
-- - Leaf: A leaf node containing a value of type A.
-- - Node: An internal node with four child quadrants.
data QuadTree (A : Set) : Set where
  Leaf : A → QuadTree A
  Node : QuadTree A → QuadTree A → QuadTree A → QuadTree A → QuadTree A

record Rectangle : Set where
  constructor MkRectangle
  field
    x : F64
    y : F64
    width : F64
    height : F64


inside : V2 → Rectangle → Bool
inside (MkV2 px py) (MkRectangle rx ry w h) =
  (px >= rx) && (px < (rx + w)) && (py >= ry) && (py < (ry + h)) 

insert : ∀ {A : Set} → V2 → A → Rectangle → QuadTree A → QuadTree A
insert p v rect (Leaf _) = Leaf v
insert p v (MkRectangle x y w h) (Node nw ne sw se) = do
  let mx = x + (w / 2.0)
  let my = y + (h / 2.0)
  if ((V2.x p) < mx)
    then if ((V2.y p) < my)
          then Node (insert p v (MkRectangle x y (w / 2.0) (h / 2.0)) nw) ne sw se 
          else Node nw ne (insert p v (MkRectangle x my (w / 2.0) (h / 2.0)) sw) se
    else if ((V2.y p) < my)
          then Node nw (insert p v (MkRectangle mx y (w / 2.0) (h / 2.0)) ne) sw se
          else Node nw ne sw (insert p v (MkRectangle mx my (w / 2.0) (h / 2.0)) se)


search : ∀ {A : Set} → V2 → Rectangle → QuadTree A → Maybe A
search p (MkRectangle x y w h) (Leaf v) = Some v
search p (MkRectangle x y w h) (Node nw ne sw se) = do
  let mx = x + (w / 2.0)
  let my = y + (h / 2.0)

  if ((V2.x p) < mx)
    then if ((V2.y p) < mx)
          then search p (MkRectangle x y (w / 2.0) (h / 2.0)) nw
          else search p (MkRectangle x my (w / 2.0) (h / 2.0)) sw
    else if ((V2.y p) < my)
          then search p (MkRectangle mx y (w / 2.0) (h / 2.0)) ne
          else search p (MkRectangle mx my (w / 2.0) (h / 2.0)) se
     

  





