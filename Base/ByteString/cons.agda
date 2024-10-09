module Base.ByteString.cons where

open import Base.ByteString.ByteString
open import Base.Word8.Word8

postulate cons : Word8 → ByteString → ByteString

{-# FOREIGN GHC import qualified Data.ByteString as BS #-}
{-# COMPILE GHC cons = BS.cons #-}

_::_ : Word8 → ByteString → ByteString
_::_ = cons

infixr 5 _::_
