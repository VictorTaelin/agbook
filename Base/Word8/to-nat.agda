module Base.Word8.to-nat where

open import Base.Nat.Type
open import Base.Word8.Type

postulate to-nat : Word8 -> Nat

{-# COMPILE GHC to-nat = fromIntegral #-}
