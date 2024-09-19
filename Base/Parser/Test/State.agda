module Base.Parser.Test.State where

open import Base.Parser.State
open import Base.Nat.Type
open import Base.Pair.Type
open import Base.String.Type
open import Base.Equal.Type

test-new-parser-state : new_parser_state "hello" === MkState "hello" 0
test-new-parser-state = refl

test-state-fields : let s = MkState "world" 5 in (State.input s , State.index s) === ("world" , 5)
test-state-fields = refl