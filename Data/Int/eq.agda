module Data.Int.eq where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Bool.Type
open import Data.Trait.Eq public

instance
  EqInt : Eq Int
  EqInt = record
    { eq = eq-int
    ; neq = neq-int
    }
    where
      eq-int : Int → Int → Bool
      eq-int (Pos     Zero) (Pos      Zero) = True
      eq-int (Pos (Succ n)) (Pos  (Succ m)) = eq (Pos n) (Pos m)
      eq-int (Neg     Zero) (Neg      Zero) = True
      eq-int (Neg (Succ n)) (Neg  (Succ m)) = eq (Neg n) (Neg m)
      eq-int (Pos        _) (Neg         _) = False
      eq-int (Neg        _) (Pos         _) = False
      eq-int (           _) (            _) = False

      neq-int : Int → Int → Bool
      neq-int (Pos _) (Neg _) = True
      neq-int (Neg _) (Pos _) = True
      neq-int (Pos Zero) (Pos Zero) = False
      neq-int (Neg Zero) (Neg Zero) = False
      neq-int (Pos (Succ _)) (Pos Zero) = True
      neq-int (Neg (Succ _)) (Neg Zero) = True
      neq-int (Pos Zero) (Pos (Succ _)) = True
      neq-int (Neg Zero) (Neg (Succ _)) = True
      neq-int (Pos (Succ n)) (Pos (Succ m)) = neq (Pos n) (Pos m)
      neq-int (Neg (Succ n)) (Neg (Succ m)) = neq (Neg n) (Neg m)




