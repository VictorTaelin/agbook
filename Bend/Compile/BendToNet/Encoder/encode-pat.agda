
module Bend.Compile.BendToNet.Encoder.encode-pat where

open import Data.List.Type
open import Data.List.map
open import Data.Maybe.Type
open import Data.Maybe.bind
open import Data.Pair.Type
open import Data.String.Type
open import Data.String.append
open import Bend.Fun.Pattern.Type
open import Bend.Net.Port.Type
open import Bend.Net.NodeKind.Type
open import Bend.Net.NodeKind.from-fan-kind
open import Bend.Compile.BendToNet.Encoder.Type
open import Bend.Compile.BendToNet.Encoder.link
open import Bend.Compile.BendToNet.Encoder.link-var
open import Bend.Compile.BendToNet.Encoder.new-node

encode-pat : Encoder → Pattern → Port → Maybe Encoder
encode-pat enc (Pattern.Var None)        up =
  let (node , enc) = new-node Era enc in
  link enc up (MkPort node 0)
encode-pat enc (Pattern.Var (Some name)) up = link-var enc name up
encode-pat enc (Pattern.Chn name)        up = link-var enc ("$" ++ name) up
encode-pat enc (Pattern.Fan kind pats)   up = enc-children enc (from-fan-kind kind) up pats
  where
    enc-children : Encoder → NodeKind → Port → List Pattern → Maybe Encoder
    enc-children enc kind up [] = None
    enc-children enc kind up (pat :: []) = encode-pat enc pat up
    enc-children enc kind up (pat :: pats) = do
      let (node , enc) = new-node kind enc
      enc <- link enc up (MkPort node 0)
      enc <- encode-pat enc pat (MkPort node 1)
      enc-children enc kind (MkPort node 2) pats

encode-pat enc (Pattern.Ctr _ _)         up = None
encode-pat enc (Pattern.Num _)           up = None
encode-pat enc (Pattern.Lst _)           up = None
encode-pat enc (Pattern.Str _)           up = None
