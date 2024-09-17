module Data.Int.lt where

open import Data.Int.Type
open import Data.Nat.Type
open import Data.Bool.Type


lt : Int → Int → Bool
lt (Pos m)        (Neg n)         = False
lt (Neg m)        (Pos n)         = True
lt (Pos Zero)     (Pos Zero)      = False
lt (Neg Zero)     (Neg Zero)      = False
lt (Neg Zero)     (Neg (Succ n))  = False
lt (Pos Zero)     (Pos (Succ n))  = True
lt (Pos (Succ m)) (Pos Zero)      = False
lt (Neg (Succ m)) (Neg Zero)      = True
lt (Neg (Succ m)) (Neg (Succ n))  = lt (Neg m) (Neg n)
lt (Pos (Succ m)) (Pos (Succ n))  = lt (Pos m) (Pos n)

_<_ : Int → Int → Bool
_<_ = lt
