module Base.IO.write-file where

open import Base.IO.IO
open import Base.String.String
open import Base.Unit.Unit

-- Writes content to a file, overwriting any existing content.
-- 1st: The path of the file to write to.
-- 2nd: The content to write.
-- = IO action that writes the content to the file.
postulate write-file : String → String → IO Unit

{-# FOREIGN GHC import qualified Data.Text    as T   #-}
{-# FOREIGN GHC import qualified Data.Text.IO as TIO    #-}
{-# FOREIGN GHC import qualified System.IO              #-}

{-# COMPILE GHC write-file  = TIO.writeFile . T.unpack  #-}

