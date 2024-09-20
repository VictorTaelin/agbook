module Base.U64.Type where

open import Base.Nat.Type
open import Base.Bool.Type

-- Represents a 64-bit machine word.
postulate U64 : Set
{-# BUILTIN WORD64 U64 #-}
