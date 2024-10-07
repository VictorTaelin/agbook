module UG.Shape.Main where

open import Base.IO.ALL
open import Base.Unit.Unit
open import UG.Shape.Shape
open import UG.Shape.collide
open import Base.List.List
open import Base.Bool.show
open import Base.Bool.Bool
open import Base.V2.V2
open import UG.Shape.circle
open import UG.Shape.pentagon
open import UG.Shape.square
open import UG.Shape.triangle
open import Base.String.append


open import Base.QuadTree.Rectangle.Rectangle
open import Base.QuadTree.Rectangle.intersects
open import Base.QuadTree.QuadTree
open import Base.QuadTree.insert
open import Base.QuadTree.query
open import Base.QuadTree.Object.Object
open import Base.F64.sub
open import Base.F64.add
open import Base.List.foldl
open import Base.List.map
import Base.List.append as List
open import Base.F64.min
open import Base.String.String
open import Base.F64.max
open import Base.Pair.Pair
open import Base.Bool.if
open import Base.Bool.and
import UG.Shape.eq as Shape
import UG.Shape.neq as Shape
import UG.Shape.show as Shape

open import UG.Shape.bounding-box
open import UG.Collision.get-possible-collisions

insert-shapes : List Shape → QuadTree Shape → QuadTree Shape
insert-shapes [] qt = qt
insert-shapes (s :: ss) qt = insert-shapes ss (insert qt (MkObject (bounding-box s) s))

circ : Shape
circ = Circle (MkV2 0.0 0.0) 2.0

pent : Shape
pent = pentagon (MkV2 5.0 5.0) 3.0

sq : Shape
sq = square (MkV2 -3.0 -3.0) 2.0

tri : Shape
tri = triangle (MkV2 -1.0 -1.0) (MkV2 1.0 -1.0) (MkV2 0.0 1.0)

test1 : Bool
test1 = collide circ pent

test2 : Bool
test2 = collide circ sq

test3 : Bool
test3 = collide circ tri

test4 : Bool
test4 = collide pent sq

test5 : Bool
test5 = collide pent tri

test6 : Bool
test6 = collide sq tri

initial-qt : QuadTree Shape
initial-qt = Empty (MkRectangle -1000.0 -1000.0 1000.0 1000.0)

test-actual-collisions : List (Pair Shape Shape) → IO Unit
test-actual-collisions [] = print "No more actual collisions"
test-actual-collisions ((s1 , s2) :: cs) with collide s1 s2
... | True = do
  print ((Shape.show s1) ++ " is colliding with " ++ (Shape.show s2))
  test-actual-collisions cs
... | False = do
  test-actual-collisions cs

test-quadtree-collision : IO Unit
test-quadtree-collision = do
  let shapes = Circle (MkV2 0.0 0.0) 1.0
             :: Polygon (MkV2 5.0 5.0 :: MkV2 7.0 5.0 :: MkV2 6.0 7.0 :: [])  -- Triangle
             :: Polygon (MkV2 -3.0 -3.0 :: MkV2 -1.0 -3.0 :: MkV2 -1.0 -1.0 :: MkV2 -3.0 -1.0 :: [])  -- Square
             :: Polygon (MkV2 -1.0 -1.0 :: MkV2 1.0 -1.0 :: MkV2 0.0 1.0 :: [])  -- Triangle
             :: []
  --let shapes = circ :: tri :: sq :: pent :: []
  let filled-qt = insert-shapes shapes initial-qt
  let possible-collisions = get-possible-collisions filled-qt (MkRectangle -1000.0 -1000.0 1000.0 1000.0)

  print "Possible collisions: "
  print-possible-collisions possible-collisions

  print "Checking actual collisions: "
  test-actual-collisions possible-collisions

  where
    print-possible-collisions : List (Pair Shape Shape) → IO Unit
    print-possible-collisions [] = print "No more possible collisions"
    print-possible-collisions ((s1 , s2) :: cs) = do
      print ((Shape.show s1) ++ " may collide with " ++ (Shape.show s2))
      print-possible-collisions cs

main : IO Unit
main = do
  --print "Collision Tests:"
  --print ("Circle and Pentagon: " ++ show test1)
  --print ("Circle and Square: " ++ show test2)
  --print ("Circle and Triangle: " ++ show test3)
  --print ("Pentagon and Square: " ++ show test4)
  --print ("Pentagon and Triangle: " ++ show test5)
  --print ("Square and Triangle: " ++ show test6)
  test-quadtree-collision


