module Data.Int.mul where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Int.add
open import Data.Int.inc
open import Data.Int.not
open import Data.Int.dec


mul : Int → Int → Int
mul (Pos Zero)      (n)             = (Pos Zero)
mul (Neg Zero)      (n)             = (not n)
mul (m)             (Pos Zero)      = (Pos Zero)
mul (m)             (Neg Zero)      = (not m)
mul (Pos (Succ m))  (Neg n)         = (add (Neg m) (mul (Neg m) (Pos n)))
mul (Neg m)         (Neg n)         = add (Pos (Succ m)) (mul (Pos (Succ m)) (Pos n))
mul (Pos m)         (Pos (Succ n))  = add (Pos m) (mul (Pos m) (Pos n))
mul (Neg m)         (n)             = not (mul (Pos (Succ m)) n)

_*_ : Int → Int → Int
_*_ = mul
