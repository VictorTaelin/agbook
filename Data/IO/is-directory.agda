module Data.IO.is-directory where

open import Data.IO.Type
open import Data.String.Type
open import Data.Bool.Type

postulate
  is-directory : String → IO Bool

{-# FOREIGN GHC import qualified System.Directory #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC is-directory = System.Directory.doesDirectoryExist . T.unpack #-}
