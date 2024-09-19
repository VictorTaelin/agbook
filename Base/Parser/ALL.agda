module Base.Parser.ALL where

open import Base.Parser.Error public
open import Base.Parser.Reply public
open import Base.Parser.State public
open import Base.Parser.Type public
open import Base.Parser.advance-many public
open import Base.Parser.advance-one public
open import Base.Parser.alternative public
open import Base.Parser.bind public
open import Base.Parser.consume public
open import Base.Parser.fail public
open import Base.Parser.is-eof public
open import Base.Parser.parse-char public
open import Base.Parser.parse-name public
open import Base.Parser.parse-quoted-char public
open import Base.Parser.parse-string public
open import Base.Parser.peek-many public
open import Base.Parser.peek-one public
open import Base.Parser.pure public
open import Base.Parser.skip-spaces public
open import Base.Parser.skip-trivia public
open import Base.Parser.starts-with public
open import Base.Parser.take-while public

open Base.Parser.Type public using (Parser)
open Base.Parser.Error public using (Error; MkError)
open Base.Parser.Reply public using (Reply; MkReply)
open Base.Parser.State public using (State; MkState)
