module Bend.Readback.NetToBend.gen-var where

open import Base.BitMap.get
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.String.String
open import Bend.nat-to-name
open import Bend.Net.Port.Port
open import Bend.Net.Port.to-bits
open import Bend.Readback.NetToBend.Reader

-- Given a port, returns its name, or assigns a new one if it wasn't named yet.
gen-var : Reader → Port → Pair Reader String
gen-var r p = do
  let vars = Reader.vars r
  case (get vars (to-bits p)) of λ where
    (Some var) → do
      (r , var)
    None → do
      let var = nat-to-name (Reader.fresh r)
      let r   = record r { fresh = (Succ (Reader.fresh r)) }
      (r , var)
