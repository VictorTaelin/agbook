module Data.U64.Test.show where

open import Data.U64.Type
open import Data.U64.show
open import Data.String.Type
open import Data.Equal.Type

-- Show tests
_ : show (primWord64FromNat 42) === "42"
_ = refl

_ : show (primWord64FromNat 0) === "0"
_ = refl
