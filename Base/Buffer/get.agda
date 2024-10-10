module Base.Buffer.get where

open import Base.Buffer.Buffer
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.U64.U64
open import Base.U64.Trait.Ord
open import Base.Nat.Trait.Ord
open import Base.OrdMap.get renaming (get to ordmap-get)

get : Buffer → U64 → Maybe U64
get (MkBuffer _ buffer) i = ordmap-get i buffer

