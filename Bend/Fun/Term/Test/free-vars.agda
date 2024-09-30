module Bend.Fun.Term.Test.free-vars where

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
open import Bend.Fun.Term.free-vars
open import Bend.Parser.Fun.parse-term

parse : String → Term
parse input = case (parse-term (new-parser-state input)) of λ where
  (Done (MkReply _ term)) → term
  (Fail err) → Era

test : String → List String
test x = free-vars (parse x)

-- Simple variable reference
_ : test "x" ≡ "x" :: []
_ = refl

-- Lambda with bound variable
_ : test "λx x" ≡ []
_ = refl

-- Lambda with free variable
_ : test "λx y" ≡ "y" :: []
_ = refl

-- Let binding
_ : test "let x = y; x" ≡ "y" :: []
_ = refl

-- Nested lambdas with multiple variables
_ : (test "λx λy (x x z)") ≡ ("z" :: [])
_ = refl

-- Complex expression with multiple bindings and free variables
_ : (test "let a = x; λb let c = y; (f (a b c z))") ≡ ("x" :: "y" :: "f" :: "z" :: [])
_ = refl

-- Variable shadowing in nested lambdas
_ : (test "λx λx x") ≡ []
_ = refl

-- Variable shadowing with both bound and free occurrences
_ : (test "λx (y (λx (x z)))") ≡ ("y" :: "z" :: [])
_ = refl

-- Multiple shadowing levels
_ : (test "λx let x = y; λx (x (let x = z; x))") ≡ ("y" :: "z" :: [])
_ = refl

-- Complex shadowing with multiple scopes
_ : (test "λx let y = x; λx (x (let x = y; x))") ≡ []
_ = refl
