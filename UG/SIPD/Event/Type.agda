module UG.SIPD.Event.Type where

open import Base.Bool.Type
open import Base.Float.Type
open import Base.String.Type
open import UG.SIPD.Event.Click

data Event : Set where
  KeyEvent : String -> Bool -> Event
  MouseClick : Click -> Float → Float → Event
  MouseMove : Float -> Float -> Event 

{-# FOREIGN GHC
import qualified Data.Text as T
import MAlonzo.Code.UG.SIPD.Event.Click

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double
#-}

{-# COMPILE GHC Event = data AgdaEvent (KeyEvent | MouseClick | MouseMove) #-}


