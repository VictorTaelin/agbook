{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BlockArguments #-}

module UG.SIPD.FFI.FGloss where

import qualified Graphics.Gloss as Gloss
import qualified SDL
import qualified SDL.Font as TTF
import Data.List (foldl)
import Graphics.Gloss.Interface.Pure.Game
import qualified Graphics.Gloss.Interface.IO.Game as G
import qualified Data.Text as T
import Control.Monad (unless)
import MAlonzo.Code.UG.SIPD.State.Type (State(..))
--import MAlonzo.Code.UG.SM.QregisterZ45Zaction
import qualified MAlonzo.Code.UG.SM.Game.Type as Game
import Foreign.C.Types (CInt)
import qualified Control.Concurrent as CC

data AgdaClick = ALeftButton | ARightButton

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double

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

renderText :: SDL.Renderer -> String -> SDL.Point SDL.V2 CInt -> IO ()
renderText renderer text (SDL.P (SDL.V2 x y)) = do
  font <- TTF.load "/home/lorenzo/work/monobook/UG/SIPD/FFI/AntonSC-Regular.ttf" 24 
  surface <- TTF.solid font (SDL.V4 0 0 0 255) (T.pack text)   -- Black
  texture <- SDL.createTextureFromSurface renderer surface
  SDL.freeSurface surface
  SDL.TextureInfo {SDL.textureWidth = w, SDL.textureHeight = h} <- SDL.queryTexture texture

  let destRect = SDL.Rectangle (SDL.P (SDL.V2 x y)) (SDL.V2 w h)

  SDL.copy renderer texture Nothing (Just destRect)
  SDL.destroyTexture texture

  TTF.free font


displayPicture :: SDL.Window -> SDL.Renderer -> State -> IO ()
displayPicture window renderer state = do
  -- Set the drawing color (background)
  SDL.rendererDrawColor renderer SDL.$= SDL.V4 255 255 255 255  -- White background
  SDL.clear renderer  -- Clear the screen

  -- Render the game state
  render renderer state

  -- Present the rendered content
  SDL.present renderer

render :: SDL.Renderer -> State -> IO ()
render renderer state = do
  SDL.rendererDrawColor renderer SDL.$= SDL.V4 0 0 0 255  -- Black color for text
  renderText renderer ("Clicks: " ++ show (clickCount state)) (SDL.P (SDL.V2 10 10))


-- gameLoop : (Game State Event) → (Channel String → IOAsync Unit) → IOAsync Unit

gameLoop :: (Game.Game State AgdaEvent) -> (CC.Chan T.Text -> IO ()) -> (CC.Chan T.Text) -> IO ()
gameLoop game processMsg channel = do
--  d_register'45'action_10
--  Adding the state machine is simple, just receive it as an arg and use register action instead of 
--  folding the events through the when function.
  SDL.initialize [SDL.InitVideo]
  TTF.initialize
  let state = (Game.init game)
  window <- SDL.createWindow "Game" SDL.defaultWindow
  renderer <- SDL.createRenderer window (-1) SDL.defaultRenderer


-- what is the role of the state machine in the gameLoop?
-- the main role of the state machine is to time the events that come and go and control and compute the state following a Tick
-- How to make this work correctly in haskell through the FFI?
-- our game loop receives the initial state machine.
-- it will register the actions (which are AgdaEvents here)
-- it will just use compute (and when is used to compute the actions, but it is embedded in the machine so its ok)
-- Considering that the loop now folds with Game.when (and we receive the game), what will change?
-- We should receive just the machine. The machine is updated everytime with the nem actions that are registered
-- Through the processMsg channel (that will return a Maybe machine or smth like this). Actually a Maybe Action that then maybe will update the machine.
-- we loop with the new machine (and state).
-- Therefore, we just need to receive as an argument to the game loop postulate:
--  The initial Machine (with the 3 functions - tick, when and compute)
--  the register-action is kind of a problem because we will have to write down all the compile pragmas but ok
--  keep this general to integrate correctly with js game after.
  let loop s = do
        events <- SDL.pollEvents
        let agdaEvents = map convertEvent events
 
        let newState = foldl (flip ((Game.when game))) s agdaEvents
        
        displayPicture window renderer newState

        processMsg channel

        let quit = any (== SDL.QuitEvent) (map SDL.eventPayload events)
        unless quit (loop newState)

  loop state

  SDL.destroyRenderer renderer
  SDL.destroyWindow window
  TTF.quit
  SDL.quit



