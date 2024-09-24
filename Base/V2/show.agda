module Base.V2.show where

import Base.F64.show as F64
open import Base.String.Type
open import Base.String.append
open import Base.V2.Type

show : V2 -> String
show v = "(" ++ F64.show (V2.x v) ++ ", " ++ F64.show (V2.y v) ++ ")"
