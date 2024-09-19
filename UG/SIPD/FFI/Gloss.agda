module UG.SIPD.FFI.Gloss where

open import Data.Nat.Type
open import Data.String.Type
open import Data.IO.Type
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
open import UG.SM.TimedAction.Type
open import UG.SM.new-mach
open import Concurrent.Channel.Type
open import Data.List.Type

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

-- postulate
 -- gameLoop : (Mach State Event) -> (Mach State Event -> TimedAction Event -> Mach State Event) ->
  --           (Game State Event) -> (Channel String → IO Unit) -> (Channel String) -> IO Unit


postulate
  SDLWindow : Set
  Renderer : Set
  init-video : IO Unit
  -- quit-video : IO Unit
  create-window : IO SDLWindow
  create-renderer : SDLWindow -> IO Renderer
  get-events : IO (List Event)
  draw : SDLWindow -> Renderer -> State -> IO Unit

{-# FOREIGN GHC import qualified UG.SIPD.FFI.FGloss as FG #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# COMPILE GHC Window = type (T.Text, (Integer, Integer)) #-}
{-# COMPILE GHC Click = data FG.AgdaClick (FG.ALeftButton | FG.ARightButton) #-}
{-# COMPILE GHC Event = data FG.AgdaEvent (FG.KeyEvent | FG.MouseClick | FG.MouseMove) #-}
{-# COMPILE GHC SDLWindow = type SDL.Window #-}
{-# COMPILE GHC Renderer = type SDL.Renderer #-}

-- {-# COMPILE GHC gameLoop = FG.gameLoop #-}

{-# COMPILE GHC init-video = FG.initVideo #-}
-- {-# COMPILE GHC quit-video = FG.quitVideo #-}
{-# COMPILE GHC create-window = FG.createWindow #-}
{-# COMPILE GHC create-renderer = FG.createRenderer #-}
{-# COMPILE GHC get-events = FG.getEvents #-}
{-# COMPILE GHC draw = FG.draw #-}

