module Data.Bool.show where

open import Data.Bool.Type
open import Data.String.Type
open import Data.Trait.Show

instance
  ShowBool : Show Bool
  ShowBool = record { toString = showBool }
    where
      showBool : Bool → String
      showBool True = "true"
      showBool False = "false"

-- Tests
open import Data.Equal.Type

_ : show True === "true"
_ = refl

_ : show False === "false"
_ = refl

{-# COMPILE JS show = function(a) {
    if (a === true) {
      return "true";
    } else if (a === false) {
      return "false";
    } else {
      throw new Error("Expected a boolean value");
    }
  } #-}