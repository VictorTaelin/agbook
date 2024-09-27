module UG.SIPD.Event.Main where

open import Base.IO.ALL
open import Base.String.String
open import Base.F64.F64
open import Base.Bool.eq
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Unit.Unit
open import Base.Maybe.Maybe
open import UG.SIPD.Event.Event
open import UG.SIPD.Event.Click.Click
open import Base.Function.case
open import Base.ByteString.show
open import Base.String.String
open import UG.SIPD.Event.serialize
open import UG.SIPD.Event.deserialize
import UG.SIPD.Event.show as Event

test-mouse-c : Event
test-mouse-c = MouseClick LeftButton 3.14 2.718

test-key-ev : Event
test-key-ev = KeyEvent "A" True

test-mouse-mv : Event
test-mouse-mv = MouseMove 5.1 209.3

main : IO Unit
main = do
  print "Testing Event serialization and deserialization"
  case (serialize test-mouse-mv) of λ where
    None → print "Serialization failed"
    (Some serialized) → do
      print "Serialization successful\n"
      print ( show serialized )
      case (deserialize serialized) of λ where
        None → print "Deserialization failed"
        (Some deserialized) → 
          print (Event.show deserialized)
  
