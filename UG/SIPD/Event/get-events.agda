module UG.SIPD.Event.get-events where

open import Base.IO.IO
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.List.filter
open import Base.Maybe.to-list
open import UG.SIPD.Event.Event
open import Base.Nat.Nat

postulate get-events : Nat → Nat → IO (List Event)

{-# FOREIGN GHC import qualified SDL as SDL #-}
{-# FOREIGN GHC 
import MAlonzo.Code.UG.SIPD.Event.Event
import MAlonzo.Code.UG.SIPD.Event.Click.Click
import MAlonzo.Code.Base.Maybe.Maybe
import qualified Data.Text as T
import Data.Maybe (catMaybes)

convertEvent :: Integer -> Integer -> SDL.Event -> Maybe AgdaEvent
convertEvent time pid (SDL.Event _ (SDL.KeyboardEvent keyboardEvent)) =
  let keycode = SDL.keysymKeycode (SDL.keyboardEventKeysym keyboardEvent)
      pressed = SDL.keyboardEventKeyMotion keyboardEvent == SDL.Pressed
  in Just $ case keycode of
       SDL.KeycodeW -> KeyEvent time pid (T.pack "W") pressed
       SDL.KeycodeA -> KeyEvent time pid (T.pack "A") pressed
       SDL.KeycodeS -> KeyEvent time pid (T.pack "S") pressed
       SDL.KeycodeD -> KeyEvent time pid (T.pack "D") pressed
       SDL.KeycodeQ -> KeyEvent time pid (T.pack "Q") pressed
       SDL.KeycodeE -> KeyEvent time pid (T.pack "E") pressed
       _            -> KeyEvent time pid (T.pack "") False -- Handle other keys
convertEvent time pid (SDL.Event _ (SDL.MouseButtonEvent mouseButtonEvent)) =
  let SDL.P (SDL.V2 x y) = SDL.mouseButtonEventPos mouseButtonEvent
      button = SDL.mouseButtonEventButton mouseButtonEvent
      motion = SDL.mouseButtonEventMotion mouseButtonEvent
  in case (button, motion) of
       (SDL.ButtonLeft, SDL.Pressed)  -> Just $ MouseClick time pid ALeftButton (fromIntegral x) (fromIntegral y)
       (SDL.ButtonRight, SDL.Pressed) -> Just $ MouseClick time pid ARightButton (fromIntegral x) (fromIntegral y)
       _                              -> Nothing
convertEvent time pid (SDL.Event _ (SDL.MouseMotionEvent motionEvent)) =
  let SDL.P (SDL.V2 x y) = SDL.mouseMotionEventPos motionEvent
  in Just $ MouseMove time pid (fromIntegral x) (fromIntegral y)
convertEvent _ _ _ = Nothing
#-}

{-# COMPILE GHC get-events = \ time pid -> do
  {
    sdlEvents <- SDL.pollEvents ;
    return $ catMaybes $ map (convertEvent (fromIntegral time) (fromIntegral pid)) sdlEvents
  }
#-}
