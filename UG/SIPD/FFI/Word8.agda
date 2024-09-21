module UG.SIPD.FFI.Word8 where

postulate Word8 : Set

{-# FOREIGN GHC import qualified Data.Word as W #-}
{-# COMPILE GHC Word8 = type W.Word8 #-}
