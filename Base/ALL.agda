module Base.ALL where

-- Namespaced Modules
-- ------------------

import Base.Bool.ALL
module Bool = Base.Bool.ALL
open Bool using (Bool ; True ; False) hiding (module Bool) public

import Base.Char.ALL
module Char = Base.Char.ALL
open Char using (Char) public

import Base.String.ALL
module String = Base.String.ALL
open String using (String) public

import Base.Nat.ALL
module Nat = Base.Nat.ALL
open Nat using (Nat ; Zero ; Succ) hiding (module Nat) public

import Base.Int.ALL
module Int = Base.Int.ALL
open Int using (Int ; Pos ; NegSuc) hiding (module Int) public

import Base.F64.ALL
module F64 = Base.F64.ALL
open F64 using (F64) public

import Base.U64.ALL
module U64 = Base.U64.ALL
open U64 using (U64) public

import Base.List.ALL
module List = Base.List.ALL
open List using (List ; [] ; _::_) hiding (module List) public

import Base.Pair.ALL
module Pair = Base.Pair.ALL
open Pair using (Sigma ; Σ ; Pair ; _,_) public

import Base.Maybe.ALL
module Maybe = Base.Maybe.ALL
open Maybe using (Maybe ; None ; Some) hiding (module Maybe) public

import Base.Result.ALL
module Result = Base.Result.ALL
open Result using (Result ; Done ; Fail) hiding (module Result) public

import Base.JSON.ALL
module JSON = Base.JSON.ALL
open JSON using (JSON ; JNull ; JBool ; JNumber ; JString ; JArray ; JObject) hiding (module JSON) public

import Base.Bits.ALL
module Bits = Base.Bits.ALL
open Bits using (Bits ; O ; I ; E) hiding (module Bits) public

import Base.Empty.ALL
module Empty = Base.Empty.ALL
open Empty using (Empty) hiding (module Empty) public

import Base.Equal.ALL
module Equal = Base.Equal.ALL
open Equal using (_≡_ ; refl) public

import Base.Function.ALL
module Function = Base.Function.ALL

import Base.IO.ALL
module IO = Base.IO.ALL
open IO using (IO) public

import Base.BitMap.ALL
module BitMap = Base.BitMap.ALL
open BitMap using (BitMap) public

import Base.Ordering.ALL
module Ordering = Base.Ordering.ALL
open Ordering using (Ordering ; LT ; EQ ; GT) hiding (module Ordering) public

import Base.Parser.ALL
module Parser = Base.Parser.ALL
open Parser using (Parser) public

import Base.Queue.ALL
module Queue = Base.Queue.ALL
open Queue using (Queue ; MkQueue) hiding (module Queue) public

import Base.BinTree.ALL
module BinTree = Base.BinTree.ALL
open BinTree using (BinTree ; Node ; Leaf) hiding (module BinTree) public

import Base.Unit.ALL
module Unit = Base.Unit.ALL
open Unit using (Unit ; unit) hiding (module Unit) public

import Base.V2.ALL
module V2 = Base.V2.ALL

import Base.AVLTree.ALL
module AVLTree = Base.AVLTree.ALL
open AVLTree using (AVLTree ; Leaf ; Node) hiding (module AVLTree) public

-- Traits
-- ------

open import Base.Trait.ALL public
