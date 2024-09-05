module Test.Parser.State where

open import Data.Parser.State
open import Data.Nat.Type
open import Data.Pair.Type
open import Data.String.Type
open import Data.Equal.Type

test-new-parser-state : new_parser_state "hello" == MkState "hello" 0
test-new-parser-state = refl

test-state-fields : let s = MkState "world" 5 in (State.input s , State.index s) == ("world" , 5)
test-state-fields = refl