module Base.Nat.add where

open import Base.Nat.Type

-- Addition of nats.
-- - m: The 1st nat.
-- - n: The 2nd nat.
-- = The sum of m and n.
add : Nat -> Nat -> Nat
add Zero     n = n
add (Succ m) n = Succ (add m n)

_+_ : Nat -> Nat -> Nat
_+_ = add

{-# BUILTIN NATPLUS _+_ #-}
