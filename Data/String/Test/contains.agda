module Data.String.Test.contains where

open import Data.String.Type
open import Data.String.contains
open import Data.Bool.Type
open import Data.Equal.Type

-- Contains tests
_ : contains "hello world" "hello" === True
_ = refl

_ : contains "hello world" "world" === True
_ = refl

_ : contains "hello world" "o w" === True
_ = refl

_ : contains "hello world" "hello world" === True
_ = refl

_ : contains "hello world" "" === True
_ = refl

_ : contains "hello world" "universe" === False
_ = refl

_ : contains "" "" === True
_ = refl

_ : contains "hello" "hello world" === False
_ = refl

_ : contains "hello" "Hello" === False  -- Case-sensitive
_ = refl
