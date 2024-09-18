module HVM1.Run.interact where

open import Base.Bits.Type
open import Base.Bits.eq
open import Base.Function.case
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.Unit.Type
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
open import Base.Bool.if

interact-go : Node → Node → Run Unit
interact-go Era               Era               = pure unit
interact-go (Con ak a0 a1 a2) (Con bk b0 b1 b2) = (if ak == bk then anni else comm) ak a0 a1 a2 bk b0 b1 b2
interact-go Era               (Con bk b0 b1 b2) = eras b0 b1 b2
interact-go (Con ak a0 a1 a2) Era               = eras a0 a1 a2
interact-go (Dup ak a0 a1 a2) (Dup bk b0 b1 b2) = (if ak == bk then anni else comm) ak a0 a1 a2 bk b0 b1 b2
interact-go Era               (Dup bk b0 b1 b2) = eras b0 b1 b2
interact-go (Dup ak a0 a1 a2) Era               = eras a0 a1 a2
interact-go (Con ak a0 a1 a2) (Dup bk b0 b1 b2) = comm ak a0 a1 a2 bk b0 b1 b2
interact-go (Dup ak a0 a1 a2) (Con bk b0 b1 b2) = comm ak a0 a1 a2 bk b0 b1 b2

interact : Bits → Bits → Run Unit
interact a b = do
  m-a ← node-get a
  m-b ← node-get b
  case (m-a , m-b) of λ where
    (Some a , Some b) -> interact-go a b
    _                 -> pure unit
