module Bend.Parser.Fun.Test.parse-term where

open import Base.Parser.Parser
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Error
open import Bend.Parser.Fun.parse-term
open import Bend.Fun.Term.Term
open import Bend.Fun.FanKind.FanKind as FanKind
open import Bend.Fun.dsl
open import Base.Function.case
open import Base.Equal.Equal
open import Base.String.String
open import Base.Maybe.Maybe
open import Base.Result.Result
open import Base.List.List
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Bool.Bool

parse : String -> Result (Reply Term) Error
parse input = parse-term (MkState input 0)

ok : String -> Nat -> Term -> Result (Reply Term) Error
ok input index expected = Done (MkReply (MkState input index) expected)

-- Variable
_ : parse "x" ≡ ok "" 1 (v' "x")
_ = refl

-- Lambda
_ : parse "λx x" ≡ ok "" 4 (λ' (p' "x") (v' "x"))
_ = refl

-- Application
_ : parse "(f x)" ≡ ok "" 5 (v' "f" $ v' "x")
_ = refl

-- Nested application
_ : parse "(f (g x))" ≡ ok "" 9 (v'"f" $ (v'"g" $ v'"x"))
_ = refl

-- Let expression
_ : parse "let x = y; z" ≡ ok "" 12 (let' p'"x" := v'"y" in' v'"z")
_ = refl

-- List
_ : parse "[1, 2, 3]" ≡ ok "" 9 (lst (#u 1 :: #u 2 :: #u 3 :: []))
_ = refl

-- Tuple
_ : parse "(x, y, z)" ≡ ok "" 9 (tup (v' "x" :: v' "y" :: v' "z" :: []))
_ = refl

-- Superposition
_ : parse "{x y}" ≡ ok "" 5 (sup (v' "x" :: v' "y" :: []))
_ = refl

-- String
_ : parse "\"hello\"" ≡ ok "" 7 (str "hello")
_ = refl

-- Number
_ : parse "42" ≡ ok "" 2 (#u 42)
_ = refl

-- Oper
_ : parse "(+ x 1)" ≡ ok "" 7 ((+ (v' "x") (#u 1)))
_ = refl
_ : parse "(- x 1)" ≡ ok "" 7 ((- (v' "x") (#u 1)))
_ = refl
_ : parse "(* x 1)" ≡ ok "" 7 ((* (v' "x") (#u 1)))
_ = refl
_ : parse "(< x 1)" ≡ ok "" 7 ((< (v' "x") (#u 1)))
_ = refl
_ : parse "(<< x 1)" ≡ ok "" 8 ((<< (v' "x") (#u 1)))
_ = refl
_ : parse "(<= x 1)" ≡ ok "" 8 ((<= (v' "x") (#u 1)))
_ = refl
_ : parse "(== x 1)" ≡ ok "" 8 ((== (v' "x") (#u 1)))
_ = refl

-- Match expression
_ : parse "match x { | Some: y | None: z }" ≡ 
    ok "" 31 (match' (n' "x") := (v' "x") with' [] in' ((n' "Some" , v' "y") :: (n' "None", v' "z") :: []))
_ = refl

-- Switch expression
_ : parse "switch x { 0: y; 1: z; _: w }" ≡
    ok "" 29 (switch' (n' "x") := (v' "x") with' [] in' (v' "y" :: v' "z" :: v' "w" :: []))
_ = refl

-- Fold expression
_ : parse "fold x { | Nil : y | Cons : (f h t) }" ≡
    ok "" 37 (fold' (n' "x") := (v' "x") with' []
              in' ((n' "Nil" , v' "y") :: (n' "Cons" , (v' "f" $ v' "h" $ v' "t")) :: []))
_ = refl

-- Bend expression
_ : parse "bend x=0, y=1 { when (< x 10): ((+ x 1), (* y 2)) else: (x, y) }" ≡ 
    ok "" 64 (bend' ((n' "x", #u 0) :: (n' "y", #u 1) :: [])
      when' (< (v' "x") (#u 10))
      step' (tup (+  (v' "x") (#u 1) :: * (v' "y") (#u 2) :: []))
      else' (tup (v' "x" :: v' "y" :: [])))
_ = refl

-- Open expression
_ : parse "open List x; (f x)" ≡ ok "" 18 (open' "List" := "x" in' (v' "f" $ v' "x"))
_ = refl

-- Link expression
_ : parse "$x" ≡ ok "" 2 (v'$ "x")
_ = refl

-- Invalid input
_ : parse "(" ≡ Fail (MkError 1 "Expected term")
_ = refl
