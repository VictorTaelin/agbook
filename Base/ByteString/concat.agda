module Base.ByteString.concat where

open import Base.ByteString.ByteString
open import Base.List.List

-- Concatenates a list of ByteStrings into a single ByteString.
-- - bss: The input list of ByteStrings.
-- = A new ByteString containing all bytes from all input ByteStrings,
--   in the order they appear in the list.
postulate concat : List ByteString → ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC concat = BS.concat #-}

