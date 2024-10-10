module UG.Shape.collide where

import Base.Bool.eq as Bool
import Base.Nat.sub as Nat
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.if
open import Base.Bool.not
open import Base.Bool.or
open import Base.F64.F64
open import Base.F64.add
open import Base.F64.div
open import Base.F64.eq
open import Base.F64.gt
open import Base.F64.gte
open import Base.F64.lt
open import Base.F64.lte
open import Base.F64.mul
open import Base.F64.sqrt
open import Base.F64.sub
open import Base.List.List
open import Base.List.append
open import Base.List.length
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.V2.V2
open import Base.V2.dist
open import UG.Shape.Shape
open import UG.Shape.line-line-intersection
open import UG.Shape.point-in-polygon
open import UG.Shape.line-circle-intersection

check-edges : V2 → F64 → List V2 → List V2 → Bool
check-edges _      _      []               _        = False
check-edges _      _      (_ :: [])        _        = False
check-edges center radius (v1 :: v2 :: vs) original =
  if line-circle-intersection v1 v2 center radius
  then True
  else check-edges center radius (v2 :: vs) original

any-vertex-inside : List V2 → List V2 → Bool
any-vertex-inside []        _       = False
any-vertex-inside (v :: vs) polygon =
  (point-in-polygon v polygon) || (any-vertex-inside vs polygon)

check-against-all : V2 → V2 → List V2 → List V2 → Bool
check-against-all _      _    []               _        = False
check-against-all _      _    (_ :: [])        _        = False
check-against-all start1 end1 (w1 :: w2 :: ws) original =
  line-line-intersection start1 end1 w1 w2 || check-against-all start1 end1 (w2 :: ws) original

any-edges-intersect : List V2 → List V2 → Bool
any-edges-intersect []               _     = False
any-edges-intersect (_ :: [])        _     = False
any-edges-intersect (v1 :: v2 :: vs) poly2 = check-against-all v1 v2 poly2 poly2 || any-edges-intersect (v2 :: vs) poly2

collide : Shape → Shape → Bool
collide (Circle c1 r1) (Circle c2 r2) = do
  let center-dist = dist c1 c2
  let rsum = r1 + r2
  center-dist <= rsum
collide (Circle center1 radius) (Polygon center2 vertices) =
  if point-in-polygon center1 vertices
  then True
  else check-edges center1 radius vertices vertices
collide (Polygon center1 vertices) (Circle center2 radius) =
  if point-in-polygon center2 vertices
  then True
  else check-edges center2 radius vertices vertices
collide (Polygon center1 v1) (Polygon center2 v2) = do
  let v1-in-v2 = any-vertex-inside v1 v2 
  let v2-in-v1 = any-vertex-inside v2 v1
  let any-intersect = any-edges-intersect v1 v2
  v1-in-v2 || v2-in-v1 || any-intersect

