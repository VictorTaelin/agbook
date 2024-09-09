module Data.Bytestring.Type where

open import Data.Nat.Type
open import Data.String.Type
open import Data.Word64.Type
open import Data.Word8.Type

postulate
  Bytestring : Set
  index : Bytestring → Word64 → Word8
  length : Bytestring → Nat
  take : Word64 → Bytestring → Bytestring
  drop : Word64 → Bytestring → Bytestring
  show : Bytestring → String

{-# FOREIGN GHC import qualified Data.ByteString as B #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC Bytestring = type B.ByteString #-}
{-# COMPILE GHC index = \ buf idx -> B.index buf (fromIntegral idx) #-}
{-# COMPILE GHC length = \ buf -> fromIntegral (B.length buf) #-}
{-# COMPILE GHC take = B.take . fromIntegral #-}
{-# COMPILE GHC drop = B.drop . fromIntegral #-}
{-# COMPILE GHC show = T.pack . Prelude.show #-}

-- {-# COMPILE JS Bytestring = ? #-}
{-# COMPILE JS index = function(buf) { return function(idx) { return buf[idx] || 0; }; } #-}
{-# COMPILE JS length = function(buf) { return buf.length; } #-}
{-# COMPILE JS take = function(n) { return function(buf) { return buf.slice(0, n); }; } #-}
{-# COMPILE JS drop = function(n) { return function(buf) { return buf.slice(n); }; } #-}
{-# COMPILE JS show = function(buf) { return buf.toString(); } #-}
