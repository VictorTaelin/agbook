module Data.Int.sub where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Int.inc
open import Data.Int.dec

-- subtraction of ints 
-- - m: the 1st int
-- - n: the 2nd int
-- = the subtraction of m and n

sub : Int     →     Int     →         Int
sub (m)             (Pos Zero)      = (m)
sub (Pos Zero)      (Pos (Succ n))  = (Neg n)
sub (Pos (Succ m))  (Pos (Succ n))  = (sub (Pos m) (Pos n))
sub (Pos (Succ m))  (Neg (Succ n))  = (inc (sub (Pos (Succ m)) ((Neg n))))
sub (Neg (Succ m))  (Pos (Succ n))  = (dec (sub (Neg (Succ m)) (Pos n)))
sub (Neg (Succ m))  (Neg n)         = (sub (Neg (m)) (inc (Neg n)))
sub (Pos Zero)      (Neg n)         = (Pos (Succ n))
sub (Neg Zero)      (Neg n)         = (Pos n)
sub (Neg Zero)      (Pos (Succ n))  = (dec (Neg n))
sub (Pos m)         (Neg Zero)      = (inc (Pos m))
sub (Neg m)         (Neg Zero)      = (dec (Neg m))

_-_ : Int → Int → Int
_-_ = sub
