module Data.String.Test.hash where

open import Data.String.Type
open import Data.String.hash
open import Data.Bits.eq
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.not
open import Data.Equal.Type

test-a-not-c : ((hash "a" != hash "c") === True)
test-a-not-c = refl
