module Base.Parser.ALL where

open import Base.Parser.Error public
open import Base.Parser.Monad.bind public
open import Base.Parser.Monad.pure public
open import Base.Parser.Parser public
open import Base.Parser.Reply public
open import Base.Parser.State public
open import Base.Parser.advance-many public
open import Base.Parser.advance-one public
open import Base.Parser.alternative public
open import Base.Parser.consume public
open import Base.Parser.fail public
open import Base.Parser.get-index public
open import Base.Parser.is-eof public
open import Base.Parser.map public
open import Base.Parser.parse-char public
open import Base.Parser.parse-many public
open import Base.Parser.parse-name public
open import Base.Parser.parse-quoted-char public
open import Base.Parser.parse-string public
open import Base.Parser.peek-many public
open import Base.Parser.peek-one public
open import Base.Parser.skip-spaces public
open import Base.Parser.skip-trivia public
open import Base.Parser.starts-with public
open import Base.Parser.take-while public

