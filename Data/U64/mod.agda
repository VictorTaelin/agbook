module Data.U64.mod where

open import Data.U64.Type
open import Data.U64.div
open import Data.U64.mul
open import Data.U64.sub

mod : U64 → U64 → U64
mod a b = sub a (mul b (div a b))

infixl 7 _mod_
_mod_ : U64 → U64 → U64
_mod_ = mod
