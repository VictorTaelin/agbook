module Data.Word8.Type where

open import Data.Nat.Type

postulate
  Word8 : Set

{-# FOREIGN GHC import GHC.Word #-}
{-# COMPILE GHC Word8 = type Word8 #-}
-- {-# COMPILE JS Word8 = ? #-} -- I don't think this is necessary
