module Data.Int.eq where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Bool.Type

eq : Int → Int → Bool
eq (Pos     Zero) (Pos      Zero) = True
eq (Pos (Succ n)) (Pos  (Succ m)) = eq (Pos n) (Pos m)
eq (Neg     Zero) (Neg      Zero) = True
eq (Neg (Succ n)) (Neg  (Succ m)) = eq (Neg n) (Neg m)
eq (Pos        _) (Neg         _) = False
eq (Neg        _) (Pos         _) = False
eq (           _) (            _) = False

_===_ : Int → Int → Bool
_===_ = eq
