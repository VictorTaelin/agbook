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
pointInRect p r =
  let xp = V2.x p
      yp = V2.y p
      x1 = Rectangle.minX r
      y1 = Rectangle.minY r
      x2 = Rectangle.maxX r
      y2 = Rectangle.maxY r
  in (xp >= x1) && (xp <= x2) && (yp >= y1) && (yp <= y2)


rectIntersects : Rectangle → Rectangle → Bool
rectIntersects r1 r2 =
  let x11 = Rectangle.minX r1
      y11 = Rectangle.minY r1
      x12 = Rectangle.maxX r1
      y12 = Rectangle.maxY r1
      x21 = Rectangle.minX r2
      y21 = Rectangle.minY r2
      x22 = Rectangle.maxX r2
      y22 = Rectangle.maxY r2
  in not ((x12 < x21) || (x11 > x22) || (y12 < y21) || (y11 > y22))


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


insert : {A : Set} → QuadTree A → Object A → QuadTree A
insert (Empty boundary) obj =
  if rectIntersects (Object.bounds obj) boundary then
    Leaf boundary (obj :: [])
  else
    Empty boundary


insert (Leaf boundary objs) obj = {!!}

insert (Node boundary ne nw sw se) obj = {!!}
  

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
  --let qtree = insert qtree obj1
  --let qtree = insert qtree obj2
  --let qtree = insert qtree obj3 
  -- let res = query qtree (mkRectangle 5.0 5.0 30.0 30.0)
  -- let values = map Object.value results
  -- print ("Objects found in range: ")  
  -- mmap print values
  print ("done")





