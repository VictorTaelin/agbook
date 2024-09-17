module Data.String.Test.join where

open import Data.String.Type
open import Data.String.join
open import Data.List.Type
open import Data.Equal.Type
open import Debug.Trace
open import Data.Bool.Type
open import Data.Bool.show
open import Data.String.append

-- Test case 1: Joining an empty list
test-join-empty : join "," [] === ""
test-join-empty = refl

-- Test case 2: Joining a single-element list
test-join-single : join "," ("hello" :: []) === "hello"
test-join-single = refl

-- Test case 3: Joining a two-element list
test-join-two : join ", " ("hello" :: "world" :: []) === "hello, world"
test-join-two = refl

-- Test case 4: Joining a multi-element list
test-join-multi : join "-" ("a" :: "b" :: "c" :: "d" :: []) === "a-b-c-d"
test-join-multi = refl

-- Test case 5: Joining with an empty separator
test-join-empty-sep : join "" ("x" :: "y" :: "z" :: []) === "xyz"
test-join-empty-sep = refl

-- Test case 6: Joining with a multi-character separator
test-join-multi-sep : join " and " ("apples" :: "oranges" :: "bananas" :: []) === "apples and oranges and bananas"
test-join-multi-sep = refl
