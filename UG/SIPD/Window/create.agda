module UG.SIPD.Window.create where

open import Base.IO.Type
open import UG.SIPD.Window.Type

postulate create : IO Window

{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# COMPILE GHC create = SDL.createWindow "Game" SDL.defaultWindow  #-}
