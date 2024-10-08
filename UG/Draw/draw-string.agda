module UG.Draw.draw-string where

open import Base.String.String
open import UG.SIPD.Renderer.Renderer
open import UG.SIPD.Renderer.clear as Renderer
open import UG.SIPD.Renderer.present as Renderer
open import Base.Nat.Nat
open import Base.V2.V2
open import Base.IO.IO
open import Base.Unit.Unit

postulate draw-string : Renderer → String → String → Nat → V2 → IO Unit

{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# FOREIGN GHC
import qualified SDL.Font as TTF
import Foreign.C.Types (CInt)
import qualified Data.Text as T
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))
import MAlonzo.Code.Base.V2.V2 as V2

renderText :: SDL.Renderer -> T.Text -> T.Text -> Integer -> SDL.Point SDL.V2 CInt -> IO ()
renderText renderer text fontName fontSize (SDL.P (SDL.V2 x y)) = do
  currentDir <- getCurrentDirectory
  let fontPath = currentDir </> "UG" </> "assets" </> fontName
  font <- TTF.load fontPath fontSize
  surface <- TTF.solid font (SDL.V4 0 0 0 255) text
  texture <- SDL.createTextureFromSurface renderer surface
  SDL.freeSurface surface
  SDL.TextureInfo {SDL.textureWidth = w, SDL.textureHeight = h} <- SDL.queryTexture texture
  let destRect = SDL.Rectangle (SDL.P (SDL.V2 x y)) (SDL.V2 w h)
  SDL.copy renderer texture Nothing (Just destRect)
  SDL.destroyTexture texture
  TTF.free font
#-}

{-# COMPILE GHC draw-string = \renderer text font font-size (MkV2 x y) -> renderText renderer text font font-size (SDL.P (SDL.V2 (round x) (round y))) #-}

