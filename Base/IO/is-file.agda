module Base.IO.is-file where

open import Base.IO.IO
open import Base.String.String
open import Base.Bool.Bool

postulate
  is-file : String -> IO Bool

{-# FOREIGN GHC import qualified System.Directory #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC is-file = System.Directory.doesFileExist . T.unpack #-}
