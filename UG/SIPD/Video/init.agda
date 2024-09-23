module UG.SIPD.Video.init-video where

open import Base.IO.Type
open import Base.Unit.Type

postulate init-video : IO Unit

{-# FOREIGN GHC import qualified SDL #-}
{-# FOREIGN GHC import qualified SDL.Font as TTF #-}
{-# COMPILE GHC init-video = do
  { 
    SDL.initialize [SDL.InitVideo] ;
    TTF.initialize
  }
#-}
