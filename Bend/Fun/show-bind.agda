module Bend.Fun.show-bind where

open import Data.Maybe.Type
open import Data.String.Type
open import Bend.Fun.Term.Type

-- Converts a Maybe String to a String representation.
-- If the Maybe String is None, it returns "*".
-- If it's Some string, it returns the string itself.
show-bind : Maybe String → String
show-bind None = "*"
show-bind (Some nam) = nam
