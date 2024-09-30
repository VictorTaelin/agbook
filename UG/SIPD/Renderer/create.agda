module UG.SIPD.Renderer.create where

open import Base.IO.IO
open import UG.SIPD.Renderer.Renderer
open import UG.SIPD.Window.Window

postulate create : Window → IO Renderer

{-# FOREIGN GHC import qualified SDL as SDL #-}

{-# COMPILE GHC create = \ window -> do
  {
    renderer <- SDL.createRenderer window (-1) SDL.defaultRenderer ; 
    return renderer
  }
#-}
