module UG.SIPD.Video.init where

open import Base.IO.Type
open import Base.Unit.Type

postulate init : IO Unit

{-# FOREIGN GHC import qualified SDL #-}
{-# FOREIGN GHC import qualified SDL.Font as TTF #-}
{-# COMPILE GHC init = do
  { 
    SDL.initialize [SDL.InitVideo] ;
    TTF.initialize
  }
#-}
