module Data.V2.Test.eq where

open import Data.V2.Type
open import Data.V2.eq
open import Data.Float.Type
open import Data.Float.eq
open import Data.Bool.Type
open import Data.Equal.Type

test-eq-different-y : ((MkV2 1.0 2.0) == (MkV2 1.0 3.0)) === False
test-eq-different-y = refl

test-eq-different-x : ((MkV2 1.0 2.0) == (MkV2 2.0 2.0)) === False
test-eq-different-x = refl

test-eq-same : ((MkV2 1.0 2.0) == (MkV2 1.0 2.0)) === True
test-eq-same = refl

test-neq-different : ((MkV2 1.0 2.0) != (MkV2 2.0 1.0)) === True
test-neq-different = refl
