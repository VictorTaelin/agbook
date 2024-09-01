module Data.U64.Type where

open import Data.Nat.Type
open import Data.Bool.Type

-- Represents a 64-bit machine word.
postulate U64 : Set
{-# BUILTIN WORD64 U64 #-}

-- Primitive operations for U64.
primitive
  primWord64ToNat   : U64 → Nat
  primWord64FromNat : Nat → U64
