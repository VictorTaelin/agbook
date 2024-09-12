module Data.Int.Type where

open import Data.Nat.Type
open import Data.String.Type
open import Data.Nat.sub

data Int  : Set where
  Pos     : Nat → Int
  Neg     : Nat → Int

{-# BUILTIN INTEGER       Int #-}
{-# BUILTIN INTEGERPOS    Pos #-}
{-# BUILTIN INTEGERNEGSUC Neg #-}

-_ : Nat →  Int
-(Zero)   = Pos Zero
-(Succ n) = Neg n

+_ : Nat → Int
+(Zero)   = Pos Zero
+(Succ n) = Pos (Succ n)

primitive
  primShowInteger : Int → String
