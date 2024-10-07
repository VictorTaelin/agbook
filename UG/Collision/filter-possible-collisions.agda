module UG.Collision.filter-possible-collisions where

import UG.Shape.neq as Shape
open import Base.Bool.if
open import Base.List.List
open import Base.Pair.Pair
open import Base.QuadTree.Object.Object
open import UG.Shape.Shape

filter-potential-collisions : Object Shape → List (Object Shape) → List (Pair Shape Shape)
filter-potential-collisions _ [] = []
filter-potential-collisions o (p :: ps) =
  if (Object.value o) Shape.!= (Object.value p)
  then ((Object.value o) , (Object.value p)) :: filter-potential-collisions o ps
  else filter-potential-collisions o ps

