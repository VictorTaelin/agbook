module UG.SIPD.FFI.quit-video where

open import Data.IO.Type
open import Data.Unit.Type

postulate quit-video : IO Unit

{-# FOREIGN GHC import qualified SDL #-}
{-# FOREIGN GHC import qualified SDL.Font as TTF #-}
{-# COMPILE GHC quit-video = do
  { 
    TTF.quit ;
    SDL.quit
   }
#-}
