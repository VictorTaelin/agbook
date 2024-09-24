module UG.SIPD.Renderer.create where

open import Base.IO.Type
open import UG.SIPD.Renderer.Type
open import UG.SIPD.Window.Type

postulate create : Window -> IO Renderer

{-# FOREIGN GHC import qualified SDL as SDL #-}

{-# COMPILE GHC create = \ window -> do
  {
    renderer <- SDL.createRenderer window (-1) SDL.defaultRenderer ; 
    return renderer
  }
#-}
