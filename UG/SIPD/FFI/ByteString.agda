module UG.SIPD.FFI.ByteString where

postulate ByteString : Set

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC ByteString = type BS.ByteString #-}
