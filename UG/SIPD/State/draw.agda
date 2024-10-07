module UG.SIPD.State.draw where

open import Base.IO.ALL
open import Base.List.List
open import Base.Unit.Unit
open import UG.SIPD.Renderer.Renderer
open import UG.SIPD.Window.Window
open import UG.SIPD.State.State
open import UG.SIPD.Renderer.clear as Renderer
open import UG.SIPD.Renderer.present as Renderer
open import Base.Nat.Nat
import UG.SIPD.Player.draw as Player
open import Base.OrdMap.values
open import Base.List.mmap
open import Base.List.mfoldl

postulate draw-clicks : Renderer → Nat → IO Unit

draw-players : Renderer → State → IO Unit
draw-players renderer state = do
  let players = values (State.players state)
  mfoldl (λ _ player → Player.draw renderer player) unit players

draw : Renderer → State → IO Unit
draw renderer state = do
  draw-clicks renderer (State.clickCount state)
  draw-players renderer state


{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# FOREIGN GHC
import qualified SDL.Font as TTF
import Foreign.C.Types (CInt)
import qualified Data.Text as T
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))

renderText :: SDL.Renderer -> String -> SDL.Point SDL.V2 CInt -> IO ()
renderText renderer text (SDL.P (SDL.V2 x y)) = do
  currentDir <- getCurrentDirectory
  let fontPath = currentDir </> "UG" </> "assets" </> "AntonSC-Regular.ttf"
  font <- TTF.load fontPath 24 
  surface <- TTF.solid font (SDL.V4 0 0 0 255) (T.pack text)   -- Black
  texture <- SDL.createTextureFromSurface renderer surface
  SDL.freeSurface surface
  SDL.TextureInfo {SDL.textureWidth = w, SDL.textureHeight = h} <- SDL.queryTexture texture
  let destRect = SDL.Rectangle (SDL.P (SDL.V2 x y)) (SDL.V2 w h)
  SDL.copy renderer texture Nothing (Just destRect)
  SDL.destroyTexture texture
  TTF.free font

render :: SDL.Renderer -> Integer -> IO ()
render renderer clicks = do
  SDL.rendererDrawColor renderer SDL.$= SDL.V4 0 0 0 255  -- Black color for text
  renderText renderer ("Clicks: " ++ show (clicks)) (SDL.P (SDL.V2 10 10))
#-}

{-# COMPILE GHC draw-clicks = \renderer clicks -> render renderer (toInteger clicks) #-}
