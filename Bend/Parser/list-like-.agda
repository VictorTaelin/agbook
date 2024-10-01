module Bend.Parser.list-like- where

open import Base.Bool.Bool
open import Base.Bool.not
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.List.List
open import Base.List.eq
open import Base.String.String
open import Base.String.eq
open import Base.Result.Result
open import Base.Equal.Equal
open import Base.Parser.Parser
open import Base.Parser.Monad.pure
open import Base.Parser.Monad.bind
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Bend.Parser.consume
open import Bend.Parser.parse-var-name
open import Bend.Parser.list-like
open import Bend.Parser.skip-trivia

parse : {A : Set} → Parser A → String → Result (Reply A) Error
parse p input = p (new-parser-state input)

list-like-parser : Parser (List String)
list-like-parser = list-like parse-var-name "[" "]" "," False 0

-- Test empty list
_ : parse list-like-parser "[]" ≡ Done (MkReply (MkState "" 2) [])
_ = refl

-- Test single element list
_ : parse list-like-parser "[foo]" ≡ Done (MkReply (MkState "" 5) ("foo" :: []))
_ = refl

-- Test multiple element list
_ : parse list-like-parser "[foo,bar,baz]" ≡ Done (MkReply (MkState "" 13) ("foo" :: "bar" :: "baz" :: []))
_ = refl

-- Test list with trailing separator
_ : parse list-like-parser "[foo,bar,baz,]" ≡ Done (MkReply (MkState "" 14) ("foo" :: "bar" :: "baz" :: []))
_ = refl

-- Test list with minimum elements
min-two-parser : Parser (List String)
min-two-parser = list-like parse-var-name "[" "]" "," False 2

_ : parse min-two-parser "[foo,bar]" ≡ Done (MkReply (MkState "" 9) ("foo" :: "bar" :: []))
_ = refl

-- Test failure when minimum elements not met
_ : parse min-two-parser "[foo]" ≡ Fail _
_ = refl

-- Test list with hard separator
hard-sep-parser : Parser (List String)
hard-sep-parser = list-like parse-var-name "(" ")" "," True 0

_ : parse hard-sep-parser "(foo,bar,baz)" ≡ Done (MkReply (MkState "" 13) ("foo" :: "bar" :: "baz" :: []))
_ = refl

_ : parse hard-sep-parser "(foo,bar,baz,)" ≡ Done (MkReply (MkState "" 14) ("foo" :: "bar" :: "baz" :: []))
_ = refl

-- Test failure on missing hard separator
_ : parse hard-sep-parser "(foo bar,baz)" ≡ Fail _
_ = refl
