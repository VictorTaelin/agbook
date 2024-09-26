module UG.SIPD.Video.init where

open import Base.IO.IO
open import Base.Unit.Unit

postulate init : IO Unit

{-# FOREIGN GHC import qualified SDL #-}
{-# FOREIGN GHC import qualified SDL.Font as TTF #-}
{-# COMPILE GHC init = do
  { 
    SDL.initialize [SDL.InitVideo] ;
    TTF.initialize
  }
#-}
