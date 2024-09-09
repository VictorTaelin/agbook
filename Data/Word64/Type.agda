module Data.Word64.Type where

open import Data.Nat.Type

postulate Word64 : Set
{-# BUILTIN WORD64 Word64 #-}

primitive
  primWord64ToNat   : Word64 → Nat
  primWord64FromNat : Nat → Word64
