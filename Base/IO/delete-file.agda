module Base.IO.delete-file where

open import Base.IO.IO
open import Base.String.String
open import Base.Unit.Unit

-- Deletes a file at the given path.
-- 1st: The path of the file to delete.
-- = An IO action that deletes the file.
postulate delete-file : String -> IO Unit

{-# FOREIGN GHC import qualified System.Directory #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC delete-file = System.Directory.removeFile . T.unpack #-}
