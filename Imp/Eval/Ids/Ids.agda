module Imp.Eval.Ids.Ids where

open import Base.Buffer.Buffer
open import Base.U64.U64

-- The ids a thread has access to.
record Ids : Set where
  constructor MkIds
  field
    bid : U64
    tid : U64
    gid : U64
