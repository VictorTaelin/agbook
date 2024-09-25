module Bend.Parser.Test.is-name-char where

open import Bend.Parser.is-name-char
open import Base.Char.Type
open import Base.Bool.Type
open import Base.Equal.Type
open import Base.String.from-char

-- Test valid name characters
_ : is-name-char 'a' ≡ True
_ = refl

_ : is-name-char 'Z' ≡ True
_ = refl

_ : is-name-char '0' ≡ True
_ = refl

_ : is-name-char '9' ≡ True
_ = refl

_ : is-name-char '_' ≡ True
_ = refl

_ : is-name-char '.' ≡ True
_ = refl

_ : is-name-char '-' ≡ True
_ = refl

_ : is-name-char '/' ≡ True
_ = refl

-- Test invalid name characters
_ : is-name-char '!' ≡ False
_ = refl

_ : is-name-char '@' ≡ False
_ = refl

_ : is-name-char ' ' ≡ False
_ = refl

_ : is-name-char '\n' ≡ False
_ = refl
