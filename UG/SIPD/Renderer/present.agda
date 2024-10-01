module UG.SIPD.Renderer.present where

open import Base.IO.IO
open import Base.Unit.Unit
open import UG.SIPD.Renderer.Renderer

postulate present : Renderer → IO Unit

{-# FOREIGN GHC import qualified SDL as SDL #-}

{-# COMPILE GHC present = \renderer -> SDL.present renderer #-}
