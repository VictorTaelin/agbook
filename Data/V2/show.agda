module Data.V2.show where

open import Data.V2.Type
open import Data.String.Type
open import Data.String.append
open import Data.Float.Type
open import Data.Float.show
open import Data.Trait.Show public

instance
  ShowV2 : Show V2
  ShowV2 = record { to-string = show-v2 }
    where
      show-v2 : V2 → String
      show-v2 (MkV2 x y) = "V2(" ++ show x ++ ", " ++ show y ++ ")"
