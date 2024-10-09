module Base.U64.U64 where

open import Base.Nat.Nat
open import Base.Bool.Bool

-- Represents a 64-bit machine word.
postulate U64 : Set
{-# BUILTIN WORD64 U64 #-}

