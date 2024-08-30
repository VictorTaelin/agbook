module Int.Main where

open import Nat.Main
open import String.Main

data Int : Set where
  pos    : Nat → Int
  negsuc : Nat → Int

{-# BUILTIN INTEGER       Int    #-}
{-# BUILTIN INTEGERPOS    pos    #-}
{-# BUILTIN INTEGERNEGSUC negsuc #-}

primitive
  primShowInteger : Int → String
