module UG.SIPD.Event.get-events where

open import Base.IO.Type
open import Base.List.Type
open import UG.SIPD.FFI.Event

postulate get-events : IO (List Event)

{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# FOREIGN GHC 
import MAlonzo.Code.UG.SIPD.FFI.Event
import qualified Base.Text as T

convertEvent :: SDL.Event -> AgdaEvent
convertEvent (SDL.Event _ (SDL.KeyboardEvent keyboardEvent)) =
  let keycode = SDL.keysymKeycode (SDL.keyboardEventKeysym keyboardEvent)
      pressed = SDL.keyboardEventKeyMotion keyboardEvent == SDL.Pressed
  in case keycode of
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
       (SDL.ButtonLeft, SDL.Pressed)  -> MouseClick ALeftButton (fromIntegral x) (fromIntegral y)
       (SDL.ButtonRight, SDL.Pressed) -> MouseClick ARightButton (fromIntegral x) (fromIntegral y)
       (_, SDL.Released)              -> MouseMove 0 0
       _                              -> MouseMove 0 0
convertEvent (SDL.Event _ (SDL.MouseMotionEvent motionEvent)) =
  let SDL.P (SDL.V2 x y) = SDL.mouseMotionEventPos motionEvent
  in MouseMove (fromIntegral x) (fromIntegral y)
convertEvent _ = MouseMove 0 0

#-}

{-# COMPILE GHC get-events = do
  {
    sdlEvents <- SDL.pollEvents ;
    return $ map convertEvent sdlEvents
  }
#-}
