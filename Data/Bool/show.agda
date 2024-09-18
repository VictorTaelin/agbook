module Data.Bool.show where

open import Data.Bool.Type
open import Data.String.Type
open import Data.Trait.Show public

show-bool : Bool → String
show-bool True = "true"
show-bool False = "false"

instance
  ShowBool : Show Bool
  ShowBool = record { to-string = show-bool }

{-# COMPILE JS show-bool = function(b) {
  return b ? "true" : "false";
} #-}
