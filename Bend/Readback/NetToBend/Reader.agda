module Bend.Readback.NetToBend.Reader where

open import Base.BitMap.BitMap
open import Base.Bool.Bool
open import Base.List.List
open import Base.Nat.Nat
open import Base.String.String
open import Base.Unit.Unit
open import Bend.Net.Net
open import Bend.Fun.Book.Book

-- The state of readback from intermediate net to bend program
record Reader : Set where
  constructor MkReader
  field
    net       : Net            -- The HVM net to readback
    book      : Book           -- The Bend program, used to expand the succ case of switches.
    vars      : BitMap String  -- Map of variable binding ports to their generated names.
    fresh     : Nat            -- Counter for generated variable names.
    linear    : Bool           -- Whether the readback is linear or not.
    path      : List Nat       -- Slots taken when crossing dups in the current path.
    fans      : List Nat       -- List of fan nodes to be read.
    seen-fans : BitMap Unit    -- Set of fan nodes already read.
    seen      : BitMap Unit    -- Set of already read ports.
