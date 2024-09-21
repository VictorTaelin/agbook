module UG.SIPD.FFI.pack where

open import UG.SIPD.FFI.ByteString
open import UG.SIPD.FFI.Word8
open import Data.String.Type
open import Data.List.Type

postulate pack : String -> ByteString
postulate pack-w8 : List Word8 -> ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# FOREIGN GHC import qualified Data.Text.Encoding as TE #-}
{-# COMPILE GHC pack = TE.encodeUtf8 #-}
{-# COMPILE GHC pack-w8 = BS.pack #-}
