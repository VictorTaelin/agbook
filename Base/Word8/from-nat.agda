module Base.Word8.from-nat where

open import Base.Nat.Type
open import Base.Word8.Type

postulate from-nat : Nat -> Word8

{-# COMPILE GHC from-nat = fromIntegral #-}

