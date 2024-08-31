module Data.Int.Type where

open import Data.Nat.Type
open import Data.String.Type

data Int : Set where
  pos    : Nat → Int
  negsuc : Nat → Int

{-# BUILTIN INTEGER       Int    #-}
{-# BUILTIN INTEGERPOS    pos    #-}
{-# BUILTIN INTEGERNEGSUC negsuc #-}

primitive
  primShowInteger : Int → String
