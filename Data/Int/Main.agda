module Data.Int.Main where

open import Data.Nat.Main
open import Data.String.Main

data Int : Set where
  pos    : Nat → Int
  negsuc : Nat → Int

{-# BUILTIN INTEGER       Int    #-}
{-# BUILTIN INTEGERPOS    pos    #-}
{-# BUILTIN INTEGERNEGSUC negsuc #-}

primitive
  primShowInteger : Int → String
