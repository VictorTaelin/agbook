module Data.U64.double where

open import Data.U64.Type
open import Data.U64.add

doubleU64 : U64 → U64
doubleU64 x = addU64 x x

