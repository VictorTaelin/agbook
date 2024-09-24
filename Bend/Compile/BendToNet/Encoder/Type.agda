module Bend.Compile.BendToNet.Encoder.Type where

open import Base.BitMap.Type
open import Base.List.Type
open import Base.Pair.Type
open import Bend.Fun.Term.Type using (Term)
open import Bend.Fun.Pattern.Type
open import Bend.Net.Type
open import Bend.Net.Port.Type

-- State for encoding Bend Terms to the internal flat inet representation
record Encoder : Set where
  constructor MkEncoder
  field
    net  : Net         -- Current state of the Net being built
    vars : BitMap Port -- BitMap of variable names to their corresponding Ports
