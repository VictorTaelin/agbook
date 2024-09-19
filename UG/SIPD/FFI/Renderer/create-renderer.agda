module UG.SIPD.FFI.Renderer.create-renderer where

open import Data.IO.Type
open import UG.SIPD.FFI.Window.Type
open import UG.SIPD.FFI.Renderer.Type

postulate create-renderer : Window -> IO Renderer

{-# FOREIGN GHC import qualified SDL as SDL #-}

{-# COMPILE GHC create-renderer = \ window -> do
  {
    renderer <- SDL.createRenderer window (-1) SDL.defaultRenderer ; 
    return renderer
  }
 #-}
