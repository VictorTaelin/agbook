module UG.SIPD.FFI.Gloss where

open import Data.Nat.Type
open import Data.String.Type
open import Data.IOAsync.Type
open import Data.Unit.Type
open import Data.Nat.show
open import Data.String.append
open import Data.Pair.Type
open import Data.Int.Type
open import Data.Float.Type
open import Data.Bool.Type
open import UG.SIPD.State.Type
open import Data.Unit.Type
open import UG.SM.Game.Type
open import UG.SM.Type
open import Concurrent.Channel.Type

Window : Set
Window = Pair String (Pair Nat Nat)

data Click : Set where
  LeftButton : Click
  RightButton : Click

--data Key : Set where
 -- A : Key
 -- W : Key
 -- S : Key
 -- D : Key

-- Event now includes KeyEvent with a key (String) and a boolean (up or down),
-- and MouseClick with a button (String)
data Event : Set where
  KeyEvent : String → Bool → Event
  MouseClick : Click → Float → Float → Event
  MouseMove : Float → Float → Event 

--process-messages : Channel String → IOAsync Unit

postulate
  gameLoop : (Game State Event) → (Channel String → IOAsync Unit) → (Channel String) → IOAsync Unit

{-# FOREIGN GHC import qualified UG.SIPD.FFI.FGloss as FG #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# COMPILE GHC Window = type (T.Text, (Integer, Integer)) #-}
{-# COMPILE GHC Click = data FG.AgdaClick (FG.ALeftButton | FG.ARightButton) #-}
{-# COMPILE GHC Event = data FG.AgdaEvent (FG.KeyEvent | FG.MouseClick | FG.MouseMove) #-}
{-# COMPILE GHC gameLoop = FG.gameLoop #-}

