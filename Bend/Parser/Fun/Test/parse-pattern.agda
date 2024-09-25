module Bend.Parser.Fun.Test.parse-pattern where

open import Base.Parser.Type
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Error
open import Bend.Parser.Fun.parse-pattern
open import Bend.Fun.Pattern.Type
open import Bend.Fun.FanKind.Type as FanKind
open import Base.Parser.Type
open import Base.Parser.State
open import Base.Function.case
open import Base.Equal.Type
open import Base.String.Type
open import Base.Maybe.Type
open import Base.Result.Type
open import Base.List.Type
open import Base.Pair.Type

parse : String -> Result (Reply Pattern) Error
parse input = parse-pattern (new-parser-state input)

-- Variable pattern
_ : parse "x" ≡ Done (MkReply (MkState "" 1) (Var (Some "x")))
_ = refl

-- Erased pattern
_ : parse "*" ≡ Done (MkReply (MkState "" 1) (Var None))
_ = refl

-- Erased pattern
_ : parse "*" ≡ Done (MkReply (MkState "" 1) (Var None))
_ = refl

-- Number pattern
_ : parse "42" ≡ Done (MkReply (MkState "" 2) (Num 42))
_ = refl

_ : parse "+42" ≡ Fail (MkError 0 "Expected pattern")
_ = refl

-- String pattern
_ : parse "\"hello\"" ≡ Done (MkReply (MkState "" 7) (Str "hello"))
_ = refl

-- Character pattern
_ : parse "'a'" ≡ Done (MkReply (MkState "" 3) (Num 97))
_ = refl

-- List pattern
_ : parse "[]" ≡ Done (MkReply (MkState "" 2) (Lst []))
_ = refl

_ : parse "[1]" ≡ Done (MkReply (MkState "" 3) (Lst (Num 1 :: [])))
_ = refl

_ : parse "[1, 2, 3]" ≡ Done (MkReply (MkState "" 9) (Lst (Num 1 :: Num 2 :: Num 3 :: [])))
_ = refl

-- Tuple pattern
_ : parse "(x, y, z)" ≡ Done (MkReply (MkState "" 9) (Fan FanKind.Tup (Var (Some "x") :: Var (Some "y") :: Var (Some "z") :: [])))
_ = refl

_ : parse "(x, y,)" ≡ Done (MkReply (MkState "" 7) (Fan FanKind.Tup (Var (Some "x") :: Var (Some "y") :: [])))
_ = refl

_ : parse "(x,)" ≡ Fail (MkError 0 "Expected pattern")
_ = refl

-- Constructor pattern
_ : parse "(Cons x xs)" ≡ Done (MkReply (MkState "" 11) (Ctr "Cons" (Var (Some "x") :: Var (Some "xs") :: [])))
_ = refl

-- Nested pattern
_ : parse "(Cons 1 (Cons 2 []))" ≡ Done (MkReply (MkState "" 20) (Ctr "Cons" (Num 1 :: Ctr "Cons" (Num 2 :: Lst [] :: []) :: [])))
_ = refl

-- Channel pattern
_ : parse "$ch" ≡ Done (MkReply (MkState "" 3) (Chn "ch"))
_ = refl

-- Complex nested pattern
_ : parse "(Just (x, [1, 2], \"test\"))" ≡
    Done (MkReply (MkState "" 26) (Ctr "Just" (Fan FanKind.Tup (Var (Some "x") :: Lst (Num 1 :: Num 2 :: []) :: Str "test" :: []) :: [])))
_ = refl

-- Invalid pattern (empty input)
_ : parse "" ≡ Fail (MkError 0 "Expected pattern")
_ = refl

-- Invalid pattern (unexpected character)
_ : parse "@" ≡ Fail (MkError 0 "Expected pattern")
_ = refl

-- Incomplete pattern
_ : parse "(Cons" ≡ Fail (MkError 0 "Expected pattern")
_ = refl

-- Invalid number
_ : parse "12a" ≡ Done (MkReply (MkState "a" 2) (Num 12))
_ = refl

-- Unclosed string
_ : parse "\"unclosed" ≡ Fail (MkError 0 "Expected pattern")
_ = refl

-- Invalid character literal
_ : parse "'ab'" ≡ Fail (MkError 0 "Expected pattern")
_ = refl

-- Unmatched parenthesis
_ : parse "(x, y" ≡ Fail (MkError 0 "Expected pattern")
_ = refl

-- Invalid constructor name
_ : parse "(123 x y)" ≡ Fail (MkError 0 "Expected pattern")
_ = refl

-- Empty tuple
_ : parse "()" ≡ Fail (MkError 0 "Expected pattern")
_ = refl
