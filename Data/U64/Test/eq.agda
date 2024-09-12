module Data.U64.Test.eq where

open import Data.U64.Type
open import Data.U64.eq
open import Data.Bool.Type
open import Data.Equal.Type

-- Eq tests
_ : ((primWord64FromNat 42) == (primWord64FromNat 42)) === True
_ = refl

_ : ((primWord64FromNat 42) == (primWord64FromNat 43)) === False
_ = refl

_ : ((primWord64FromNat 64) != (primWord64FromNat 64)) === False
_ = refl

_ : ((primWord64FromNat 64) != (primWord64FromNat 65)) === True
_ = refl
