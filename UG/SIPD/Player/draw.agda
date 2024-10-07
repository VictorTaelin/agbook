module UG.SIPD.Player.draw where

import Base.Bool.show as Bool
open import Base.Bool.Bool
open import Base.IO.ALL
open import Base.List.List
open import Base.List.mfoldl
open import Base.List.mmap
open import Base.Nat.Nat
open import Base.Nat.show
open import Base.OrdMap.to-list
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.append
open import Base.Unit.Unit
open import Base.V2.V2
open import UG.SIPD.Player.Player
open import UG.SIPD.Renderer.Renderer
open import UG.SIPD.Renderer.clear as Renderer
open import UG.SIPD.Renderer.present as Renderer
open import UG.SIPD.State.State
open import UG.SIPD.Window.Window

postulate draw-clicks : Renderer → Nat → IO Unit
postulate draw-string : Renderer → String → V2 → IO Unit
postulate draw-nat : Renderer → Nat → V2 → IO Unit

draw-key-value : Renderer → Pair String Bool → IO Unit
draw-key-value renderer kvs = do
  let (key , value) = kvs 
  draw-string renderer key (MkV2 500.0 100.0)
  draw-string renderer (Bool.show value) (MkV2 520.0 100.0)

draw-keys : Renderer → Player → IO Unit
draw-keys renderer player = do
  let kv-list = to-list (Player.keys player)
  mfoldl (λ _ kvs → draw-key-value renderer kvs) unit kv-list

draw : Renderer → Player → IO Unit
draw renderer player = do
  let id = (Player.id player)
  draw-nat renderer id  (MkV2 500.0 70.0)
  let name = (Player.name player)
  draw-string renderer name (MkV2 520.0 70.0)
  draw-keys renderer player

{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# FOREIGN GHC
import qualified SDL.Font as TTF
import Foreign.C.Types (CInt)
import qualified Data.Text as T
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))
import MAlonzo.Code.Base.V2.V2 as V2

renderText :: SDL.Renderer -> T.Text -> SDL.Point SDL.V2 CInt -> IO ()
renderText renderer text (SDL.P (SDL.V2 x y)) = do
  currentDir <- getCurrentDirectory
  let fontPath = currentDir </> "UG" </> "assets" </> "AntonSC-Regular.ttf"
  font <- TTF.load fontPath 24 
  surface <- TTF.solid font (SDL.V4 0 0 0 255) text   -- Black
  texture <- SDL.createTextureFromSurface renderer surface
  SDL.freeSurface surface
  SDL.TextureInfo {SDL.textureWidth = w, SDL.textureHeight = h} <- SDL.queryTexture texture
  let destRect = SDL.Rectangle (SDL.P (SDL.V2 x y)) (SDL.V2 w h)
  SDL.copy renderer texture Nothing (Just destRect)
  SDL.destroyTexture texture
  TTF.free font
#-}

{-# COMPILE GHC draw-string = \renderer text (MkV2 x y) -> renderText renderer text (SDL.P (SDL.V2 (round x) (round y))) #-}

{-# COMPILE GHC draw-nat = \renderer n (MkV2 x y) -> renderText renderer (T.pack (show n)) (SDL.P (SDL.V2 (round x) (round y))) #-}

