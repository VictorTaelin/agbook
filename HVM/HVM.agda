-- Rust Implementation (for context):

-- //./context//

-- Imported Agda Files (for context):

-- //./../Base/BinMap/BinMap.agda//
-- //./../Base/BinMap/contains.agda//
-- //./../Base/BinMap/del.agda//
-- //./../Base/BinMap/empty.agda//
-- //./../Base/BinMap/get.agda//
-- //./../Base/BinMap/set.agda//
-- //./../Base/BinMap/swap.agda//
-- //./../Base/BinMap/take.agda//
-- //./../Base/BinTree/BinTree.agda//
-- //./../Base/Bits/Bits.agda//
-- //./../Base/Bits/Bits.agda//
-- //./../Base/Bits/append.agda//
-- //./../Base/Bool/Bool.agda//
-- //./../Base/Function/case.agda//
-- //./../Base/List/List.agda//
-- //./../Base/List/for-given.agda//
-- //./../Base/Maybe/Maybe.agda//
-- //./../Base/Nat/Nat.agda//
-- //./../Base/Nat/apply.agda//
-- //./../Base/Nat/to-bits.agda//
-- //./../Base/Pair/Pair.agda//
-- //./../Base/Unit/Unit.agda//

-- Current Agda File:

{-# OPTIONS --type-in-type #-}

module HVM.HVM where

import Base.BinMap.contains as BinMap
import Base.BinMap.del as BinMap
import Base.BinMap.empty as BinMap
import Base.BinMap.get as BinMap
import Base.BinMap.set as BinMap
import Base.BinMap.swap as BinMap
import Base.BinMap.take as BinMap
import Base.Bits.succ as Bits
import Base.List.for-given as List
import Base.Nat.apply as Nat
import Base.Nat.to-bits as Nat
import Base.Trait.Monad as Trait

open import Base.BinMap.BinMap
open import Base.BinTree.BinTree
open import Base.Bits.Bits
open import Base.Bits.append
open import Base.Bool.Bool
open import Base.Function.case
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.Unit.Unit

-- Higher-order Virtual Machine
-- ============================

-- AST Types
-- ---------

data Pol : Set where
  Pos : Pol
  Neg : Pol

data Term : (pol : Pol) → Set where
  Var : (uid : Bits) → Term Pos
  Sub : (uid : Bits) → Term Neg
  Era : Term Pos
  Del : Term Neg
  Lam : (var : Term Neg) → (bod : Term Pos) → Term Pos
  App : (fun : Term Pos) → (arg : Term Neg) → Term Neg
  Sup : (fst : Term Pos) → (snd : Term Pos) → Term Pos
  Dup : (fst : Term Neg) → (snd : Term Neg) → Term Neg

record Pack : Set where
  constructor MkPack
  field
    root : Term Pos
    rbag : List (Pair (Term Neg) (Term Pos))

-- Net Types
-- ---------

data Typ : Set where
  VAR : Typ
  ERA : Typ
  CON : Typ
  SUP : Typ

Loc : Set
Loc = Bits

record Port : Set where
  constructor MkPort
  field
    typ : Typ
    loc : Loc
  
Redex : Set
Redex = Pair Port Port

RBag : Set
RBag = BinMap Redex

NBuf : Set
NBuf = BinMap Port

record Net : Set where
  constructor
    MkNet
  field
    rbag : RBag
    rlen : Bits
    nbuf : NBuf
    nlen : Bits

HVM : Set → Set
HVM A = Net → Maybe (Pair Net A)

-- HVM Monad
-- ---------

pure : ∀ {A : Set} → A → HVM A
pure a = λ net → Some (net , a)

_>>=_ : ∀ {A B : Set} → HVM A → (A → HVM B) → HVM B
ma >>= f = λ net -> case ma net of λ where
  (Some (net' , a)) -> f a net'
  None              -> None

_>>_ : ∀ {A B : Set} → HVM A → HVM B → HVM B
ma >> mb = ma >>= λ _ → mb

infixl 1 _>>=_ _>>_

instance
  HVM-monad : Trait.Monad HVM
  HVM-monad = record { bind = _>>=_ ; pure = pure }

-- Utils
-- -----

at : Bits → Nat → Bits
at xs Zero     = xs
at xs (Succ n) = Bits.succ (at xs n)

get : Bits → HVM Port
get loc net with BinMap.get (Net.nbuf net) loc
... | Some port = Some (net , port)
... | None      = None

take : Bits → HVM Port
take loc net with BinMap.take (Net.nbuf net) loc
... | Some (nbuf , port) = Some (record net { nbuf = nbuf } , port)
... | None               = None

swap : Bits → Port → HVM Port
swap loc port net with BinMap.swap (Net.nbuf net) loc port
... | Some (nbuf , old) = Some (record net { nbuf = nbuf } , old)
... | None              = None

-- TODO: map-nlen (applies a function to nlen and returns the old nlen)

-- map-nlen : (Bits → Bits) → HVM Bits
-- map-nlen f net =
  -- let old-nlen = Net.nlen net
      -- new-nlen = f old-nlen
      -- new-net  = record net { nlen = new-nlen }
  -- in Some (new-net , old-nlen)

-- Conversion
-- ----------

-- Allocates a node of given length and returns its location.
alloc-node : Nat → HVM Bits
alloc-node n net = do
  let old-nlen = Net.nlen net
  let new-nlen = Nat.apply n Bits.succ old-nlen
  let new-net  = record net { nlen = new-nlen }
  Some (new-net , old-nlen)

-- Allocates a redex in the rbag and returns its location.
alloc-redex : Redex → HVM Bits
alloc-redex redex net = do
  let old-rlen = Net.rlen net
  let new-rlen = Bits.succ old-rlen
  let new-rbag = BinMap.set (Net.rbag net) old-rlen redex
  let new-net  = record net { rbag = new-rbag ; rlen = new-rlen }
  Some (new-net , old-rlen)

VarMap : Set
VarMap = BinMap Bits

Host : Set
Host = Maybe Bits

unpack-var : Pol → Bits → Host → VarMap → HVM VarMap
unpack-var pol uid None vars = do
  pure vars -- unreachable
unpack-var pol uid (Some host) vars =
  case BinMap.swap vars uid host of λ where
    (Some (vars , neig)) → do
      let targ = case pol of λ{ Pos → neig ; Neg → host }
      swap host (MkPort VAR targ)
      swap targ (MkPort VAR targ)
      pure vars
    None → pure vars 

unpack-term : ∀{p} → Term p → Host → VarMap → HVM (Pair VarMap Port)
unpack-term (Lam var bod) host vars = do
  lam <- alloc-node 3
  (vars , var) <- unpack-term var (Some (at lam 1)) vars
  (vars , bod) <- unpack-term bod (Some (at lam 2)) vars
  swap (at lam 1) var
  swap (at lam 2) bod
  pure (vars , MkPort CON lam)
unpack-term (App fun arg) host vars = do
  app <- alloc-node 2
  (vars , fun) <- unpack-term fun (Some (at app 0)) vars
  (vars , arg) <- unpack-term arg (Some (at app 1)) vars
  swap (at app 0) fun
  swap (at app 1) arg
  pure (vars , MkPort CON app)
unpack-term (Sup fst snd) host vars = do
  sup <- alloc-node 2
  (vars , fst) <- unpack-term fst (Some (at sup 0)) vars
  (vars , snd) <- unpack-term snd (Some (at sup 1)) vars
  swap (at sup 0) fst
  swap (at sup 1) snd
  pure (vars , MkPort SUP sup)
unpack-term (Dup fst snd) host vars = do
  dup <- alloc-node 2
  (vars , fst) <- unpack-term fst (Some (at dup 0)) vars
  (vars , snd) <- unpack-term snd (Some (at dup 1)) vars
  swap (at dup 0) fst
  swap (at dup 1) snd
  pure (vars , (MkPort CON dup))
unpack-term (Var uid) host vars = do
  vars <- unpack-var Pos uid host vars
  pure (vars , MkPort VAR E)
unpack-term (Sub uid) host vars = do
  vars <- unpack-var Neg uid host vars
  pure (vars , MkPort VAR E)
unpack-term Era host vars = do
  pure (vars , (MkPort ERA E))
unpack-term Del host vars = do
  pure (vars , (MkPort ERA E))

unpack-redex : Pair (Term Neg) (Term Pos) → VarMap → HVM VarMap
unpack-redex (neg , pos) vars = do
  (vars , neg) <- unpack-term neg None vars
  (vars , pos) <- unpack-term pos None vars
  alloc-redex (neg , pos)
  pure vars

unpack-pack : Pack → VarMap → HVM (Pair VarMap Port)
unpack-pack (MkPack root rbag) vars = do
  (vars , root) <- unpack-term root None vars
  vars <- List.for-given rbag vars λ vars x → unpack-redex x vars
  pure (vars , root)

boot : Pack → HVM Unit
boot pack = do
  (_ , root) <- unpack-pack pack BinMap.empty
  swap E root
  pure unit

-- Linking
-- -------

{-# TERMINATING #-}
link : Port → Port → HVM Unit
link a (MkPort VAR loc) = do
  got <- swap loc a
  case got of λ where
    (MkPort VAR _) -> pure unit
    b -> do a <- take loc; link a b
link (MkPort VAR loc) b = do
  got <- swap loc b
  case got of λ where
    (MkPort VAR _) -> pure unit
    a -> do b <- take loc; link a b
link a b = pure unit

-- Interaction
-- -----------

interact : Port → Port → HVM Unit

-- (Lam arg ret) ~ (Lam var bod)
-- ----------------------------- LAM-APP
-- var ~ arg
-- ret ~ bod
interact (MkPort CON app) (MkPort CON lam) = do
  arg <- get (at app 1)
  ret <- get (at app 2)
  var <- get (at lam 1)
  bod <- get (at lam 2)
  link var arg
  link ret bod
  pure unit

interact a b = do
  pure unit
