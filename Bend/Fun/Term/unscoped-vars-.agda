module Bend.Fun.Term.unscoped-vars- where

open import Base.Function.case
open import Base.List.List
open import Base.String.String
open import Base.Result.Result
open import Base.Equal.Equal
open import Base.Pair.Pair
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Bend.Fun.Term.Term renaming (List to List')
open import Bend.Fun.Term.unscoped-vars
open import Bend.Parser.Fun.parse-term

parse : String → Term
parse input = case (parse-term (new-parser-state input)) of λ where
  (Done (MkReply _ term)) → term
  (Fail err) → Era

test : String → Pair (List String) (List String)
test x = unscoped-vars (parse x)

-- Simple variable reference
_ : test "$x" ≡ ([] , "x" :: [])
_ = refl

-- Lambda with bound variable
_ : test "λ$x $x" ≡ ("x" :: [] , "x" :: [])
_ = refl

-- Lambda with free variable
_ : test "λ$x $y" ≡ ("x" :: [] , "y" :: [])
_ = refl

-- Let binding
_ : test "let $x = $y; $x" ≡ ("x" :: [] , "y" :: "x" :: [])
_ = refl

-- Nested lambdas with multiple variables
-- Note: This term is invalid, but that's irrelevant for unscoped-vars
_ : test "λ$x λ$y ($x $x $z)" ≡ ("x" :: "y" :: [] , "x" :: "x" :: "z" :: [])
_ = refl

-- Variable shadowing in nested lambdas
-- Note: Just like the one above, this term is invalid
_ : test "λ$x λ$x $x" ≡ ("x" :: "x" :: [] , "x" :: [])
_ = refl

-- Unscoped and scoped variables with the same name
_ : test "λ$x (y (λx ($x $z)))" ≡ ("x" :: [] , "x" :: "z" :: [])
_ = refl

