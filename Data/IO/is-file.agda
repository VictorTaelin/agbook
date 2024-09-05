module Data.IO.is-file where

open import Data.IO.Type
open import Data.String.Type
open import Data.Bool.Type

postulate
  is-file : String → IO Bool

{-# FOREIGN GHC import qualified System.Directory #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC is-file = System.Directory.doesFileExist . T.unpack #-}