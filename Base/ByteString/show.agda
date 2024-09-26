module Base.ByteString.show where

open import Base.ByteString.ByteString
open import Base.String.String

postulate show : ByteString -> String

{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# COMPILE GHC show =  T.pack . show #-}
