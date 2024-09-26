module UG.SIPD.Window.Window where

postulate Window : Set

{-# FOREIGN GHC import qualified SDL as SDL #-}

{-# COMPILE GHC Window = type SDL.Window #-}
