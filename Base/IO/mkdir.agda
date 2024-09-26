module Base.IO.mkdir where

open import Base.IO.IO
open import Base.String.String
open import Base.Unit.Unit

-- Creates a new directory at the specified path.
-- 1st: The path where the directory should be created.
-- = IO action that creates the directory.
postulate mkdir : String -> IO Unit

{-# FOREIGN GHC import qualified System.Directory #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC mkdir = System.Directory.createDirectory . T.unpack #-}
