module UG.SIPD.Renderer.Type where

postulate Renderer : Set

{-# FOREIGN GHC import qualified SDL as SDL #-}

{-# COMPILE GHC Renderer = type SDL.Renderer #-}
