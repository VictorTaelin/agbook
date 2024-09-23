module Base.ALL where

-- Namespaced Modules
-- ------------------

module Bool where
  open import Base.Bool.ALL public

module Char where
  open import Base.Char.ALL public

module String where
  open import Base.String.ALL public

module Nat where
  open import Base.Nat.ALL public

module Int where
  open import Base.Int.ALL public

module Float where
  open import Base.Float.ALL public

module U64 where
  open import Base.U64.ALL public

module List where
  open import Base.List.ALL public

module Pair where
  open import Base.Pair.ALL public

module Maybe where
  open import Base.Maybe.ALL public

module Result where
  open import Base.Result.ALL public

-- module JSON where
  -- open import Base.JSON.ALL public

module Bits where
  open import Base.Bits.ALL public

module Empty where
  open import Base.Empty.ALL public

module Equal where
  open import Base.Equal.ALL public

module Function where
  open import Base.Function.ALL public

module IO where
  open import Base.IO.ALL public

module BitMap where
  open import Base.BitMap.ALL public

module Ordering where
  open import Base.Ordering.ALL public

module Parser where
  open import Base.Parser.ALL public

module Queue where
  open import Base.Queue.ALL public

module TreeBin where
  open import Base.TreeBin.ALL public

module Unit where
  open import Base.Unit.ALL public

-- module AVL where
  -- open import Base.AVL.ALL public

-- Traits
-- ------

open import Base.Trait.Add public
open import Base.Trait.Eq public
open import Base.Trait.Monad public
open import Base.Trait.Monoid public
open import Base.Trait.Ord public
open import Base.Trait.Show public

-- Types and Constructors
-- ----------------------
-- FIXME: can we re-export types and constructors in a way that avoids the type
-- prefix (i.e., Bool instead of Bool.Bool), and without re-defining them

Bool : Set
Bool = Bool.Bool

True : Bool
True = Bool.True

False : Bool
False = Bool.False

Char : Set
Char = Char.Char

String : Set
String = String.String

Nat : Set
Nat = Nat.Nat

Zero : Nat
Zero = Nat.Zero

Succ : Nat → Nat
Succ = Nat.Succ

Int : Set
Int = Int.Int

Pos : Nat → Int
Pos = Int.Pos

NegSuc : Nat → Int
NegSuc = Int.NegSuc

Float : Set
Float = Float.Float

U64 : Set
U64 = U64.U64

List : ∀ {a} → Set a → Set a
List = List.List

[] : ∀ {a} {A : Set a} → List A
[] = List.[]

_::_ : ∀ {a} {A : Set a} → A → List A → List A
_::_ = List._::_
infixr 5 _::_

Sigma : ∀ {a b} (A : Set a) (B : A → Set b) → Set (a Agda.Primitive.⊔ b)
Sigma = Pair.Sigma

Σ : ∀ {a b} (A : Set a) (B : A → Set b) → Set (a Agda.Primitive.⊔ b)
Σ = Pair.Σ

Pair : ∀ {a b} → Set a → Set b → Set (a Agda.Primitive.⊔ b)
Pair = Pair.Pair

_,_ : ∀ {a b} {A : Set a} {B : A → Set b} → (x : A) → B x → Sigma A B
_,_ = Pair._,_
infixr 4 _,_

Maybe : ∀ {a} → Set a → Set a
Maybe = Maybe.Maybe

None : ∀ {a} {A : Set a} → Maybe A
None = Maybe.None

Some : ∀ {a} {A : Set a} → A → Maybe A
Some = Maybe.Some

Result : Set → Set → Set
Result = Result.Result

Done : ∀ {A E} → A → Result A E
Done = Result.Done

Fail : ∀ {A E} → E → Result A E
Fail = Result.Fail

-- JSON : Set
-- JSON = JSON.JSON

-- JNull : JSON
-- JNull = JSON.JNull

-- JBool : Bool → JSON
-- JBool = JSON.JBool

-- JNumber : Float → JSON
-- JNumber = JSON.JNumber

-- JString : String → JSON
-- JString = JSON.JString

-- JArray : List JSON → JSON
-- JArray = JSON.JArray

-- JObject : List (Pair String JSON) → JSON
-- JObject = JSON.JObject

Bits : Set
Bits = Bits.Bits

O : Bits → Bits
O = Bits.O

I : Bits → Bits
I = Bits.I

E : Bits
E = Bits.E

Empty : Set
Empty = Empty.Empty

_===_ : ∀ {a} {A : Set a} → A → A → Set a
_===_ = Equal._===_

refl : ∀ {a} {A : Set a} {x : A} → x === x
refl = Equal.refl

IO : Set → Set
IO = IO.IO

BitMap : Set → Set
BitMap = BitMap.BitMap

Ordering : Set
Ordering = Ordering.Ordering

LT : Ordering
LT = Ordering.LT

EQ : Ordering
EQ = Ordering.EQ

GT : Ordering
GT = Ordering.GT

Parser : Set → Set
Parser = Parser.Parser

Queue : ∀ {a} → Set a → Set a
Queue = Queue.Queue

MkQueue : ∀ {a} {A : Set a} → List A → List A → Queue A
MkQueue = Queue.MkQueue

TreeBin : Set → Set
TreeBin = TreeBin.TreeBin

Node : ∀ {A} → A → TreeBin A → TreeBin A → TreeBin A
Node = TreeBin.Node

Leaf : ∀ {A} → TreeBin A
Leaf = TreeBin.Leaf

Unit : Set
Unit = Unit.Unit

unit : Unit
unit = Unit.unit

-- AVL : Set → Set → Set
-- AVL = AVL.AVL

-- AVLLeaf : ∀ {A B} → AVL A B
-- AVLLeaf = AVL.Leaf

-- AVLNode : ∀ {A B} → Pair A B → AVL.Balance → AVL A B → AVL A B → AVL A B
-- AVLNode = AVL.Node
