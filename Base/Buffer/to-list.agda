module Base.Buffer.to-list where

open import Base.Buffer.Buffer
open import Base.OrdMap.values
open import Base.List.List
open import Base.U64.U64

to-list : Buffer → List U64
to-list (MkBuffer _ buffer) = values buffer
