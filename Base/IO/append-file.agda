module Base.IO.append-file where

open import Base.String.String
open import Base.IO.IO
open import Base.Unit.Unit

-- Appends content to a file at the given path.
-- 1st: The path of the file to append to.
-- 2nd: The content to append.
-- = An IO action that appends the content to the file.
postulate append-file  : String → String → IO Unit

{-# FOREIGN GHC import qualified Data.Text    as T   #-}
{-# FOREIGN GHC import qualified Data.Text.IO as TIO #-}

{-# COMPILE GHC append-file = TIO.appendFile . T.unpack #-}
