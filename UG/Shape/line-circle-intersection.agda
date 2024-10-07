module UG.Shape.line-circle-intersection where

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

line-circle-intersection : V2 → V2 → V2 → F64 → Bool
line-circle-intersection start end center radius = do
  let dx = (V2.x end) - (V2.x start)
  let dy = (V2.y end) - (V2.y start)
  let a = dx * dx + dy * dy
  let b = 2.0 * (dx * ((V2.x start) - (V2.x center)) + dy * ((V2.y start) - (V2.y center)))
  let c = (V2.x center) * (V2.x center) + (V2.y center) * (V2.y center)
  let c = c + ((V2.x start) * (V2.x start) + (V2.y start) * (V2.y start))
  let c = c - (2.0 * ((V2.x center) * (V2.x start) + (V2.y center) * (V2.y start)))
  let c = c - radius * radius
  let bb4ac = b * b - 4.0 * a * c
  
  if bb4ac < 0.0 
    then False
    else do
      let t1 = ((0.0 - b) + (sqrt bb4ac)) / (2.0 * a) 
      let t2 = ((0.0 - b) - (sqrt bb4ac)) / (2.0 * a) 
      let is-intersecting = ((t1 >= 0.0) && (t1 <= 1.0)) || ((t2 >= 0.0) && (t2 <= 1.0))
      is-intersecting


