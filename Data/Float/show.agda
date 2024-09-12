module Data.Float.show where

open import Data.Float.Type
open import Data.String.Type
open import Data.Trait.Show

instance
  ShowFloat : Show Float
  ShowFloat = record { to-string = show-float }
    where
      show-float : Float → String
      show-float = primShowFloat


