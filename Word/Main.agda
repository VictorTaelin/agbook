module Word.Main where

open import Nat.Main
open import Bool.Main

-- Represents a 64-bit machine word
postulate Word64 : Set
{-# BUILTIN WORD64 Word64 #-}

-- Primitive operations for Word64
primitive
  primWord64ToNat    : Word64 → Nat
  primWord64FromNat  : Nat → Word64
  
