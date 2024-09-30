module UG.SIPD.Event.Event where

open import Base.Bool.Bool
open import Base.F64.F64
open import Base.String.String
open import UG.SIPD.Event.Click.Click

data Event : Set where
  KeyEvent : String → Bool → Event
  MouseClick : Click → F64 → F64 → Event
  MouseMove : F64 → F64 → Event 


{-# FOREIGN GHC
import qualified Data.Text as T
import MAlonzo.Code.UG.SIPD.Event.Click.Click

data AgdaEvent
  = KeyEvent T.Text Bool
  | MouseClick AgdaClick Double Double
  | MouseMove Double Double
#-}

{-# COMPILE GHC Event = data AgdaEvent (KeyEvent | MouseClick | MouseMove) #-}

