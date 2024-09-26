module Bend.Parser.Test.skip-trivia where

open import Base.Bool.Bool
open import Base.Char.Char
open import Base.Char.is-space
open import Base.Unit.Unit
open import Base.Result.Result
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.alternative
open import Base.Parser.starts-with
open import Base.Parser.advance-many
open import Base.String.String
open import Base.String.eq
open import Base.Equal.Equal
open import Bend.Parser.skip-trivia

-- Test cases
_ : skip-trivia (MkState "   code" 0) ≡ 
    Done (MkReply (MkState "code" 3) unit)
_ = refl

_ : skip-trivia (MkState "   # This is a comment\n  #{This is a\nmulti-line comment#}\n  code" 0)
    ≡ Done (MkReply (MkState "code" 60) unit)
_ = refl

_ : skip-trivia (MkState "code" 0) ≡ 
    Done (MkReply (MkState "code" 0) unit)
_ = refl

_ : skip-trivia (MkState "  # Comment\n  code" 0) ≡ 
    Done (MkReply (MkState "code" 14) unit)
_ = refl

_ : skip-trivia (MkState "#{Nested #{comments#} are #} handled" 0) ≡ 
    Done (MkReply (MkState "handled" 29) unit)
_ = refl
