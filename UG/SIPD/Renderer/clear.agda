module UG.SIPD.Renderer.clear where

open import Base.IO.IO
open import Base.Unit.Unit
open import UG.SIPD.Renderer.Renderer

postulate clear : Renderer → IO Unit

{-# FOREIGN GHC import qualified SDL as SDL #-}

{-# COMPILE GHC clear = \renderer -> SDL.clear renderer #-}
