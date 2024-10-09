module Base.ByteString.is-empty where

open import Base.Bool.Bool
open import Base.ByteString.ByteString

-- Checks if a ByteString is empty.
-- - bs: The ByteString to check.
-- = True if the ByteString is empty, False otherwise.
postulate is-empty : ByteString → Bool

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC is-empty = BS.null #-}

