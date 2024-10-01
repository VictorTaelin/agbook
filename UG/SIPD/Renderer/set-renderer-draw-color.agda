module UG.SIPD.Renderer.set-renderer-draw-color where

open import Base.IO.IO
open import Base.Nat.Nat
open import Base.Unit.Unit
open import UG.SIPD.Renderer.Renderer

postulate set-renderer-draw-color : Renderer → Nat → Nat → Nat → Nat → IO Unit

{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# FOREIGN GHC import Data.Word (Word8) #-}
{-# FOREIGN GHC import qualified SDL.Video as SDL #-}
{-# FOREIGN GHC import Control.Monad.IO.Class (liftIO) #-}

{-# COMPILE GHC set-renderer-draw-color = \ renderer r g b a -> liftIO $ do
  SDL.rendererDrawColor renderer SDL.$= SDL.V4 (fromIntegral r) (fromIntegral g) (fromIntegral b) (fromIntegral a)
#-}
