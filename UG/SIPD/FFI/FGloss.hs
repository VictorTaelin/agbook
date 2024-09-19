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
import qualified MAlonzo.Code.UG.SM.Game.Type as Game
import qualified MAlonzo.Code.UG.SM.Type as Mach
import Foreign.C.Types (CInt)
import qualified Control.Concurrent as CC

data AgdaClick = ALeftButton | ARightButton

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double


initVideo :: IO ()
initVideo = do
  SDL.initialize [SDL.InitVideo]
  TTF.initialize

quitVideo :: IO ()
quitVideo = do
  TTF.quit
  SDL.quit

createWindow :: IO SDL.Window
createWindow = SDL.createWindow "Game" SDL.defaultWindow

createRenderer :: SDL.Window -> IO SDL.Renderer
createRenderer window = SDL.createRenderer window (-1) SDL.defaultRenderer

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

getEvents :: IO [AgdaEvent]
getEvents = do
  sdlEvents <- SDL.pollEvents
  return $ map convertEvent sdlEvents

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


draw :: SDL.Window -> SDL.Renderer -> State -> IO ()
draw window renderer state = do
  SDL.rendererDrawColor renderer SDL.$= SDL.V4 255 255 255 255  -- White background
  SDL.clear renderer  -- Clear the screen

  render renderer state
  SDL.present renderer

render :: SDL.Renderer -> State -> IO ()
render renderer state = do
  SDL.rendererDrawColor renderer SDL.$= SDL.V4 0 0 0 255  -- Black color for text
  renderText renderer ("Clicks: " ++ show (clickCount state)) (SDL.P (SDL.V2 10 10))

