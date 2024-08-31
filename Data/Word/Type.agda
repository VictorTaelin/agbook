module Data.Word.Type where

open import Data.Nat.Type
open import Data.Bool.Type

-- Represents a 64-bit machine word.
postulate Word64 : Set
{-# BUILTIN WORD64 Word64 #-}

-- Primitive operations for Word64.
primitive
  primWord64ToNat   : Word64 → Nat
  primWord64FromNat : Nat → Word64
