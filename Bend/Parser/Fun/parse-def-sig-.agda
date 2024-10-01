module Bend.Parser.Fun.parse-def-sig- where

open import Base.Parser.Parser
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Error
open import Bend.Parser.Fun.parse-def-sig
open import Bend.Fun.Type.Type
open import Base.Function.case
open import Base.Equal.Equal
open import Base.String.String
open import Base.Maybe.Maybe
open import Base.Result.Result
open import Base.List.List
open import Base.Pair.Pair
open import Base.Nat.Nat
open import Base.Bool.Bool

parse : String → Result (Reply (Pair String (Pair (List String) Type))) Error
parse input = parse-def-sig (MkState input 0)

ok : String → Nat → Pair String (Pair (List String) Type) → Result (Reply (Pair String (Pair (List String) Type))) Error
ok input index expected = Done (MkReply (MkState input index) expected)

-- Simple function signature
_ : parse "f : Any" ≡ ok "" 7 ("f" , ([] , Any))
_ = refl

-- Function with one argument
_ : parse "add x : Nat -> Nap" ≡ ok "" 18 ("add" , ("x" :: [] , Arr (Var "Nat") (Var "Nap")))
_ = refl

-- Function with multiple arguments
_ : parse "sum x y z : Nat -> Nat -> Nat -> Nat" ≡
    ok "" 35 ("sum" , ("x" :: "y" :: "z" :: [] ,
               Arr (Var "Nat") (Arr (Var "Nat") (Arr (Var "Nat") (Var "Nat")))))
_ = refl

-- Function with parentheses
_ : parse "(pair x y) : A -> B -> (A, B)" ≡
    ok "" 27 ("pair" , ("x" :: "y" :: [] ,
               Arr (Var "A") (Arr (Var "B") (Tup (Var "A" :: Var "B" :: [])))))
_ = refl

-- Function with typed arguments
_ : parse "(map f xs) : (A -> B) -> List A -> List B" ≡
    ok "" 39 ("map" , ("f" :: "xs" :: [] ,
               Arr (Arr (Var "A") (Var "B"))
                   (Arr (Ctr "List" (Var "A" :: []))
                        (Ctr "List" (Var "B" :: [])))))
_ = refl

-- Function with untyped and typed arguments
_ : parse "zipWith f xs (ys : List B) : (A -> B -> C) -> List A -> List B -> List C" ≡
    ok "" 70 ("zipWith" , ("f" :: "xs" :: "ys" :: [] ,
               Arr (Arr (Var "A") (Arr (Var "B") (Var "C")))
                   (Arr (Ctr "List" (Var "A" :: []))
                        (Arr (Ctr "List" (Var "B" :: []))
                             (Ctr "List" (Var "C" :: []))))))
_ = refl

-- Function with complex return type
_ : parse "complex : A -> B -> (C -> D) -> ((A, B), (C, D))" ≡
    ok "" 46 ("complex" , ([] ,
               Arr (Var "A")
                   (Arr (Var "B")
                        (Arr (Arr (Var "C") (Var "D"))
                             (Tup ((Tup (Var "A" :: Var "B" :: [])) ::
                                   (Tup (Var "C" :: Var "D" :: [])) :: []))))))
_ = refl

-- Invalid input
_ : parse "f :" ≡ Fail (MkError 3 "Expected type")
_ = refl

_ : parse "f x y" ≡ Fail (MkError 5 "Expected ':'")
_ = refl
