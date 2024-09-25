module Base.Buffer.get where

open import Base.Buffer.Type
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.U64.Type
open import Base.U64.Trait.Ord
open import Base.Nat.Trait.Ord
open import Base.OrdMap.get renaming (get to ordmap-get)

get : Buffer → U64 → Maybe U64
get (MkBuffer _ buffer) i = ordmap-get i buffer
