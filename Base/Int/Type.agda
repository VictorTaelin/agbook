module Base.Int.Type where

open import Base.Nat.Type
open import Base.String.Type

data Int : Set where
  Pos    : Nat → Int
  NegSuc : Nat → Int

{-# BUILTIN INTEGER       Int    #-}
{-# BUILTIN INTEGERPOS    Pos    #-}
{-# BUILTIN INTEGERNEGSUC NegSuc #-}

primitive
  primShowInteger : Int → String
