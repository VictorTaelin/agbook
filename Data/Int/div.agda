module Data.Int.div where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Bool.if
open import Data.Bool.and
open import Data.Nat.div renaming (div to div-nat ; div-helper to div-helper-nat ; _/_ to _//_) 
open import Data.Int.to-nat
open import Data.Int.is-pos

div : Int → Int → Int
div (Pos m) (Pos n) = Pos (div-nat m n) 
div (Pos m) (Neg n) = Neg (div-nat m (Succ n))
div (Neg m) (Pos n) = Neg (div-nat (Succ m) n)
div (Neg m) (Neg n) = Pos (div-nat (Succ m) (Succ n))

_/_ : Int → Int → Int
_/_ = div
