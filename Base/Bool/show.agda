module Base.Bool.show where

open import Base.Bool.Bool
open import Base.String.String

show : Bool -> String
show True  = "true"
show False = "false"
