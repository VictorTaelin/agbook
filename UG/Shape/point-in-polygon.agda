module UG.Shape.point-in-polygon where

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
open import Base.F64.sub
open import Base.List.List
open import Base.List.append
open import Base.List.length
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.V2.V2
open import UG.Shape.Shape

is-right-side : V2 → V2 → V2 → Bool
is-right-side point v1 v2 with ((V2.y v1) > (V2.y point)) Bool.== ((V2.y v2) > (V2.y point))
... | True  = False
... | False = do
  let dx = (V2.x v2) - (V2.x v1)
  let dy = (V2.y v2) - (V2.y v1)
  let t  = ((V2.y point) - (V2.y v1)) / dy
  let intersect-x = (V2.x v1) + t * dx
  (V2.x point) < intersect-x

process-edge : V2 → Bool → Pair V2 V2 → Bool
process-edge point inside (v1 , v2) with is-right-side point v1 v2
... | True  = not inside
... | False = inside

point-in-polygon : V2 → List V2 → Bool
point-in-polygon point []        = False
point-in-polygon point (v :: vs) = do
  let v-list = v :: []
  go False (v :: vs ++ v-list)
  where
    go : Bool → List V2 → Bool
    go inside [] = inside
    go inside (v1 :: v2 :: vs) = go (process-edge point inside (v1 , v2)) (v2 :: vs)
    go inside _ = inside

