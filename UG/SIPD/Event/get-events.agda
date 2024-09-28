module UG.SIPD.Event.get-events where

open import Base.IO.IO
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.List.filter
open import Base.Maybe.to-list
open import UG.SIPD.Event.Event

postulate get-events : IO (List Event)

{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# FOREIGN GHC 
import MAlonzo.Code.UG.SIPD.Event.Event
import MAlonzo.Code.UG.SIPD.Event.Click.Click
import MAlonzo.Code.Base.Maybe.Maybe
import qualified Data.Text as T
import Data.Maybe (catMaybes)

convertEvent :: SDL.Event -> Maybe AgdaEvent
convertEvent (SDL.Event _ (SDL.KeyboardEvent keyboardEvent)) =
  let keycode = SDL.keysymKeycode (SDL.keyboardEventKeysym keyboardEvent)
      pressed = SDL.keyboardEventKeyMotion keyboardEvent == SDL.Pressed
  in Just $ case keycode of
       SDL.KeycodeW -> KeyEvent (T.pack "W") pressed
       SDL.KeycodeA -> KeyEvent (T.pack "A") pressed
       SDL.KeycodeS -> KeyEvent (T.pack "S") pressed
       SDL.KeycodeD -> KeyEvent (T.pack "D") pressed
       SDL.KeycodeQ -> KeyEvent (T.pack "Q") pressed
       SDL.KeycodeE -> KeyEvent (T.pack "E") pressed
       _            -> KeyEvent (T.pack "") False -- Handle other keys
convertEvent (SDL.Event _ (SDL.MouseButtonEvent mouseButtonEvent)) =
  let SDL.P (SDL.V2 x y) = SDL.mouseButtonEventPos mouseButtonEvent
      button = SDL.mouseButtonEventButton mouseButtonEvent
      motion = SDL.mouseButtonEventMotion mouseButtonEvent
  in case (button, motion) of
       (SDL.ButtonLeft, SDL.Pressed)  -> Just $ MouseClick ALeftButton (fromIntegral x) (fromIntegral y)
       (SDL.ButtonRight, SDL.Pressed) -> Just $ MouseClick ARightButton (fromIntegral x) (fromIntegral y)
       _                              -> Nothing
-- convertEvent (SDL.Event _ (SDL.MouseMotionEvent motionEvent)) =
--  let SDL.P (SDL.V2 x y) = SDL.mouseMotionEventPos motionEvent
--  in Just $ MouseMove (fromIntegral x) (fromIntegral y)
convertEvent _ = Nothing
#-}

{-# COMPILE GHC get-events = do
  {
    sdlEvents <- SDL.pollEvents ;
    return $ catMaybes $ map convertEvent sdlEvents
  }
#-}

