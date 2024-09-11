module Data.U64.mod where

open import Data.U64.Type
open import Data.U64.div
open import Data.U64.mul
open import Data.U64.sub

modU64 : U64 → U64 → U64
modU64 a b = subU64 a (mulU64 b (divU64 a b))

