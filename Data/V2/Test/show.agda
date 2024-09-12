module Data.V2.Test.show where

open import Data.V2.Type
open import Data.V2.show
open import Data.Float.Type
open import Data.Float.show
open import Data.String.Type
open import Data.Trait.Show
open import Data.Equal.Type

-- Show tests

_ : show (MkV2 1.0 2.0) === "V2(1.0, 2.0)"
_ = refl

_ : show (MkV2 0.0 0.0) === "V2(0.0, 0.0)"
_ = refl

_ : show (MkV2 1.0 2.0) === "V2(1.0, 2.0)"
_ = refl

_ : show (MkV2 0.0 0.0) === "V2(0.0, 0.0)"
_ = refl
