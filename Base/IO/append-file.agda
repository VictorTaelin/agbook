module Base.IO.append-file where

open import Base.String.String
open import Base.IO.IO
open import Base.Unit.Unit

postulate
  append-file  : String -> String -> IO Unit

{-# FOREIGN GHC import qualified Data.Text    as T   #-}
{-# FOREIGN GHC import qualified Data.Text.IO as TIO #-}

{-# COMPILE GHC append-file = TIO.appendFile . T.unpack #-}
