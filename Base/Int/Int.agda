module Base.Int.Int where

open import Base.Nat.Nat
open import Base.String.String

data Int : Set where
  Pos    : Nat → Int
  NegSuc : Nat → Int

{-# BUILTIN INTEGER       Int    #-}
{-# BUILTIN INTEGERPOS    Pos    #-}
{-# BUILTIN INTEGERNEGSUC NegSuc #-}

