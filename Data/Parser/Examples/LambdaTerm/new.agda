module Data.Parser.Examples.LambdaTerm.new where

open import Data.String.Type
open import Data.Parser.State

new : String → State
new str = MkState str 0
