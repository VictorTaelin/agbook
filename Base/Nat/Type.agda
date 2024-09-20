module Base.Nat.Type where

open import Base.String.Type

data Nat : Set where
  Zero : Nat
  Succ : Nat → Nat

{-# BUILTIN NATURAL Nat #-}
