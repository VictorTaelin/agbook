module Data.Float.Test.show where

open import Data.Float.Type
open import Data.Float.show
open import Data.Float.Operations
open import Data.String.Type
open import Data.Trait.Show
open import Data.Equal.Type

-- Show tests

_ : show 3.14 === "3.14"
_ = refl

_ : show 0.0 === "0.0"
_ = refl

_ : show -2.5 === "-2.5"
_ = refl

-- NaN and Infinity tests (if supported)
-- Uncomment these if your Float implementation supports NaN and Infinity

_ : show (1.0 f/ 0.0) === "Infinity"
_ = refl

_ : show (-1.0 f/ 0.0) === "-Infinity"
_ = refl

_ : show (0.0 f/ 0.0) === "NaN"
_ = refl

