module Base.ByteString.pack-string where

open import Base.ByteString.ByteString
open import Base.List.List
open import Base.String.String

postulate pack-string : String → ByteString

{-# FOREIGN GHC import qualified Data.Text.Encoding as TE #-}
{-# COMPILE GHC pack-string = TE.encodeUtf8 #-}

