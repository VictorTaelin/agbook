module Bend.Parser.Test.skip-trivia where

open import Data.Bool.Type
open import Data.Char.Type
open import Data.Char.is-space
open import Data.Unit.Type
open import Data.Result.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.alternative
open import Data.Parser.starts-with
open import Data.Parser.advance-many
open import Data.String.Type
open import Data.String.eq
open import Data.Equal.Type
open import Bend.Parser.skip-trivia

-- Test cases
_ : skip-trivia (MkState "   code" 0) === 
    Done (MkReply (MkState "code" 3) unit)
_ = refl

_ : skip-trivia (MkState "   # This is a comment\n  #{This is a\nmulti-line comment#}\n  code" 0)
    === Done (MkReply (MkState "code" 60) unit)
_ = refl

_ : skip-trivia (MkState "code" 0) === 
    Done (MkReply (MkState "code" 0) unit)
_ = refl

_ : skip-trivia (MkState "  # Comment\n  code" 0) === 
    Done (MkReply (MkState "code" 14) unit)
_ = refl

_ : skip-trivia (MkState "#{Nested #{comments#} are #} handled" 0) === 
    Done (MkReply (MkState "handled" 29) unit)
_ = refl
