module Base.V2.show where

import Base.Float.show as Float
open import Base.String.Type
open import Base.String.append
open import Base.V2.Type

show : V2 -> String
show v = "(" ++ Float.show (V2.x v) ++ ", " ++ Float.show (V2.y v) ++ ")"
