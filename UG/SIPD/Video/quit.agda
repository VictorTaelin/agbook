module UG.SIPD.Video.quit-video where

open import Base.IO.Type
open import Base.Unit.Type

postulate quit-video : IO Unit

{-# FOREIGN GHC import qualified SDL #-}
{-# FOREIGN GHC import qualified SDL.Font as TTF #-}
{-# COMPILE GHC quit-video = do
  { 
    TTF.quit ;
    SDL.quit
   }
#-}
