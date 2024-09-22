module Base.ByteString.pack-string where

open import Base.ByteString.Type
open import Base.String.Type
open import Base.List.Type

postulate pack-string : String -> ByteString

{-# FOREIGN GHC import qualified Data.Text.Encoding as TE #-}
{-# COMPILE GHC pack = TE.encodeUtf8 #-}
