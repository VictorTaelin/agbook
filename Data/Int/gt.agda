module Data.Int.gt where 

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Bool.Type


gt : Int → Int → Bool
gt (Pos m)        (Neg n)         = True
gt (Neg m)        (Pos n)         = False
gt (Pos Zero)     (Pos n)         = False
gt (Neg Zero)     (Neg (Succ n))  = True
gt (Neg Zero)     (Neg Zero)      = False
gt (Pos (Succ m)) (Pos Zero)      = True
gt (Neg (Succ m)) (Neg Zero)      = False
gt (Pos (Succ m)) (Pos (Succ n))  = gt (Pos m) (Pos n)
gt (Neg (Succ m)) (Neg (Succ n))  = gt (Neg m) (Neg n)

_>_ : Int → Int → Bool
_>_ = gt
