module UG.Shape.eq where

import Base.F64.eq as F64
import Base.List.eq as List
import Base.V2.Trait.Eq as V2
import Base.V2.eq as V2
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.V2.V2
open import UG.Shape.Shape

eq : Shape → Shape → Bool
eq (Circle _ _)   (Polygon _)    = False
eq (Polygon _)    (Circle _ _)   = False
eq (Polygon v1)   (Polygon v2)   = v1 List.== v2
eq (Circle c1 r1) (Circle c2 r2) = (c1 V2.== c2) && (r1 F64.== r2)

infix 4 _==_
_==_ : Shape → Shape → Bool
_==_ = eq
