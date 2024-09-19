module UG.SIPD.FFI.draw where

open import Data.IO.Type
open import Data.List.Type
open import UG.SIPD.State.Type
open import UG.SIPD.FFI.Window.Type
open import UG.SIPD.FFI.Renderer.Type
open import Data.Unit.Type

postulate draw : Window -> Renderer -> State -> IO Unit

{-# FOREIGN GHC import qualified SDL as SDL #-}


{-# FOREIGN GHC

import qualified SDL.Font as TTF
import Foreign.C.Types (CInt)
import MAlonzo.Code.UG.SIPD.State.Type (State(..))
import qualified Data.Text as T

renderText :: SDL.Renderer -> String -> SDL.Point SDL.V2 CInt -> IO ()
renderText renderer text (SDL.P (SDL.V2 x y)) = do
  font <- TTF.load "/home/lorenzo/work/monobook/UG/SIPD/FFI/AntonSC-Regular.ttf" 24 
  surface <- TTF.solid font (SDL.V4 0 0 0 255) (T.pack text)   -- Black
  texture <- SDL.createTextureFromSurface renderer surface
  SDL.freeSurface surface
  SDL.TextureInfo {SDL.textureWidth = w, SDL.textureHeight = h} <- SDL.queryTexture texture

  let destRect = SDL.Rectangle (SDL.P (SDL.V2 x y)) (SDL.V2 w h)

  SDL.copy renderer texture Nothing (Just destRect)
  SDL.destroyTexture texture

  TTF.free font

render :: SDL.Renderer -> State -> IO ()
render renderer state = do
  SDL.rendererDrawColor renderer SDL.$= SDL.V4 0 0 0 255  -- Black color for text
  renderText renderer ("Clicks: " ++ show (clickCount state)) (SDL.P (SDL.V2 10 10))

#-}

{-# COMPILE GHC draw = \window renderer state -> do
  {
    SDL.rendererDrawColor renderer SDL.$= SDL.V4 255 255 255 255 ;
    SDL.clear renderer ; 
    render renderer state ; 
    SDL.present renderer 
  }
#-}

