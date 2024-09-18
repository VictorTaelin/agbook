module HVM1.Run.interact where

open import Data.Bits.Type
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Function.case
open import Data.Maybe.Type
open import Data.Pair.Type
open import Data.Unit.Type
open import HVM1.Net.Type
open import HVM1.Node.Type
open import HVM1.Port.Type
open import HVM1.Rule.anni
open import HVM1.Rule.comm
open import HVM1.Rule.eras
open import HVM1.Run.Type
open import HVM1.Run.bind
open import HVM1.Run.node-get
open import HVM1.Run.pure

interact : Bits → Bits → Run Unit
interact a b = do
  m-node-a ← node-get a
  m-node-b ← node-get b
  case (m-node-a , m-node-b) of λ where
    (Some Era , Some Era) → do
      pure unit
    (Some (Con ak a0 a1 a2) , Some (Con bk b0 b1 b2)) → do
      if ak == bk
        then anni ak a0 a1 a2 bk b0 b1 b2
        else comm ak a0 a1 a2 bk b0 b1 b2
    (Some Era , Some (Con bk b0 b1 b2)) → do
      eras b0 b1 b2
    (Some (Con ak a0 a1 a2) , Some Era) → do
      eras a0 a1 a2
    (Some (Dup ak a0 a1 a2) , Some (Dup bk b0 b1 b2)) → do
      if ak == bk
        then anni ak a0 a1 a2 bk b0 b1 b2
        else comm ak a0 a1 a2 bk b0 b1 b2
    (Some Era , Some (Dup bk b0 b1 b2)) → do
      eras b0 b1 b2
    (Some (Dup ak a0 a1 a2) , Some Era) → do
      eras a0 a1 a2
    (Some (Con ak a0 a1 a2) , Some (Dup bk b0 b1 b2)) →
      comm ak a0 a1 a2 bk b0 b1 b2
    (Some (Dup ak a0 a1 a2) , Some (Con bk b0 b1 b2)) →
      comm ak a0 a1 a2 bk b0 b1 b2
    _ → do
      pure unit
