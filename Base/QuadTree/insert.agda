module Base.QuadTree.insert where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.F64.add
open import Base.F64.div
open import Base.F64.lt
open import Base.List.List
open import Base.List.foldr
open import Base.List.length
open import Base.Pair.Pair
open import Base.QuadTree.Object.Object
open import Base.QuadTree.QuadTree
open import Base.QuadTree.Rectangle.Rectangle
open import Base.QuadTree.Rectangle.intersects
open import Base.QuadTree.Rectangle.subdivide
open import Base.V2.V2

open import Base.Nat.Nat
import Base.Nat.lte as Nat

capacity : Nat
capacity = 200

{-# TERMINATING #-}
mutual
  distribute : {A : Set} → Object A → QuadTree A → Rectangle → QuadTree A
  distribute obj tree rect =
    if intersects (Object.bounds obj) rect then
      insert tree obj
    else
      tree

  insert : {A : Set} → QuadTree A → Object A → QuadTree A
  insert (Empty boundary) obj with (intersects (Object.bounds obj) boundary)
  ... | True  = Leaf boundary (obj :: [])
  ... | False = Empty boundary

  insert (Leaf boundary objs) obj with (intersects (Object.bounds obj) boundary)
  ... | True  = do
    let newObjs = obj :: objs
    let newObjsLen = length newObjs
    if newObjsLen Nat.<= capacity
      then Leaf boundary newObjs
      else do
        let ( (neRect , nwRect ) , (swRect , seRect ) ) = subdivide boundary
        let neTree = Empty neRect
        let nwTree = Empty nwRect
        let swTree = Empty swRect
        let seTree = Empty seRect

        let neTree1 = foldr (\o t → distribute o t neRect) neTree newObjs
        let nwTree1 = foldr (\o t → distribute o t nwRect) nwTree newObjs
        let swTree1 = foldr (\o t → distribute o t swRect) swTree newObjs
        let seTree1 = foldr (\o t → distribute o t seRect) seTree newObjs
        Node boundary neTree1 nwTree1 swTree1 seTree1
  ... | False = Leaf boundary objs

  insert (Node boundary ne nw sw se) obj with (intersects (Object.bounds obj) boundary)
  ... | True = do
    let ( (neRect , nwRect) , (swRect , seRect) ) = subdivide boundary
    let ne1 = if (intersects (Object.bounds obj) neRect) then insert ne obj else ne
    let nw1 = if (intersects (Object.bounds obj) nwRect) then insert nw obj else nw
    let sw1 = if (intersects (Object.bounds obj) swRect) then insert sw obj else sw
    let se1 = if (intersects (Object.bounds obj) seRect) then insert se obj else se
    Node boundary ne1 nw1 sw1 se1
  ... | False = Node boundary ne nw sw se
 
