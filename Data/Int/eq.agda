module Data.Int.eq where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Bool.Type

eq : Int → Int → Bool
eq (Pos         Zero) (Pos         Zero) = True
eq (Pos     (Succ n)) (Pos     (Succ m)) = eq (Pos n) (Pos m)
eq (NegSuc      Zero) (NegSuc      Zero) = True
eq (NegSuc  (Succ n)) (NegSuc  (Succ m)) = eq (NegSuc n) (NegSuc m)
eq (Pos            _) (NegSuc         _) = False
eq (NegSuc         _) (Pos            _) = False
eq (               _) (               _) = False

_==_ : Int → Int → Bool
_==_ = eq

main = (NegSuc 0) == (Pos 0)
