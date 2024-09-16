module Data.String.show where

open import Data.String.Type
open import Data.Trait.Show public

instance
  ShowString : Show String
  ShowString = record { to-string = show-string }
    where
      show-string : String → String
      show-string = primShowString