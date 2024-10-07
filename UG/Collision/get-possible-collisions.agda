module UG.Collision.get-possible-collisions where

open import Base.List.List
open import Base.List.append
open import Base.Pair.Pair
open import Base.QuadTree.Object.Object
open import Base.QuadTree.QuadTree
open import Base.QuadTree.Rectangle.Rectangle
open import Base.QuadTree.query
open import UG.Collision.filter-possible-collisions
open import UG.Shape.Shape

get-possible-collisions-go : QuadTree Shape → List (Object Shape) → List (Pair Shape Shape) → List (Pair Shape Shape)
get-possible-collisions-go qt [] acc = acc
get-possible-collisions-go qt (o :: os) acc = do
  let potential = query qt (Object.bounds o)
  let new-collisions = filter-potential-collisions o potential
  get-possible-collisions-go qt os (acc ++ new-collisions)

-- the rectangle as second arg is the limit, size of "map" or canvas
get-possible-collisions : QuadTree Shape → Rectangle → List (Pair Shape Shape)
get-possible-collisions qt max-rect = do
  let all-objects = query qt max-rect
  get-possible-collisions-go qt all-objects []
  
