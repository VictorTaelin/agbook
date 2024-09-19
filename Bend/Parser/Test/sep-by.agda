module Bend.Parser.Test.sep-by where

open import Data.Bool.Type
open import Data.Bool.not
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.List.Type
open import Data.List.eq
open import Data.String.Type
open import Data.String.eq
open import Data.Result.Type
open import Data.Equal.Type
open import Data.Parser.Type
open import Data.Parser.pure
open import Data.Parser.bind
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Error
open import Bend.Parser.consume
open import Bend.Parser.parse-var-name
open import Bend.Parser.sep-by
open import Bend.Parser.skip-trivia

parse : {A : Set} → Parser A → String → Result (Reply A) Error
parse p input = p (new-parser-state input)

sep-by-parser : Parser (List String)
sep-by-parser = sep-by parse-var-name "," 0

-- Test empty list
_ : parse sep-by-parser "" === Done (MkReply (MkState "" 0) [])
_ = refl

_ : parse sep-by-parser "," === Done (MkReply (MkState "," 0) [])
_ = refl

-- Test single element
_ : parse sep-by-parser "foo" === Done (MkReply (MkState "" 3) ("foo" :: []))
_ = refl

_ : parse sep-by-parser "foo," === Done (MkReply (MkState "" 4) ("foo" :: []))
_ = refl

-- Test multiple elements
_ : parse sep-by-parser "foo,bar,baz" === Done (MkReply (MkState "" 11) ("foo" :: "bar" :: "baz" :: []))
_ = refl

-- Test with trailing separator
_ : parse sep-by-parser "foo,bar,baz," === Done (MkReply (MkState "" 12) ("foo" :: "bar" :: "baz" :: []))
_ = refl

-- Test with spaces
_ : parse sep-by-parser "foo , bar , baz" === Done (MkReply (MkState "" 15) ("foo" :: "bar" :: "baz" :: []))
_ = refl

-- Test with minimum elements
min-two-parser : Parser (List String)
min-two-parser = sep-by parse-var-name "," 2

_ : parse min-two-parser "foo,bar" === Done (MkReply (MkState "" 7) ("foo" :: "bar" :: []))
_ = refl

-- Test failure when minimum elements not met
_ : parse min-two-parser "foo" === Fail (MkError 3 "Expected ,")
_ = refl

-- Test with different separator
semicolon-parser : Parser (List String)
semicolon-parser = sep-by parse-var-name ";" 0

_ : parse semicolon-parser "foo;bar;baz" === Done (MkReply (MkState "" 11) ("foo" :: "bar" :: "baz" :: []))
_ = refl

-- Multiple separators
_ : parse sep-by-parser "foo,,bar,,,baz" === Done (MkReply (MkState ",bar,,,baz" 4) ("foo" :: []))
_ = refl
