module Data.Int.Add where

open import Data.Nat.Type
open import Data.Int.Type
open import Data.Int.inc
open import Data.Int.dec
open import Data.Int.eq
open import Data.Equal.Type
open import Data.Equal.apply

-- Addition of ints.
-- - m: The 1st int.
-- - n: The 2nd int.
-- = The sum of m and n.
--
add : Int → Int → Int
add m (Pos Zero)        = m
add m (Pos (Succ n))    = inc (add m (Pos n))
add m (NegSuc (Succ n)) = dec (add m (NegSuc n))
add (_Zero) n           = n
add (Pos (Succ m)) n    = inc (add (Pos m) n)
add (NegSuc (Succ m)) n = dec (add (NegSuc m) n)

_+_ : Int → Int → Int
_+_ = add

lemma-add-0 : ∀ {m} → ( m + (+ 0)) ==  m
lemma-add-0 = refl

lemma-add1 : ∀ {m} → ((+ 0) + m) ==  m
lemma-add1 { (Pos Zero) }       = refl
lemma-add1 { (NegSuc Zero) }    = refl
lemma-add1 { (Pos (Succ n))}    = (apply inc (lemma-add1 {(Pos n)}))
lemma-add1 { (NegSuc (Succ n))} = (apply dec (lemma-add1 {(NegSuc n)}))


-- lemma-add1 : ∀ {m} → ((+ 0) + m) ==  (NegSuc n)
-- dec (add (+ 0) (NegSuc n)) == NegSuc (Succ n)
-- dec (add (+ 0) (NegSuc n))


-- lemma-add-comm : ∀ {m n} → (m + n) == (n + m)
-- lemma-add-comm {Pos Zero} {n} = {!!}
