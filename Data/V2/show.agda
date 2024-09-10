module Data.V2.show where

open import Data.V2.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show
open import Data.Float.Type

instance
  ShowV2 : Show V2
  ShowV2 = record { toString = showV2 }
    where
      showV2 : V2 → String
      showV2 (MkV2 x y) = "V2(" ++ primShowFloat x ++ ", " ++ primShowFloat y ++ ")"

-- Tests
open import Data.Equal.Type

_ : show (MkV2 1.0 2.0) === "V2(1.0, 2.0)"
_ = refl

_ : show (MkV2 0.0 0.0) === "V2(0.0, 0.0)"
_ = refl
