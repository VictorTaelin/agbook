module UG.SIPD.Video.quit where

open import Base.IO.IO
open import Base.Unit.Unit

postulate quit : IO Unit

{-# FOREIGN GHC import qualified SDL #-}
{-# FOREIGN GHC import qualified SDL.Font as TTF #-}
{-# COMPILE GHC quit = do
  { 
    TTF.quit ;
    SDL.quit
   }
#-}
