{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TypeApplications #-}

module UG.SIPD.FFI.FGloss where

import qualified Graphics.Gloss as Gloss
import Graphics.Gloss.Interface.Pure.Game
import qualified Graphics.Gloss.Interface.IO.Game as G
import qualified Data.Text as T
import MAlonzo.Code.UG.SIPD.State.Type (State(..))

data AgdaClick = ALeftButton | ARightButton

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double

convertEvent :: G.Event -> AgdaEvent
convertEvent (G.EventKey (G.Char c) G.Down _ _) = KeyEvent (T.pack [c]) True
convertEvent (G.EventKey (G.Char c) G.Up _ _) = KeyEvent (T.pack [c]) False
convertEvent (G.EventKey (G.MouseButton G.LeftButton) G.Down _ (x, y)) =
  MouseClick ALeftButton (realToFrac x) (realToFrac y)
convertEvent (G.EventKey (G.MouseButton G.RightButton) G.Down _ (x, y)) = 
  MouseClick ARightButton (realToFrac x) (realToFrac y)
convertEvent (G.EventMotion (x, y)) = MouseMove (realToFrac x) (realToFrac y)
convertEvent _ = MouseMove 0 0

window :: (T.Text, (Integer, Integer)) -> Display
window (name, (width, height)) = InWindow (T.unpack name) (fromIntegral width, fromIntegral height) (100, 100)

background :: Color
background = white


render :: State -> Picture
render game = 
  pictures [
    translate (-100) 0 $ scale 0.3 0.3 $ text $ "Clicks: " ++ show (clickCount game),
--    color red $ circleSolid 50  -- This draws a red circle with radius 50
  ]

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
playGame :: (T.Text, (Integer, Integer)) -> T.Text -> Integer -> State -> (State -> State) -> (AgdaEvent -> (State -> State) -> State -> State) -> IO ()
playGame win _ fps initState eventFn handleEventFn = do
  play (window win) background (fromIntegral fps) initState render handleGlossEvent update
  where
    handleGlossEvent :: Event -> State -> State
    handleGlossEvent event state =
      let agdaEvent = convertEvent event
      in handleEventFn agdaEvent eventFn state



