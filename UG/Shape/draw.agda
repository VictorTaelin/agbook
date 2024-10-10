module UG.Shape.draw where

open import Base.IO.IO
open import Base.Unit.Unit
open import Base.F64.F64
open import Base.V2.V2
open import UG.SIPD.Renderer.Renderer
open import UG.Shape.Shape

postulate draw : Renderer → Shape → IO Unit

{-# FOREIGN GHC
import qualified SDL
import qualified SDL.Primitive as Prim
import Data.Vector (Vector)
import qualified Data.Vector.Storable as VS
import Foreign.C.Types (CInt)
import Data.Int (Int16)
import MAlonzo.Code.UG.Shape.Shape (Shape(..))
import MAlonzo.Code.Base.V2.V2 (V2(..))

drawShape :: SDL.Renderer -> Shape -> IO ()
drawShape renderer shape = case shape of
  Circle (MkV2 cx cy) radius -> do
    Prim.fillCircle renderer (SDL.V2 (round cx) (round cy)) (round radius) (SDL.V4 255 0 0 255)
  Polygon (MkV2 cx cy) vertices -> do
    let absoluteVertices = map (\(MkV2 x y) -> MkV2 (x + cx) (y + cy)) vertices
        (xs, ys) = unzip $ map (\(MkV2 x y) -> (round x :: Int16, round y :: Int16)) absoluteVertices
        vxs = VS.fromList xs
        vys = VS.fromList ys
    Prim.fillPolygon renderer vxs vys (SDL.V4 0 255 0 255)
#-}

{-# COMPILE GHC draw = \renderer shape -> drawShape renderer shape #-}

