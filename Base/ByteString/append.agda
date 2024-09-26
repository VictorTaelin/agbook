module Base.ByteString.append where

open import Base.ByteString.ByteString

-- Concatenates two ByteStrings.
-- - bs1: The 1st ByteString.
-- - bs2: The 2nd ByteString.
-- = A new ByteString containing all bytes from bs1 followed by all bytes from bs2.
postulate append : ByteString -> ByteString -> ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC append = BS.append #-}

-- Infix operator for ByteString appending.
-- - bs1: The 1st ByteString.
-- - bs2: The 2nd ByteString.
-- = A new ByteString containing all bytes from bs1 followed by all bytes from bs2.
_++_ : ByteString -> ByteString -> ByteString
_++_ = append

infixr 5 _++_
