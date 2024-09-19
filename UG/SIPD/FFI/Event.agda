module UG.SIPD.FFI.Event where

open import Data.Float.Type
open import Data.Bool.Type
open import Data.String.Type

data Click : Set where
  LeftButton : Click
  RightButton : Click

data Event : Set where
  KeyEvent : String -> Bool -> Event
  MouseClick : Click -> Float → Float → Event
  MouseMove : Float -> Float -> Event 

{-# FOREIGN GHC

import qualified Data.Text as T

data AgdaClick = ALeftButton | ARightButton

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double

#-}

{-# COMPILE GHC Click = data AgdaClick (ALeftButton | ARightButton) #-}
{-# COMPILE GHC Event = data AgdaEvent (KeyEvent | MouseClick | MouseMove) #-}

