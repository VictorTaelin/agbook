import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

-- Define the game state
data GameState = GameState
  { clickCount :: Int
  }

-- Initial game state
initialState :: GameState
initialState = GameState { clickCount = 0 }

-- Window configuration
window :: Display
window = InWindow "Click Counter" (400, 400) (100, 100)

-- Background color
background :: Color
background = white

-- Render the game state
render :: GameState -> Picture
render game = 
  translate (-100) 0 $ scale 0.3 0.3 $ text $ "Clicks: " ++ show (clickCount game)

-- Handle events
handleEvent :: Event -> GameState -> GameState
handleEvent (EventKey (MouseButton LeftButton) Down _ _) game =
  game { clickCount = clickCount game + 1 }
handleEvent _ game = game

-- Update (not used in this simple game, but required by gloss)
update :: Float -> GameState -> GameState
update _ = id

-- Main function
main :: IO ()
main = play window background 30 initialState render handleEvent update

