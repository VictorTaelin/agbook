module Base.ByteString.Type where

postulate ByteString : Set

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC ByteString = type BS.ByteString #-}
