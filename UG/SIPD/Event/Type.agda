module UG.SIPD.Event.Type where

open import Base.Bool.Type
open import Base.F64.Type
open import Base.String.Type
open import UG.SIPD.Event.Click

data Event : Set where
  KeyEvent : String -> Bool -> Event
  MouseClick : Click -> F64 → F64 → Event
  MouseMove : F64 -> F64 -> Event 

{-# FOREIGN GHC
import qualified Data.Text as T
import MAlonzo.Code.UG.SIPD.Event.Click

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double
#-}

{-# COMPILE GHC Event = data AgdaEvent (KeyEvent | MouseClick | MouseMove) #-}


