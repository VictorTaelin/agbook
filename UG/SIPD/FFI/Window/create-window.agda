module UG.SIPD.FFI.Window.create-window where

open import Data.IO.Type
open import UG.SIPD.FFI.Window.Type

postulate create-window : IO Window

{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# COMPILE GHC create-window = SDL.createWindow "Game" SDL.defaultWindow  #-}

