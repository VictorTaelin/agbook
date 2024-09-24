module Base.ByteString.show where

open import Base.ByteString.Type
open import Base.String.Type

postulate show : ByteString -> String

{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# COMPILE GHC show =  T.pack . show #-}
