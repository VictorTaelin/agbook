module UG.Shape.line-line-intersection where

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

line-line-intersection : V2 → V2 → V2 → V2 → Bool
line-line-intersection s1 e1 s2 e2 = do
  let det = ((V2.x e1) - (V2.x s1)) * ((V2.y e2) - (V2.y s2)) - ((V2.x e2) - (V2.x s2)) * ((V2.y e1) - (V2.y s1))
  if det == 0.0
    then False
    else do
      let lambda = (((V2.y e2) - (V2.y s2)) * ((V2.x e2) - (V2.x s1)) + ((V2.x s2) - (V2.x e2)) * ((V2.y e2) - (V2.y s1))) / det
      let gamma = (((V2.y s1) - (V2.y e1)) * ((V2.x e2) - (V2.x s1)) + ((V2.x e1) - (V2.x s1)) * ((V2.y e2) - (V2.y s1))) / det
      (0.0 < lambda) && (lambda < 1.0) && (0.0 < gamma) && (gamma < 1.0)


