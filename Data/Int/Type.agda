module Data.Int.Type where

open import Data.Nat.Type
open import Data.String.Type

data Int : Set where
  Pos    : Nat → Int
  NegSuc : Nat → Int

{-# BUILTIN INTEGER       Int    #-}
{-# BUILTIN INTEGERPOS    Pos    #-}
{-# BUILTIN INTEGERNEGSUC NegSuc #-}

primitive
  primShowInteger : Int → String
