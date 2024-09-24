module Base.Bool.show where

open import Base.Bool.Type
open import Base.String.Type

show : Bool -> String
show True  = "true"
show False = "false"

{-# COMPILE JS show = function(b) {
  return b ? "true" : "false";
} #-}
