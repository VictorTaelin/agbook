module UG.SIPD.FFI.Window.Type where

postulate Window : Set

{-# FOREIGN GHC import qualified SDL as SDL #-}

{-# COMPILE GHC Window = type SDL.Window #-}
