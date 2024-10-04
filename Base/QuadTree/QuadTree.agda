module Base.QuadTree.QuadTree where

open import Base.V2.V2
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.F64.F64
open import Base.F64.lt
open import Base.F64.gt
open import Base.F64.lte
open import Base.F64.gte
open import Base.F64.add
open import Base.Maybe.Maybe
open import Base.Pair.Pair

open import Base.Bool.if
open import Base.Bool.not
open import Base.Bool.or
open import Base.F64.div
open import Base.List.List
open import Base.List.filter
open import Base.List.map
open import Base.List.append
open import Base.List.foldr
open import Base.Nat.Nat
import Base.Nat.lte as Nat
open import Base.List.length
open import Base.IO.ALL
open import Base.Unit.Unit
open import Base.List.mmap

record Rectangle : Set where
  constructor mkRectangle
  field
    minX : F64
    minY : F64
    maxX : F64
    maxY : F64


record Object (A : Set) : Set where
  constructor mkObject
  field
    bounds : Rectangle
    value  : A

pointInRect : V2 → Rectangle → Bool
pointInRect p r = do
  let xp = V2.x p
  let yp = V2.y p
  let x1 = Rectangle.minX r
  let y1 = Rectangle.minY r
  let x2 = Rectangle.maxX r
  let y2 = Rectangle.maxY r
  (xp >= x1) && (xp <= x2) && (yp >= y1) && (yp <= y2)


rectIntersects : Rectangle → Rectangle → Bool
rectIntersects r1 r2 = do
  let x11 = Rectangle.minX r1
  let y11 = Rectangle.minY r1
  let x12 = Rectangle.maxX r1
  let y12 = Rectangle.maxY r1
  let x21 = Rectangle.minX r2
  let y21 = Rectangle.minY r2
  let x22 = Rectangle.maxX r2
  let y22 = Rectangle.maxY r2
  not ((x12 < x21) || (x11 > x22) || (y12 < y21) || (y11 > y22))


data QuadTree (A : Set) : Set where
  Empty : Rectangle → QuadTree A
  Leaf  : Rectangle → List (Object A) → QuadTree A
  Node  : Rectangle → QuadTree A → QuadTree A → QuadTree A → QuadTree A → QuadTree A

subdivide : Rectangle → Pair (Pair Rectangle Rectangle) (Pair Rectangle Rectangle)
subdivide r = do
  let x1 = Rectangle.minX r
  let y1 = Rectangle.minY r
  let x2 = Rectangle.maxX r
  let y2 = Rectangle.maxY r
  let midX = (x1 + x2) / 2.0
  let midY = (y1 + y2) / 2.0
  let ne = mkRectangle midX midY x2 y2
  let nw = mkRectangle x1 midY midX y2
  let sw = mkRectangle x1 y1 midX midY
  let se = mkRectangle midX y1 x2 midY
  ( ne , nw ) , (sw , se)

capacity : Nat
capacity = 4

{-# TERMINATING #-}
mutual
  distribute : {A : Set} → Object A → QuadTree A → Rectangle → QuadTree A
  distribute obj tree rect =
    if rectIntersects (Object.bounds obj) rect then
      insert tree obj
    else
      tree

  insert : {A : Set} → QuadTree A → Object A → QuadTree A
  insert (Empty boundary) obj with (rectIntersects (Object.bounds obj) boundary)
  ... | True  = Leaf boundary (obj :: [])
  ... | False = Empty boundary

  insert (Leaf boundary objs) obj with (rectIntersects (Object.bounds obj) boundary)
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

  insert (Node boundary ne nw sw se) obj with (rectIntersects (Object.bounds obj) boundary)
  ... | True = do
    let ( (neRect , nwRect) , (swRect , seRect) ) = subdivide boundary
    let ne1 = if (rectIntersects (Object.bounds obj) neRect) then insert ne obj else ne
    let nw1 = if (rectIntersects (Object.bounds obj) nwRect) then insert nw obj else nw
    let sw1 = if (rectIntersects (Object.bounds obj) swRect) then insert sw obj else sw
    let se1 = if (rectIntersects (Object.bounds obj) seRect) then insert se obj else se
    Node boundary ne1 nw1 sw1 se1
  ... | False = Node boundary ne nw sw se
    

query : {A : Set} → QuadTree A → Rectangle → List (Object A)
query (Empty _) _ = []
query (Leaf boundary objs) range =
  if rectIntersects boundary range then
    filter (\o → rectIntersects (Object.bounds o) range) objs
  else
    []
query (Node boundary ne nw sw se) range =
  if (rectIntersects boundary range) then
    (query ne range) ++ (query nw range) ++ (query sw range) ++ (query se range)
  else
    []


main : IO Unit
main = do
  let boundary = mkRectangle 0.0 0.0 100.0 100.0
  let qtree = Empty boundary
  let obj1 = mkObject (mkRectangle 10.0 10.0 20.0 20.0) "Obj1"
  let obj2 = mkObject (mkRectangle 15.0 15.0 25.0 25.0) "Obj2"
  let obj3 = mkObject (mkRectangle 50.0 50.0 60.0 60.0) "Obj3"
  let qtree = insert qtree obj1
  let qtree = insert qtree obj2
  let qtree = insert qtree obj3 
  let res = query qtree (mkRectangle 5.0 5.0 30.0 30.0)
  let values = map Object.value res
  print ("Objects found in range: ")  
  mmap print values
  print ("done")

