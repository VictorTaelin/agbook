module Base.Parser.Examples.LambdaTerm.new where

open import Base.String.String
open import Base.Parser.State

new : String → State
new str = MkState str 0

