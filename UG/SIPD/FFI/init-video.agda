module UG.SIPD.FFI.init-video where

open import Data.IO.Type
open import Data.Unit.Type

postulate init-video : IO Unit

{-# FOREIGN GHC import qualified SDL #-}
{-# FOREIGN GHC import qualified SDL.Font as TTF #-}
{-# COMPILE GHC init-video = do
    SDL.initialize [SDL.InitVideo]
    TTF.initialize
    return ()
  #-}
