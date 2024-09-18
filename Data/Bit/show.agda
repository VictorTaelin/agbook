module Data.Bit.show where

open import Data.Bit.Type
open import Data.String.Type

show : Bit → String
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
