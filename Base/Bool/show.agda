module Base.Bool.show where

open import Base.Bool.Type
open import Base.String.Type
open import Base.Show.Trait public

show-bool : Bool → String
show-bool True = "true"
show-bool False = "false"

instance
  ShowBool : Show Bool
  ShowBool = record { to-string = show-bool }

{-# COMPILE JS show-bool = function(b) {
  return b ? "true" : "false";
} #-}
