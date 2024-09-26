module Bend.Fun.show-bind where

open import Base.Maybe.Maybe
open import Base.String.String
open import Bend.Fun.Term.Term

-- Converts a Maybe String to a String representation.
-- If the Maybe String is None, it returns "*".
-- If it's Some string, it returns the string itself.
show-bind : Maybe String -> String
show-bind None = "*"
show-bind (Some nam) = nam
