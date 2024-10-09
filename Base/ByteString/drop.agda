module Base.ByteString.drop where

open import Base.ByteString.ByteString
open import Base.Nat.Nat

-- Drops the first n bytes from a ByteString.
-- - n: The number of bytes to drop.
-- - bs: The input ByteString.
-- = A new ByteString with the first n bytes removed.
postulate drop : Nat → ByteString → ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC drop = BS.drop #-}
