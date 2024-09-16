module Data.U64.Test.eq where

open import Data.U64.Type
open import Data.U64.eq
open import Data.Bool.Type
open import Data.Equal.Type

test-eq-same-value : ((primWord64FromNat 42) == (primWord64FromNat 42)) === True
test-eq-same-value = refl

test-eq-different-values : ((primWord64FromNat 42) == (primWord64FromNat 43)) === False
test-eq-different-values = refl

test-neq-same-value : ((primWord64FromNat 64) != (primWord64FromNat 64)) === False
test-neq-same-value = refl

test-neq-different-values : ((primWord64FromNat 64) != (primWord64FromNat 65)) === True
test-neq-different-values = refl
