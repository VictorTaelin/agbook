module Data.Bool.show where

open import Data.Bool.Type
open import Data.String.Type

show : Bool → String
show True = "true"
show False = "false"

{-# COMPILE JS show = function(a) {
    if (a === true) {
      return "true";
    } else if (a === false) {
      return "false";
    } else {
      throw new Error("Expected a boolean value");
    }
  } 
  
#-}
