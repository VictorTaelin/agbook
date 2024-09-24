module UG.SIPD.draw where

open import Base.IO.Type
open import Base.List.Type
open import Base.Unit.Type
open import UG.SIPD.Renderer.Type
open import UG.SIPD.Window.Type
open import UG.SIPD.State.Type

postulate draw : Window -> Renderer -> State -> IO Unit

{-# FOREIGN GHC import qualified SDL as SDL #-}


{-# FOREIGN GHC
import qualified SDL.Font as TTF
import Foreign.C.Types (CInt)
import MAlonzo.Code.UG.SIPD.State.Type (State(..))
import qualified Data.Text as T
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))

renderText :: SDL.Renderer -> String -> SDL.Point SDL.V2 CInt -> IO ()
renderText renderer text (SDL.P (SDL.V2 x y)) = do
  currentDir <- getCurrentDirectory
  let fontPath = currentDir </> "AntonSC-Regular.ttf"
  font <- TTF.load fontPath 24 
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
