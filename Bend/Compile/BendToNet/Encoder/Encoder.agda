module Bend.Compile.BendToNet.Encoder.Encoder where

open import Base.BinMap.BinMap
open import Base.List.List
open import Base.Pair.Pair
open import Bend.Fun.Term.Term using (Term)
open import Bend.Fun.Pattern.Pattern
open import Bend.Net.Net
open import Bend.Net.Port.Port

-- State for encoding Bend Terms to the internal flat inet representation
record Encoder : Set where
  constructor MkEncoder
  field
    net  : Net         -- Current state of the Net being built
    vars : BinMap Port -- Map of variable names to their corresponding Ports

