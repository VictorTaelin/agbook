module UG.SIPD.Event.get-events where

open import Base.IO.IO
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.List.filter
open import Base.Maybe.to-list
open import UG.SIPD.Event.Event
open import Base.Nat.Nat

postulate get-events : Nat → IO (List Event)

{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# FOREIGN GHC 
import MAlonzo.Code.UG.SIPD.Event.Event
import MAlonzo.Code.UG.SIPD.Event.Click.Click
import MAlonzo.Code.Base.Maybe.Maybe
import qualified Data.Text as T
import Data.Maybe (catMaybes)

convertEvent :: Integer -> SDL.Event -> Maybe AgdaEvent
convertEvent pid (SDL.Event _ (SDL.KeyboardEvent keyboardEvent)) =
  let keycode = SDL.keysymKeycode (SDL.keyboardEventKeysym keyboardEvent)
      pressed = SDL.keyboardEventKeyMotion keyboardEvent == SDL.Pressed
  in Just $ case keycode of
       SDL.KeycodeW -> KeyEvent pid (T.pack "W") pressed
       SDL.KeycodeA -> KeyEvent pid (T.pack "A") pressed
       SDL.KeycodeS -> KeyEvent pid (T.pack "S") pressed
       SDL.KeycodeD -> KeyEvent pid (T.pack "D") pressed
       SDL.KeycodeQ -> KeyEvent pid (T.pack "Q") pressed
       SDL.KeycodeE -> KeyEvent pid (T.pack "E") pressed
       _            -> KeyEvent pid (T.pack "") False -- Handle other keys
convertEvent pid (SDL.Event _ (SDL.MouseButtonEvent mouseButtonEvent)) =
  let SDL.P (SDL.V2 x y) = SDL.mouseButtonEventPos mouseButtonEvent
      button = SDL.mouseButtonEventButton mouseButtonEvent
      motion = SDL.mouseButtonEventMotion mouseButtonEvent
  in case (button, motion) of
       (SDL.ButtonLeft, SDL.Pressed)  -> Just $ MouseClick pid ALeftButton (fromIntegral x) (fromIntegral y)
       (SDL.ButtonRight, SDL.Pressed) -> Just $ MouseClick pid ARightButton (fromIntegral x) (fromIntegral y)
       _                              -> Nothing
convertEvent pid (SDL.Event _ (SDL.MouseMotionEvent motionEvent)) =
  let SDL.P (SDL.V2 x y) = SDL.mouseMotionEventPos motionEvent
  in Just $ MouseMove pid (fromIntegral x) (fromIntegral y)
convertEvent _ _ = Nothing
#-}

{-# COMPILE GHC get-events = \ pid -> do
  {
    sdlEvents <- SDL.pollEvents ;
    return $ catMaybes $ map (convertEvent (fromIntegral pid)) sdlEvents
  }
#-}
