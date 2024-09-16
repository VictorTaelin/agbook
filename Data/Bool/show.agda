module Data.Bool.show where

open import Data.Bool.Type
open import Data.String.Type
open import Data.Trait.Show public

instance
  ShowBool : Show Bool
  ShowBool = record { to-string = show-bool }
    where
      show-bool : Bool → String 
      show-bool True = "true"
      show-bool False = "false"

{-# COMPILE JS show = function(a) {
    if (a === true) {
      return "true";
    } else if (a === false) {
      return "false";
    } else {
      throw new Error("Expected a boolean value");
    }
  } #-}
