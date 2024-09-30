module Base.IO.is-directory where

open import Base.IO.IO
open import Base.String.String
open import Base.Bool.Bool

-- Checks if the given path is a directory.
-- 1st: The path to check.
-- = An IO action that returns True if the path is a directory, False otherwise.
postulate is-directory : String → IO Bool

{-# FOREIGN GHC import qualified System.Directory #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC is-directory = System.Directory.doesDirectoryExist . T.unpack #-}
