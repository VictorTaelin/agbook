module Base.QuadTree.query where

open import Base.Bool.if
open import Base.List.List
open import Base.List.append
open import Base.List.filter
open import Base.QuadTree.Object.Object
open import Base.QuadTree.QuadTree
open import Base.QuadTree.Rectangle.Rectangle
open import Base.QuadTree.Rectangle.intersects

query : {A : Set} → QuadTree A → Rectangle → List (Object A)
query (Empty _) _ = []
query (Leaf boundary objs) range =
  if intersects boundary range then
    filter (\o → intersects (Object.bounds o) range) objs
  else
    []
query (Node boundary ne nw sw se) range =
  if (intersects boundary range) then
    (query ne range) ++ (query nw range) ++ (query sw range) ++ (query se range)
  else
    []

