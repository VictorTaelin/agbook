{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BlockArguments #-}


module UG.SIPD.FFI.FGloss where

import qualified Graphics.Gloss as Gloss
import qualified SDL
import Graphics.Gloss.Interface.Pure.Game
import qualified Graphics.Gloss.Interface.IO.Game as G
import qualified Data.Text as T
import Control.Monad (unless)
import MAlonzo.Code.UG.SIPD.State.Type (State(..))

data AgdaClick = ALeftButton | ARightButton

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double

convertEventS :: SDL.Event -> AgdaEvent
convertEventS (SDL.Event _ (SDL.KeyboardEvent keyboardEvent)) =
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
convertEventS (SDL.Event _ (SDL.MouseButtonEvent mouseButtonEvent)) =
  let SDL.P (SDL.V2 x y) = SDL.mouseButtonEventPos mouseButtonEvent
      button = SDL.mouseButtonEventButton mouseButtonEvent
  in case button of
       SDL.ButtonLeft  -> MouseClick ALeftButton (fromIntegral x) (fromIntegral y)
       SDL.ButtonRight -> MouseClick ARightButton (fromIntegral x) (fromIntegral y)
       _               -> MouseMove 0 0
convertEventS (SDL.Event _ (SDL.MouseMotionEvent motionEvent)) =
  let SDL.P (SDL.V2 x y) = SDL.mouseMotionEventPos motionEvent
  in MouseMove (fromIntegral x) (fromIntegral y)
convertEventS _ = MouseMove 0 0

convertEvent :: G.Event -> AgdaEvent
convertEvent (G.EventKey (G.Char c) G.Down _ _) = KeyEvent (T.pack [c]) True
convertEvent (G.EventKey (G.Char c) G.Up _ _) = KeyEvent (T.pack [c]) False
convertEvent (G.EventKey (G.MouseButton G.LeftButton) G.Down _ (x, y)) =
  MouseClick ALeftButton (realToFrac x) (realToFrac y)
convertEvent (G.EventKey (G.MouseButton G.RightButton) G.Down _ (x, y)) = 
  MouseClick ARightButton (realToFrac x) (realToFrac y)
convertEvent (G.EventMotion (x, y)) = MouseMove (realToFrac x) (realToFrac y)
convertEvent _ = MouseMove 0 0

displayPicture :: (Int, Int) -> Color -> Float -> Picture -> IO ()
displayPicture (w, h) background scale picture =
  Gloss.display (InWindow "Game" (w, h) (10, 10)) background (Scale scale scale picture)

gameLoop :: State -> IO ()
gameLoop state = do
  SDL.initialize [SDL.InitVideo]
  window <- SDL.createWindow "Game" SDL.defaultWindow
  SDL.showWindow window

  let loop s = do
        events <- SDL.pollEvents
        let newState = s
        
        displayPicture (800, 600) white 1.0 (render newState)

        let quit = any (== SDL.QuitEvent) (map SDL.eventPayload events)
        unless quit (loop newState)


  --loop state
  SDL.destroyWindow window
  SDL.quit

window :: (T.Text, (Integer, Integer)) -> Display
window (name, (width, height)) = InWindow (T.unpack name) (fromIntegral width, fromIntegral height) (100, 100)

background :: Color
background = white

render :: State -> Picture
render game = 
  pictures [
    translate (-100) 0 $ scale 0.3 0.3 $ text $ "Clicks: " ++ show (clickCount game)
  ]

-- tick FN, comes from agda (SM)
update :: Float -> State -> State
--update _ st = st { clickCount = clickCount st + 1 }
update _ = id

-- | The 'playGame' function sets up and runs a game using Gloss.
--
-- Parameters:
-- - (T.Text, (Integer, Integer)): A tuple containing:
--   * T.Text: The title of the game window
--   * (Integer, Integer): The dimensions of the game window (width, height)
-- - T.Text: Background color
-- - Integer: The number of simulation steps to take for each second of real time
-- - Integer: Initial state
-- - (Integer -> Integer): A function that updates the game state for each frame
--
--
-- INSTEAD of receiving a lot of params, receive the state machine and use init, tick, when (the Game type)
-- think about how to mix the play function with the SM.
playGame :: (T.Text, (Integer, Integer)) -> T.Text -> Integer -> State -> (State -> State) -> (AgdaEvent -> (State -> State) -> State -> State) -> IO ()
playGame win _ fps initState eventFn handleEventFn = do
  play (window win) background (fromIntegral fps) initState render handleGlossEvent update
  where
    handleGlossEvent :: Event -> State -> State
    handleGlossEvent event state =
      let agdaEvent = convertEvent event
      in handleEventFn agdaEvent eventFn state
