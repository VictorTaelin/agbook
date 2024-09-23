module Base.IO.get-line where

open import Base.IO.Type
open import Base.String.Type

postulate get-line : IO String

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}
{-# FOREIGN GHC import qualified Control.Exception   #-}

{-# COMPILE GHC get-line = Text.getLine #-}
